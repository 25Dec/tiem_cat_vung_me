import 'package:flutter/material.dart';
import '../../res/app_colors.dart';
import '../../utils/core_utils.dart';

import '../entites/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String thumbnail = product.imagesUrl[0];
    String productName = product.productName;
    String price = CoreUtils.currencyConverter(product.prices.values.first);
    int soldQuantity = product.soldQuantity;

    return Card(
      color: AppColors.white2,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          print("Clicked");
        },
        child: SizedBox(
          width: 170,
          height: 270,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Image.network(
                    thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                    child: Text(price, style: const TextStyle(color: AppColors.pink)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                    child: Text("Đã bán $soldQuantity"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
