import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:profile_screens/core/app_colors.dart';
import 'package:profile_screens/core/app_string.dart';
import 'package:profile_screens/modules/profile/controllers/add_card_controller.dart';
import 'package:profile_screens/modules/profile/views/add_card_view.dart';
import 'package:profile_screens/widgets/payment_method_tile.dart';
import '../controllers/payment_methods_controller.dart';
import '../../../widgets/custom_button.dart';
class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PaymentMethodsController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppStrings.horizontalPadding,
                vertical: AppStrings.verticalPadding,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back_ios, color: AppColors.black),
                  ),
                  const Spacer(),
                  const Text(
                    AppStrings.paymentMethodTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.salmon,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 24),
                ],
              ),
            ),

            const SizedBox(height: AppStrings.dividerHeight),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppStrings.listPadding),
                children: [
                  PaymentMethodTile(
                    value: AppStrings.creditCardValue,
                    title: '',
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedCreditCard,
                      color: AppColors.salmon,
                      size: AppStrings.creditCardIconSize,
                    ),
                  ),
                  const Divider(),
                  PaymentMethodTile(
                    value: AppStrings.applePay,
                    title: AppStrings.applePay,
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedApple,
                      color: AppColors.salmon,
                      size: AppStrings.creditCardIconSize,
                    ),
                  ),
                  const Divider(),
                  PaymentMethodTile(
                    value: AppStrings.paypal,
                    title: AppStrings.paypal,
                    icon: SvgPicture.asset(
                      AppStrings.paypalIconPath,
                      height: AppStrings.paymentIconSize,
                      colorFilter:ColorFilter.mode(AppColors.salmon, BlendMode.srcIn) ,
                    ),
                  ),
                  const Divider(),
                  PaymentMethodTile(
                    value: AppStrings.cash,
                    title: AppStrings.cash,
                    icon: SvgPicture.asset(
                      AppStrings.cashIconPath,
                      height: AppStrings.cashIconSize,
                      colorFilter:ColorFilter.mode(AppColors.salmon, BlendMode.srcIn) ,
                    ),
                  ),
                  const SizedBox(height: AppStrings.bottomSpacing),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(AppStrings.buttonPadding),
              child: CustomButton(
                title: AppStrings.continueButton,
                onTap: () async {
                  final method = controller.selectedMethod.value;

                  if (method.isEmpty) {
                    Get.snackbar(AppStrings.error, AppStrings.selectMethodError);
                    return;
                  }

                  if ([AppStrings.creditCardValue, AppStrings.applePay, AppStrings.paypal].contains(method)) {
                    final result = await Get.to(
                      () => const AddCardView(),
                      binding: BindingsBuilder(() {
                        Get.put(AddCardController());
                      }),
                    );
                    if (result == true) controller.fetchPaymentMethods();
                  } else if (method == AppStrings.cash) {
                    Get.snackbar(AppStrings.success, AppStrings.paymentSavedSuccess);
                  } else {
                    Get.snackbar(AppStrings.save, "${AppStrings.selectedMethodMessage}$method");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}