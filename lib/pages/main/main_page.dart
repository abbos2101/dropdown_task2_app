import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2_app/data/api/task_api.dart';
import 'package:task2_app/data/models/simple_model.dart';
import 'package:task2_app/data/utils/colors.dart';
import 'package:task2_app/di/di.dart';
import 'package:task2_app/dialogs/custom_bottom_list_dialog.dart';
import 'package:task2_app/dialogs/custom_message_dialog.dart';
import 'package:task2_app/widgets/custom_appbar.dart';
import 'package:task2_app/widgets/custom_button.dart';
import 'package:task2_app/widgets/custom_dropdown.dart';
import 'package:task2_app/widgets/custom_safearea.dart';
import 'bloc/main_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final bloc = MainBloc()..add(MainCheckLocalEvent());
  final taskApi = di.get<TaskApi>();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: CustomSafeArea(
        color: MyColors.blue,
        child: Scaffold(
          backgroundColor: MyColors.background,
          appBar: const CustomAppbar(text: "TASK 2"),
          body: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state is MainInitialState) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomDropdown(
                                title: "Viloyatni tanlang",
                                value: state.region.title,
                                enabled: state.regEnabled,
                                onTap: () {
                                  CustomBottomListDialog.show<SimpleModel>(
                                    context,
                                    title: "Viloyatni tanlang",
                                    onGetItems: () async =>
                                        await taskApi.getRegions(),
                                    map: (it) => it.title,
                                    onTapItem: (it) {
                                      bloc.add(MainTapItemRegEvent(it));
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 12),
                              CustomDropdown(
                                title: "Tumanni tanlang",
                                value: state.district.title,
                                enabled: state.disEnabled,
                                onTap: () {
                                  CustomBottomListDialog.show<SimpleModel>(
                                    context,
                                    title: "Tumanni tanlang",
                                    onGetItems: () async {
                                      return await taskApi.getDistricts(
                                        state.region.id,
                                      );
                                    },
                                    map: (it) => it.title,
                                    onTapItem: (it) {
                                      bloc.add(MainTapItemDisEvent(it));
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 12),
                              CustomDropdown(
                                title: "Bo'limni tanlang",
                                value: state.organization.title,
                                enabled: state.orgEnabled,
                                onTap: () {
                                  CustomBottomListDialog.show<SimpleModel>(
                                    context,
                                    title: "Bo'limni tanlang",
                                    onGetItems: () async => await taskApi
                                        .getOrganizations(state.district.id),
                                    map: (it) => it.title,
                                    onTapItem: (it) {
                                      bloc.add(MainTapItemOrgEvent(it));
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      padding: const EdgeInsets.all(20),
                      color: MyColors.white,
                      child: CustomButton(
                        text: "Boshlash",
                        enabled: state.btnEnabled,
                        onTap: () {
                          CustomMessageDialog.show(
                            context,
                            content: "Viloyat: ${state.region.title}\n\n"
                                "Tuman: ${state.district.title}\n\n"
                                "Bo'lim: ${state.organization.title}\n",
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              throw Exception("$state is not fount");
            },
          ),
        ),
      ),
    );
  }
}
