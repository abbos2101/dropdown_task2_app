import 'package:flutter/material.dart';
import 'package:task2_app/data/utils/colors.dart';
import 'package:task2_app/data/utils/styles.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final String value;
  final bool enabled;
  final GestureTapCallback? onTap;

  const CustomDropdown({
    Key? key,
    required this.title,
    this.value = "",
    this.enabled = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: MyStyles.sans().copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: MyColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value.isEmpty ? title : value,
                      style: MyStyles.sans().copyWith(
                        fontWeight: FontWeight.w600,
                        color:
                            MyColors.dark.withOpacity(value.isEmpty ? 0.5 : 1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.chevron_right,
                    color: MyColors.dark.withOpacity(value.isEmpty ? 0.5 : 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyStyles.sans().copyWith(
            fontWeight: FontWeight.w600,
            color: MyColors.dark.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: MyColors.greyLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value.isEmpty ? title : value,
                  style: MyStyles.sans().copyWith(
                    fontWeight: FontWeight.w600,
                    color: MyColors.dark.withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.chevron_right,
                color: MyColors.dark.withOpacity(0.3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
