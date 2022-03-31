import 'package:flutter/material.dart';
import 'package:task2_app/data/utils/colors.dart';
import 'package:task2_app/data/utils/styles.dart';

class CustomMessageDialog extends StatelessWidget {
  final String content;

  const CustomMessageDialog._({Key? key, required this.content})
      : super(key: key);

  static Future<void> show(BuildContext context,
      {required String content}) async {
    await showDialog(
      context: context,
      builder: (context) => CustomMessageDialog._(content: content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Xabar",
                style: MyStyles.sans().copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 16),
              Text(content, style: MyStyles.sans()),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 8,
                  ),
                  child: Text(
                    "Yopish",
                    style:
                        MyStyles.sans().copyWith(fontWeight: FontWeight.w600),
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: MyColors.greyDark,
                        blurRadius: 8,
                        offset: Offset(2, 6),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
