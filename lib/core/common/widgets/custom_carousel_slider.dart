// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiem_cat_vung_me/core/res/app_colors.dart';

class CustomCarouselSlider extends StatelessWidget {
  late double height;
  late bool autoPlay;
  late List<String> items;
  late bool isHomePage;
  late bool enableInfiniteScroll;

  CustomCarouselSlider({
    super.key,
    this.height = 250,
    this.autoPlay = false,
    this.isHomePage = false,
    this.enableInfiniteScroll = false,
    this.items = const [
      "assets/images/slider_1.svg",
      "assets/images/slider_2.svg",
      "assets/images/slider_3.svg",
      "assets/images/slider_4.svg",
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white2,
      child: CarouselSlider(
        items: [
          for (int i = 0; i < items.length; i++)
            if (isHomePage) SvgPicture.asset(items[i]) else Image.network(items[i]),
        ],
        options: CarouselOptions(
          height: height,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: enableInfiniteScroll,
          reverse: false,
          autoPlay: autoPlay,
          autoPlayInterval: const Duration(seconds: 8),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
