import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:profile_screens/core/app_colors.dart';
import 'package:profile_screens/core/app_string.dart';
import 'package:profile_screens/widgets/card_form.dart';
import 'package:profile_screens/widgets/card_preview.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addCardTitle,style: TextStyle(color: AppColors.salmon,fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
        child: Column(
          children: const [
            CardPreview(),  // This contains its own Obx for reactive variables
            SizedBox(height: 30),
            CardForm(),     // This contains its own reactive elements
          ],
        ),
      ),
    );
  }
}