import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tiem_cat_vung_me/core/common/widgets/custom_top_app_bar.dart';
import 'package:tiem_cat_vung_me/core/common/widgets/product_card.dart';
import 'package:tiem_cat_vung_me/core/routes/app_route_constants.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  static String routeName = AppPage.favorites.toName;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<int> favorites = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(routeName: FavoritesPage.routeName),
      body: favorites.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: favorites.length,
                  itemBuilder: (_, index) => Container()),
            )
          : Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/empty_favorites.svg",
                    height: 300,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Bạn chưa chọn thích sản phẩm nào",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text("Vui lòng thêm sản phẩm mà bạn yêu thích")
                ],
              ),
            ),
    );
  }
}
