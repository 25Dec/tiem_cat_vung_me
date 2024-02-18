import 'package:flutter/material.dart';
import 'package:tiem_cat_vung_me/core/res/app_colors.dart';

class CustomClickableRow extends StatelessWidget {
  final List<Widget> widgets;
  final void Function()? onTap;
  final bool displayRightChervron;

  const CustomClickableRow(
      {super.key, required this.widgets, this.onTap, this.displayRightChervron = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...widgets,
                  if (displayRightChervron)
                    const Icon(
                      Icons.chevron_right_outlined,
                      color: AppColors.white3,
                    ),
                ],
              ),
            ),
          ),
          const Divider(
            color: AppColors.white5,
          )
        ],
      ),
    );
  }
}
