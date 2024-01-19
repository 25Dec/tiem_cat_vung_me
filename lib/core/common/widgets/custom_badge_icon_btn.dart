import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../../res/app_colors.dart';

class CustomBadgeIconBtn extends StatefulWidget {
  final VoidCallback onTap;
  final int amount;
  final IconData icon;

  const CustomBadgeIconBtn({
    super.key,
    required this.onTap,
    required this.amount,
    required this.icon,
  });

  @override
  State<CustomBadgeIconBtn> createState() => _CustomBadgeIconBtnState();
}

class _CustomBadgeIconBtnState extends State<CustomBadgeIconBtn> {
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      onTap: widget.onTap,
      position: badges.BadgePosition.topEnd(top: -10, end: -12),
      showBadge: true,
      badgeContent: Text(
        widget.amount > 99 ? "99+" : "${widget.amount}",
        style: const TextStyle(fontSize: 10, color: AppColors.white2),
      ),
      badgeAnimation: const badges.BadgeAnimation.slide(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: const badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: AppColors.pink,
        padding: EdgeInsets.all(4),
        elevation: 0,
      ),
      child: Icon(
        widget.icon,
        size: 24,
      ),
    );
  }
}
