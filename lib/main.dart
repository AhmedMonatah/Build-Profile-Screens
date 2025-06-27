import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:profile_screens/core/app_colors.dart';
import 'package:profile_screens/routes/app_pages.dart';
import 'firebase_options.dart'; // <-- If you have this from flutterfire configure

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// Main app using GetMaterialApp
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Profile Screens Demo',
      debugShowCheckedModeBanner: false,
      // Set your starting page
      initialRoute: AppPages.paymentMethods,
      // All your GetX pages
      getPages: AppPages.pages,
      // Optional theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.salmon),
      ),
      supportedLocales: const [
        Locale('en'),
      ],
    );
  }
}
