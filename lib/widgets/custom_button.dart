import 'package:flutter/material.dart';
import 'package:profile_screens/core/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final double? width;
  final bool isFullWidth; // New parameter to control full width behavior
  
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.elevation,
    this.width = 180, // Default width when not full width
    this.isFullWidth = false, // Default to not full width
  });

  @override
  Widget build(BuildContext context) {
    return Center( // Wrap with Center widget
      child: SizedBox(
        width: isFullWidth ? double.infinity : width,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.salmon,
            foregroundColor: textColor ?? Colors.white,
            elevation: elevation ?? 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: Size(
              isFullWidth ? double.infinity : width ?? 80, 
              50
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}