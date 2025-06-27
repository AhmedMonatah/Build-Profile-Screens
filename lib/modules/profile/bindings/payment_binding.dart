import 'package:get/get.dart';
import 'package:profile_screens/modules/profile/controllers/add_card_controller.dart';
import 'package:profile_screens/modules/profile/controllers/payment_methods_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentMethodsController>(() => PaymentMethodsController());
    Get.lazyPut<AddCardController>(() => AddCardController());
  }
}
