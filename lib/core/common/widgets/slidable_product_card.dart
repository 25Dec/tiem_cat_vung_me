// ignore_for_file: deprecated_member_use

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../res/app_colors.dart';
import '../../routes/app_route_constants.dart';
import '../../utils/core_utils.dart';
import '../entites/product_entity.dart';

class SlidableProductCard extends StatefulWidget {
  final ProductEntity product;

  const SlidableProductCard({
    super.key,
    required this.product,
  });

  @override
  State<SlidableProductCard> createState() => _SlidableProductCardState();
}

class _SlidableProductCardState extends State<SlidableProductCard> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    String productId = widget.product.productId;
    String thumbnail = widget.product.imagesUrl[0];
    String productName = widget.product.productName;
    String price = CoreUtils.currencyConverter(widget.product.prices.values.first);

    void onTap() {
      GoRouter.of(context).push("${AppPage.productDetails.toPath}/$productId");
    }

    return Container(
      height: 110,
      margin: const EdgeInsets.only(bottom: 8),
      child: Slidable(
        key: ValueKey(widget.product.productId),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: AppColors.white4,
              foregroundColor: Colors.white,
              icon: FluentIcons.delete_16_regular,
            ),
          ],
        ),
        child: Card(
          surfaceTintColor: AppColors.white2,
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
                right: 8,
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isCheck,
                    onChanged: (value) {
                      setState(() {
                        isCheck = value!;
                      });
                    },
                  ),
                  Image.network(
                    thumbnail,
                    width: 110,
                    height: 110,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          price,
                          style: const TextStyle(
                            color: AppColors.pink,
                          ),
                        ),
                        const InputQty(
                          initVal: 1,
                          minVal: 1,
                          decoration: QtyDecorationProps(
                            isBordered: false,
                            minusBtn: Icon(
                              FluentIcons.subtract_16_regular,
                              size: 20,
                            ),
                            plusBtn: Icon(
                              FluentIcons.add_16_regular,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
