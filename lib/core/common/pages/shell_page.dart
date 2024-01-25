import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiem_cat_vung_me/core/routes/app_route_constants.dart';

import '../../res/app_colors.dart';

class ShellPage extends StatefulWidget {
  final Widget child;

  const ShellPage({
    super.key,
    required this.child,
  });

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  int _currPageIndex = 0;

  final List<Widget> _destinations = const [
    NavigationDestination(
      icon: Icon(FluentIcons.home_24_regular),
      selectedIcon: Icon(FluentIcons.home_24_filled),
      label: "Trang chủ",
    ),
    NavigationDestination(
      icon: Icon(FluentIcons.heart_24_regular),
      selectedIcon: Icon(FluentIcons.heart_24_filled),
      label: "Yêu thích",
    ),
    NavigationDestination(
      icon: Icon(FluentIcons.person_24_regular),
      selectedIcon: Icon(FluentIcons.person_24_filled),
      label: "Tôi",
    ),
  ];

  void _onDestinationSelected(BuildContext context, int index) {
    setState(() => _currPageIndex = index);

    switch (index) {
      case 0:
        context.goNamed(AppPage.home.toName);
      case 1:
        context.goNamed(AppPage.favorites.toName);
      case 2:
        context.goNamed(AppPage.profile.toName);
      default:
        context.goNamed(AppPage.home.toName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        height: 65,
        elevation: 0.0,
        backgroundColor: AppColors.white2,
        selectedIndex: _currPageIndex,
        onDestinationSelected: (index) => _onDestinationSelected(context, index),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: _destinations,
      ),
    );
  }
}
