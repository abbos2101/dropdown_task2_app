import 'package:flutter/material.dart';
import 'package:task2_app/data/utils/colors.dart';
import 'package:task2_app/data/utils/styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const CustomAppbar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        text,
        style: MyStyles.sans().copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: MyColors.white,
          boxShadow: [BoxShadow(color: MyColors.grey, blurRadius: 4)],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
