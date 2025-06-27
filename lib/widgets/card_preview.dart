import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_screens/core/app_colors.dart';
import 'package:profile_screens/core/app_string.dart';
import 'package:profile_screens/modules/profile/controllers/add_card_controller.dart';
import 'package:profile_screens/widgets/traingle_pos.dart';

class CardPreview extends StatelessWidget {
  const CardPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddCardController>();

    return Obx(() => SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.beige,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  controller.cardNumber.value.isEmpty
                      ? AppStrings.defaultCardNumber
                      : controller.cardNumber.value
                          .replaceAllMapped(RegExp(r'.{3}'), (match) => '${match.group(0)} ')
                          .trim(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLabelText(
                      label: AppStrings.cardHolderNameLabel,
                      value: controller.cardHolderName.value.isEmpty
                          ? AppStrings.defaultName
                          : controller.cardHolderName.value,
                    ),
                    _buildLabelText(
                      label: AppStrings.expiryDateLabel,
                      value: controller.expiryDate.value.isEmpty
                          ? AppStrings.defaultExpiry
                          : controller.expiryDate.value,
                    ),
                    Image.asset(
                      AppStrings.cardChipImagePath,
                      height: 50,
                      width: 40,
                      color: AppColors.salmon,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: _buildTriangle(TrianglePosition.topLeft, 150, 100),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: _buildTriangle(TrianglePosition.topRight, 140, 70),
          ),
        ],
      ),
    ));
  }
  // ... rest of the class remains the same
}

  Widget _buildLabelText({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.black)),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.salmon,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTriangle(TrianglePosition position, double width, double height) {
    return ClipPath(
      clipper: RoundedTriangleClipper(position: position, borderRadius: 16),
      child: Container(
        width: width,
        height: height,
        color: AppColors.salmon,
      ),
    );
  }

