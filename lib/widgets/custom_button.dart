import 'package:flutter/material.dart';
import 'package:task2_app/data/utils/colors.dart';
import 'package:task2_app/data/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;

  const CustomButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: MyStyles.sans().copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: MyColors.white,
          ),
        ),
      ),
    );
  }
}
