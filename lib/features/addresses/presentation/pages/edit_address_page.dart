import 'package:flutter/material.dart';

import '../../../../core/common/entites/sub_entities.dart';
import '../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../core/common/widgets/custom_top_app_bar.dart';
import '../../../../core/res/app_colors.dart';
import '../../../../core/routes/app_route_constants.dart';
import '../../../../core/utils/core_utils.dart';

class EditAddressPage extends StatefulWidget {
  final UserAddressEntity userAddress;

  const EditAddressPage({
    super.key,
    required this.userAddress,
  });

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController recipientNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cityOrDistrictOrWardController = TextEditingController();
  TextEditingController streetOrBuildingNameController = TextEditingController();
  TextEditingController unitOrFloorController = TextEditingController();
  TextEditingController additionalAddressInformationController = TextEditingController();
  bool isDefaultAddress = false;

  @override
  void initState() {
    super.initState();
    recipientNameController.text = widget.userAddress.recipientName;
    phoneNumberController.text = widget.userAddress.phoneNumber;
    cityOrDistrictOrWardController.text = widget.userAddress.cityOrDistrictOrWard;
    streetOrBuildingNameController.text = widget.userAddress.streetOrBuildingName;
    unitOrFloorController.text = widget.userAddress.unitOrFloor;
    additionalAddressInformationController.text =
        widget.userAddress.additionalAddressInformation;
    isDefaultAddress = widget.userAddress.isDefaultAddress;
  }

  @override
  void dispose() {
    recipientNameController.dispose();
    phoneNumberController.dispose();
    cityOrDistrictOrWardController.dispose();
    streetOrBuildingNameController.dispose();
    unitOrFloorController.dispose();
    additionalAddressInformationController.dispose();
    super.dispose();
  }

  String? phoneNumberValidator(String? value) {
    bool isPhoneNumberValid = CoreUtils.validatePhoneNumber(value!);
    return isPhoneNumberValid ? null : "Số điện thoại không hợp lệ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(routeName: AppPage.editAddress.toName),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: cityOrDistrictOrWardController,
                  hintText: "Thành Phố(Tỉnh)/Quận(Huyện)/Phường(Xã)",
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: streetOrBuildingNameController,
                  hintText: "Đường/Tòa Nhà",
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: unitOrFloorController,
                  hintText: "Số Nhà/Tầng",
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: additionalAddressInformationController,
                  hintText: "Thông tin địa chi bổ sung (Không bắt buộc)",
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: recipientNameController,
                  hintText: "Nhập Tên Người Nhận",
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: phoneNumberController,
                  hintText: "Số Điện Thoại",
                  validator: phoneNumberValidator,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Đặt làm địa chỉ mặc định"),
                    SizedBox(
                      width: 40,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Switch(
                          value: isDefaultAddress,
                          inactiveTrackColor: AppColors.gray,
                          trackOutlineColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          onChanged: (value) {
                            setState(() {
                              isDefaultAddress = value;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        const BorderSide(color: AppColors.white4),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Xóa địa chỉ",
                      style: TextStyle(color: AppColors.white4),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0.5),
                    ),
                    onPressed: () {},
                    child: const Text("Lưu"),
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
