import 'package:flutter/material.dart';
import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/common/widgets/custom_text_button.dart';
import '../../../../core/res/app_colors.dart';

class CustomExpansionTile extends StatelessWidget {
  final ProductEntity product;

  const CustomExpansionTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        "Mô tả sản phẩm",
        style: TextStyle(fontSize: 14),
      ),
      tilePadding: const EdgeInsets.symmetric(horizontal: 8),
      shape: const Border(top: BorderSide(color: AppColors.white1)),
      collapsedShape: const Border(
        top: BorderSide(color: AppColors.white1),
        bottom: BorderSide(color: AppColors.white1),
      ),
      children: [
        Text(product.description == ""
            ? "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssfwwfahnfnhvdsnfjsvdfsjvfbesvbhjevfsadfnvdsfvsdvnfsdnfvnsdnfvsdnfvansdfvnasdnhfvsdfvnhjsadfnhvewnhrvewiurvewiunvraetiuovsnhufndshnuawehiufnueifhuiaeihfhiawuefhoawoheohawehrhaweurwenrnahuerwiuorwiuoehwhrvwueirauwehvrawiuevruwaenvrwurwniuernhvuhiuisssfwwfahnfnhvdsnfjsvdfsjvfbesvbhjevfsadfnvdsfvsdvnfsdnfvnsdnfvsdnfvansdfvnasdnhfvsdfvnhjsadfnhvewnhrvewiurvewiunvraetiuovsnhufndshnuawehiufnueifhuiaeihfhiawuefhoawoheohawehrhaweurwenrnahuerwiuorwiuoehwhrvwueirauwehvrawiuevruwaenvrwurwniuernhvuhiuisssfwwfahnfnhvdsnfjsvdfsjvfbesvbhjevfsadfnvdsfvsdvnfsdnfvnsdnfvsdnfvansdfvnasdnhfvsdfvnhjsadfnhvewnhrvewiurvewiunvraetiuovsnhufndshnuawehiufnueifhuiaeihfhiawuefhoawoheohawehrhaweurwenrnahuerwiuorwiuoehwhrvwueirauwehvrawiuevruwaenvrwurwniuernhvuhiuisssfwwfahnfnhvdsnfjsvdfsjvfbesvbhjevfsadfnvdsfvsdvnfsdnfvnsdnfvsdnfvansdfvnasdnhfvsdfvnhjsadfnhvewnhrvewiurvewiunvraetiuovsnhufndshnuawehiufnueifhuiaeihfhiawuefhoawoheohawehrhaweurwenrnahuerwiuorwiuoehwhrvwueirauwehvrawiuevruwaenvrwurwniuernhvuhiuisssfwwfahnfnhvdsnfjsvdfsjvfbesvbhjevfsadfnvdsfvsdvnfsdnfvnsdnfvsdnfvansdfvnasdnhfvsdfvnhjsadfnhvewnhrvewiurvewiunvraetiuovsnhufndshnuawehiufnueifhuiaeihfhiawuefhoawoheohawehrhaweurwenrnahuerwiuorwiuoehwhrvwueirauwehvrawiuevruwaenvrwurwniuernhvuhiuisssfwwfahnfnhvdsnfjsvdfsjvfbesvbhjevfsadfnvdsfvsdvnfsdnfvnsdnfvsdnfvansdfvnasdnhfvsdfvnhjsadfnhvewnhrvewiurvewiunvraetiuovsnhufndshnuawehiufnueifhuiaeihfhiawuefhoawoheohawehrhaweurwenrnahuerwiuorwiuoehwhrvwueirauwehvrawiuevruwaenvrwurwniuernhvuhiuisssfwwfahnfnhvdsnfjsvdfsjvfbesvbhjevfsadfnvdsfvsdvnfsdnfvnsdnfvsdnfvansdfvnasdnhfvsdfvnhjsadfnhvewnhrvewiurvewiunvraetiuovsnhufndshnuawehiufnueifhuiaeihfhiawuefhoawoheohawehrhaweurwenrnahuerwiuorwiuoehwhrvwueirauwehvrawiuevruwaenvrwurwniuernhvuhiui"
            : "Chưa có thông tin mô tả sản phẩm"),
        const Divider(color: AppColors.white1),
        Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomTextButton(
                onPressed: () => ExpansionTileController.of(context).collapse(),
                text: "Thu gọn",
                textColor: AppColors.pink,
              ),
            );
          },
        ),
      ],
    );
  }
}
