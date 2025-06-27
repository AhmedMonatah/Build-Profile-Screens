import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:profile_screens/modules/profile/bindings/payment_binding.dart';
import 'package:profile_screens/modules/profile/views/add_card_view.dart';
import 'package:profile_screens/modules/profile/views/payment_methods_view.dart';

class AppPages {
  static const paymentMethods = '/payment-methods';
  static const addCard = '/add-card';

  static final pages = [
    GetPage(
      name: paymentMethods,
      page: () => PaymentMethodsView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: addCard,
      page: () => AddCardView(),
      binding: PaymentBinding(),
    ),
  ];
}
