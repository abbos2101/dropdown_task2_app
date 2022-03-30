import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task2_app/data/utils/colors.dart';
import 'package:task2_app/data/utils/styles.dart';

enum _Status { loading, fail, success }

class CustomBottomListDialog<T> extends StatefulWidget {
  final String title;
  final Future<List<T>> Function()? onGetItems;
  final Function(T it)? onTapItem;
  final String Function(T it)? map;

  const CustomBottomListDialog._({
    Key? key,
    required this.title,
    this.onGetItems,
    this.onTapItem,
    this.map,
  }) : super(key: key);

  static Future<void> show<T>(
    BuildContext context, {
    required String title,
    Future<List<T>> Function()? onGetItems,
    Function(T it)? onTapItem,
    String Function(T it)? map,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomBottomListDialog<T>._(
          title: title,
          onGetItems: onGetItems,
          onTapItem: onTapItem,
          map: map,
        );
      },
    );
  }

  @override
  State<CustomBottomListDialog<T>> createState() =>
      _CustomBottomListDialogState<T>();
}

class _CustomBottomListDialogState<T> extends State<CustomBottomListDialog<T>> {
  final List<T> list = [];
  _Status status = _Status.loading;

  @override
  void initState() {
    launch();
    super.initState();
  }

  Future<void> launch() async {
    if (widget.onGetItems != null) {
      try {
        setState(() => status = _Status.loading);
        list.clear();
        list.addAll(await widget.onGetItems!());
        setState(() => status = _Status.success);
      } catch (_) {
        setState(() => status = _Status.fail);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 45,
            height: 8,
            decoration: BoxDecoration(
              color: MyColors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Text(
              widget.title,
              style: MyStyles.sans().copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Divider(thickness: 1, color: MyColors.greyDark),
          Expanded(
            child: Builder(builder: (context) {
              if (status == _Status.loading) {
                return ListView.separated(
                  itemCount: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, i) => const SizedBox(height: 16),
                  itemBuilder: (_, i) {
                    return Shimmer.fromColors(
                      baseColor: MyColors.greyLight,
                      highlightColor: MyColors.greyDark,
                      child: Container(
                        width: double.infinity,
                        height: 46,
                        decoration: BoxDecoration(
                          color: MyColors.greyDark,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                );
              }
              if (status == _Status.success) {
                if (list.isEmpty) {
                  return Center(
                    child: Text(
                      "Ma'lumot mavjud emas!",
                      style: MyStyles.sans().copyWith(fontSize: 18),
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: list.length,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (_, i) => const SizedBox(height: 16),
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () => widget.onTapItem?.call(list[i]),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: MyColors.greyDark,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.map?.call(list[i]) ?? "",
                                style: MyStyles.sans(),
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.chevron_right,
                                color: MyColors.dark),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(
                child: Text(
                  "Xatolik sodir bo'ldi :(",
                  style: MyStyles.sans().copyWith(fontSize: 18),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
