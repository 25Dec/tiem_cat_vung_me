// ignore_for_file: deprecated_member_use

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:tiem_cat_vung_me/core/common/entites/sub_entities.dart';
import 'package:tiem_cat_vung_me/core/common/widgets/custom_text_button.dart';
import 'package:tiem_cat_vung_me/core/res/app_colors.dart';
import 'package:tiem_cat_vung_me/core/routes/app_route_constants.dart';

class SlidableAddressCard extends StatefulWidget {
  final UserAddressEntity userAddress;

  const SlidableAddressCard({
    super.key,
    required this.userAddress,
  });

  @override
  State<SlidableAddressCard> createState() => _SlidableAddressCardState();
}

class _SlidableAddressCardState extends State<SlidableAddressCard> {
  void moveToEditAddressPage() => GoRouter.of(context).pushNamed(
        AppPage.editAddress.toName,
        extra: {"userAddress": widget.userAddress},
      );

  @override
  Widget build(BuildContext context) {
    String recipientName = widget.userAddress.recipientName;
    String phoneNumber = widget.userAddress.phoneNumber;
    String cityOrDistrictOrWard = widget.userAddress.cityOrDistrictOrWard;
    String streetOrBuildingName = widget.userAddress.streetOrBuildingName;
    String unitOrFloor = widget.userAddress.unitOrFloor;
    bool isDefaultAddress = widget.userAddress.isDefaultAddress;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Slidable(
        key: ValueKey(widget.userAddress),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 110,
                      child: Text(
                        recipientName,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      phoneNumber,
                      style: const TextStyle(color: AppColors.white4),
                    ),
                    CustomTextButton(
                      onPressed: moveToEditAddressPage,
                      text: "Chỉnh sửa",
                      textColor: AppColors.blue,
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (unitOrFloor.isNotEmpty)
                      Text(
                        unitOrFloor,
                        style: const TextStyle(
                          color: AppColors.white4,
                          fontSize: 12,
                        ),
                      ),
                    if (unitOrFloor.isNotEmpty) const VerticalDivider(),
                    Text(
                      streetOrBuildingName,
                      style: const TextStyle(
                        color: AppColors.white4,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  cityOrDistrictOrWard,
                  style: const TextStyle(
                    color: AppColors.white4,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                if (isDefaultAddress)
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.pink,
                      ),
                    ),
                    child: const Text(
                      "Mặc định",
                      style: TextStyle(
                        color: AppColors.pink,
                        fontSize: 12,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
