import 'package:flutter/services.dart';

// For card number (16 digits with automatic spacing)
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove all non-digit characters
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    
    // Apply the formatting pattern
    String formattedText = '';
    for (int i = 0; i < cleanedText.length; i++) {
      if (i == 3 || i == 6 || i == 9) {
        formattedText += ' ';
      }
      if (i < 11) { // Limit to 11 digits (3-3-3-2)
        formattedText += cleanedText[i];
      }
    }

    // Return the new formatted value
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

// For expiry date (MM/YY format)
class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    
    if (text.length > 4) {
      text = text.substring(0, 4); // Limit to 4 digits
    }
    
    if (text.length >= 2) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }
    
    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}