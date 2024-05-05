import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/common/widgets/custom_top_app_bar.dart';
import '../../../../core/common/widgets/product_card.dart';
import '../../../../core/routes/app_route_constants.dart';
import '../bloc/favorites_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoritesBloc>(context).add(
      GetFavoritesListEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        routeName: AppPage.favorites.toName,
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          List<ProductEntity> favorites = [];

          if (state is DoneGetFavoritesListState) {
            favorites = state.favorites;

            if (favorites.isNotEmpty) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: favorites.length,
                shrinkWrap: true,
                itemBuilder: (_, index) => ProductCard(
                  product: favorites[index],
                  displayActionsForFavoritesPage: true,
                ),
              );
            } else {
              return Center(
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
              );
            }
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
