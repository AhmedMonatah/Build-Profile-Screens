import 'package:flutter/material.dart';
import 'package:profile_screens/core/app_string.dart';
import 'package:profile_screens/widgets/card_form.dart';
import 'package:profile_screens/widgets/card_preview.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addCardTitle),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
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