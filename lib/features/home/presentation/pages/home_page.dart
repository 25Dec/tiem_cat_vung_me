import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/product_card.dart';
import '../../../../core/res/app_colors.dart';
import '../../../../core/routes/app_route_constants.dart';
import '../bloc/home_bloc.dart';
import '../widgets/custom_carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String routeName = AppPage.home.toName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetAllProductsEvent());
  }

  void moveToAllProductsPage() =>
      GoRouter.of(context).pushNamed(AppPage.allProducts.toName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(routeName: HomePage.routeName),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomCarouselSlider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Sản phẩm",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: () => moveToAllProductsPage(),
                  icon: const Icon(FluentIcons.arrow_right_24_filled),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is DoneGetAllProductsState) {
                    final products = state.products;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (_, index) => ProductCard(
                        product: products[index],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}