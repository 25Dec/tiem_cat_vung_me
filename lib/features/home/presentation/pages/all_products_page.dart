import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_top_app_bar.dart';
import '../../../../core/common/widgets/product_card.dart';
import '../../../../core/routes/app_route_constants.dart';
import '../bloc/home_bloc.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  static String routeName = AppPage.allProducts.toName;

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(routeName: AllProductsPage.routeName),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is DoneGetAllProductsState) {
            final products = state.products;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: products.length,
                itemBuilder: (_, index) => ProductCard(
                  product: products[index],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
