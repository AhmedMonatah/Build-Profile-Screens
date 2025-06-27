import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:profile_screens/core/app_string.dart';
import 'package:profile_screens/data/models/card_model.dart';
import 'package:profile_screens/data/services/firebase_service.dart';

class AddCardController extends GetxController {
  final cardHolderName = ''.obs;
  final cardNumber = ''.obs;
  final expiryDate = ''.obs;
  final cvv = ''.obs;

  Future<void> saveCard() async {
    debugPrint(AppStrings.saveCardStarted); // Using string constant
    try {
      debugPrint("${AppStrings.fieldsDebug}${cardHolderName.value}, ${cardNumber.value}, ${expiryDate.value}, ${cvv.value}");
      
      if (cardHolderName.isEmpty || cardNumber.isEmpty || expiryDate.isEmpty || cvv.isEmpty) {
        debugPrint(AppStrings.validationFailed);
        throw Exception(AppStrings.fillAllDetails);
      }

      final card = CardModel(
        cardHolderName: cardHolderName.value,
        cardNumber: cardNumber.value,
        expiryDate: expiryDate.value,
        cvv: cvv.value,
      );

      await FirebaseService().saveCardDirectly(card);
      
      Get.back();
      Get.snackbar(AppStrings.success, AppStrings.cardSaved);
    } catch (e) {
      Get.snackbar(AppStrings.error, e.toString());
    }
  }
}