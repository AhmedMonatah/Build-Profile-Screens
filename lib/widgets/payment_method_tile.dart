import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_screens/core/app_colors.dart';
import 'package:profile_screens/modules/profile/controllers/payment_methods_controller.dart';

class PaymentMethodTile extends StatelessWidget {
  final String value;
  final String title;
  final Widget icon;

  const PaymentMethodTile({
    super.key,
    required this.value,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PaymentMethodsController>();

    return Obx(() {

      return InkWell(
        onTap: () => controller.selectedMethod.value = value,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title.isEmpty ? value : title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              Radio<String>(
                value: value,
                groupValue: controller.selectedMethod.value,
                onChanged: (val) => controller.selectedMethod.value = val!,
                activeColor: AppColors.salmon,
              ),
            ],
          ),
        ),
      );
    });
  }
}
