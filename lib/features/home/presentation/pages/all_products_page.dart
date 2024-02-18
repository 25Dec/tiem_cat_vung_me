import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_top_app_bar.dart';
import '../../../../core/common/widgets/product_card.dart';
import '../../../../core/res/app_colors.dart';
import '../../../../core/routes/app_route_constants.dart';
import '../bloc/home_bloc.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  static String routeName = AppPage.allProducts.toName;

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  int currentSelection = 1;

  void changeCurrentSelection(int selection) {
    setState(() => currentSelection = selection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(routeName: AllProductsPage.routeName),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(top: 48),
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is DoneGetAllProductsState) {
                final products = state.products;
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
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
            }),
          ),
          Positioned(
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.white2,
                border: Border(
                  bottom: BorderSide(color: AppColors.white1),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color:
                                currentSelection == 1 ? AppColors.pink : AppColors.white1,
                          ),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          int selectionNumber = 1;
                          changeCurrentSelection(selectionNumber);
                        },
                        child: Ink(
                          child: SizedBox(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Mới nhất",
                                style: TextStyle(
                                  color: currentSelection == 1
                                      ? AppColors.pink
                                      : AppColors.white4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    width: 0,
                    indent: 20,
                    endIndent: 20,
                    color: AppColors.white3,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color:
                                currentSelection == 2 ? AppColors.pink : AppColors.white1,
                          ),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          int selectionNumber = 2;
                          changeCurrentSelection(selectionNumber);
                        },
                        child: Ink(
                          child: SizedBox(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Bán chạy",
                                style: TextStyle(
                                  color: currentSelection == 2
                                      ? AppColors.pink
                                      : AppColors.white4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    width: 0,
                    indent: 20,
                    endIndent: 20,
                    color: AppColors.white3,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color:
                                currentSelection == 3 ? AppColors.pink : AppColors.white1,
                          ),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          int selectionNumber = 3;
                          changeCurrentSelection(selectionNumber);
                        },
                        child: Ink(
                          child: SizedBox(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Giá",
                                style: TextStyle(
                                  color: currentSelection == 3
                                      ? AppColors.pink
                                      : AppColors.white4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
