import 'package:flutter/material.dart';
import 'package:tiem_cat_vung_me/core/res/app_colors.dart';
import 'package:tiem_cat_vung_me/core/utils/core_utils.dart';

class CustomCartBottomAppBar extends StatefulWidget {
  final BuildContext context;

  const CustomCartBottomAppBar({super.key, required this.context});

  @override
  State<CustomCartBottomAppBar> createState() => _CustomCartBottomAppBarState();
}

class _CustomCartBottomAppBarState extends State<CustomCartBottomAppBar> {
  bool isSelectAll = false;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      padding: EdgeInsets.zero,
      color: AppColors.white2,
      surfaceTintColor: AppColors.white2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: isSelectAll,
                  onChanged: (value) {
                    setState(() {
                      isSelectAll = value!;
                    });
                  },
                ),
                const Text(
                  "Tất cả",
                  style: TextStyle(color: AppColors.black2),
                ),
              ],
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: AppColors.black2),
                children: [
                  const TextSpan(text: "Tổng cộng\n"),
                  TextSpan(
                    text: CoreUtils.currencyConverter(0),
                    style: const TextStyle(color: AppColors.pink),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: AppColors.pink,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  child: const Text(
                    "Mua hàng (0)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
