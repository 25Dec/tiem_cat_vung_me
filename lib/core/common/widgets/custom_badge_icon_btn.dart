import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../../res/app_colors.dart';

class CustomBadgeIconBtn extends StatelessWidget {
  final void Function() onTap;
  final int? amount;
  final IconData? fluentIcon;
  final IconData? flutterIcon;

  const CustomBadgeIconBtn({
    super.key,
    required this.onTap,
    this.amount,
    this.fluentIcon,
    this.flutterIcon,
  });

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 0),
      showBadge: true,
      badgeContent: amount != null
          ? Text(
              amount! > 99 ? "99+" : "$amount",
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.white2,
              ),
            )
          : null,
      badgeAnimation: const badges.BadgeAnimation.slide(
        animationDuration: Duration(seconds: 0),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: amount != null ? AppColors.pink : Colors.transparent,
        padding: const EdgeInsets.all(4),
        elevation: 0,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: fluentIcon != null
            ? Icon(
                fluentIcon,
                size: 24,
              )
            : Text(
                String.fromCharCode(flutterIcon!.codePoint),
                style: TextStyle(
                  color: const Color.fromRGBO(83, 67, 71, 1),
                  inherit: false,
                  fontSize: 24,
                  fontWeight: FontWeight.w100,
                  fontFamily: flutterIcon!.fontFamily,
                ),
              ),
      ),
    );
  }
}
