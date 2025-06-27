import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_screens/core/app_colors.dart';
import 'package:profile_screens/widgets/custom_formatters.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputAction? textInputAction;

  const CustomTextField({
    super.key,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.obscureText = false,
    this.controller,
    this.maxLength,
    this.textInputAction,
  });

  // Specialized constructor for card numbers
  factory CustomTextField.cardNumber({
    Key? key,
    required String hint,
    required void Function(String)? onChanged,
    TextEditingController? controller,
  }) {
    return CustomTextField(
      key: key,
      hint: hint,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11), 
        CardNumberFormatter(),
      ],
    );
  }

  // Specialized constructor for expiry dates
  factory CustomTextField.expiryDate({
    Key? key,
    required String hint,
    required void Function(String)? onChanged,
    TextEditingController? controller,
  }) {
    return CustomTextField(
      key: key,
      hint: hint,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
        ExpiryDateFormatter(),
      ],
    );
  }

  // Specialized constructor for CVV
  factory CustomTextField.cvv({
    Key? key,
    required String hint,
    required void Function(String)? onChanged,
    TextEditingController? controller,
  }) {
    return CustomTextField(
      key: key,
      hint: hint,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      controller: controller,
      obscureText: true,
      
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
        
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLength: maxLength,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: AppColors.brownrosy.withAlpha(50),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        counterText: '', // Hide character counter
      ),
      style: const TextStyle(fontSize: 16),
      onChanged: onChanged,
    );
  }
}