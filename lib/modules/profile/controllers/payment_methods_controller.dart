import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:profile_screens/data/models/payment_method.dart';
import 'package:profile_screens/data/services/firebase_service.dart';

class PaymentMethodsController extends GetxController {
  var paymentMethods = <PaymentMethod>[].obs;
  var selectedMethod = ''.obs;

  void fetchPaymentMethods() async {
    final firebaseService = FirebaseService();
    final userId = 'user_123';
    paymentMethods.value = await firebaseService.fetchUserCards(userId);
  }
}

