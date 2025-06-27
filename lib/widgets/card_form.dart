import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_screens/core/app_colors.dart';
import 'package:profile_screens/core/app_string.dart';
import 'package:profile_screens/modules/profile/controllers/add_card_controller.dart';
import 'package:profile_screens/widgets/custom_button.dart';
import 'package:profile_screens/widgets/custom_text_field.dart';

class CardForm extends StatelessWidget {
  const CardForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddCardController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.cardHolderNameLabel,
          style: TextStyle(fontSize: 16, color: AppColors.salmon),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          hint: AppStrings.cardHolderNameHint,
          onChanged: (value) => controller.cardHolderName.value = value,
        ),
        const SizedBox(height: 20),
        const Text(
          AppStrings.cardNumberLabel,
          style: TextStyle(color: AppColors.salmon, fontSize: 16),
        ),
        const SizedBox(height: 8),
        CustomTextField.cardNumber(
          hint: AppStrings.defaultCardNumber,
          onChanged: (value) =>
              controller.cardNumber.value = value.replaceAll(' ', ''),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.expiryDateLabel,
                    style: TextStyle(color: AppColors.salmon, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField.expiryDate(
                    hint: AppStrings.expiryDateHint,
                    onChanged: (value) => controller.expiryDate.value = value,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.cvvLabel,
                    style: TextStyle(color: AppColors.salmon, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField.cvv(
                    hint: AppStrings.cvvHint,
                    onChanged: (value) => controller.cvv.value = value,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            title: AppStrings.saveCardButton,
            onTap: () => controller.saveCard(),
            isFullWidth: false,
          ),
        ),
      ],
    );
  }
}
