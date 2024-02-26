import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiem_cat_vung_me/core/res/app_colors.dart';

import '../../../../core/common/entites/sub_entities.dart';
import '../../../../core/common/widgets/custom_top_app_bar.dart';
import '../../../../core/routes/app_route_constants.dart';
import '../widgets/slidable_address_cart.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  List<UserAddressEntity> addresses = [
    UserAddressEntity(
      recipientName: "Chị bé Nguyễn Huỳnh Thiện Nhân Vừng Mè Mập Nhỏ",
      phoneNumber: "0964886660",
      cityOrDistrictOrWard: "Thành phố Hồ Chí Minh",
      streetOrBuildingName: "Hẻm 19 đường 13",
      unitOrFloor: "19/4/5",
      isDefaultAddress: false,
    ),
    UserAddressEntity(
      recipientName: "Thiện Nhân",
      phoneNumber: "0964886660",
      cityOrDistrictOrWard: "Thành phố Hồ Chí Minh",
      streetOrBuildingName: "Hẻm 19 đường 13",
      unitOrFloor: "",
      isDefaultAddress: false,
    ),
    UserAddressEntity(
      recipientName: "Thiện Nhân",
      phoneNumber: "0964886660",
      cityOrDistrictOrWard: "Thành phố Hồ Chí Minh",
      streetOrBuildingName: "Hẻm 19 đường 13",
      unitOrFloor: "",
      isDefaultAddress: false,
    ),
    UserAddressEntity(
      recipientName: "Thiện Nhân",
      phoneNumber: "0964886660",
      cityOrDistrictOrWard: "Thành phố Hồ Chí Minh",
      streetOrBuildingName: "Hẻm 19 đường 13",
      unitOrFloor: "",
      isDefaultAddress: false,
    ),
    UserAddressEntity(
      recipientName: "Thiện Nhân",
      phoneNumber: "0964886660",
      cityOrDistrictOrWard: "Thành phố Hồ Chí Minh",
      streetOrBuildingName: "Hẻm 19 đường 13",
      unitOrFloor: "",
      isDefaultAddress: true,
    ),
    UserAddressEntity(
      recipientName: "Thiện Nhân",
      phoneNumber: "0964886660",
      cityOrDistrictOrWard: "Thành phố Hồ Chí Minh",
      streetOrBuildingName: "Hẻm 19 đường 13",
      unitOrFloor: "",
      isDefaultAddress: false,
    ),
  ];

  void moveToAddNewAddressPage() =>
      GoRouter.of(context).pushNamed(AppPage.addNewAddress.toName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(routeName: AppPage.addresses.toName),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: OutlinedButton(
              onPressed: moveToAddNewAddressPage,
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
                side: MaterialStateProperty.all(
                  const BorderSide(color: AppColors.pink),
                ),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              child: const Text(
                "+ Thêm địa chỉ mới",
                style: TextStyle(color: AppColors.pink),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: addresses.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SlidableAddressCard(
                  userAddress: addresses[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
