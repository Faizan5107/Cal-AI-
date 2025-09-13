import 'package:flutter/material.dart';
import 'package:onboarding_flow/theme/colors.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';

class CustomToggleContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final double borderRadius;
  final EdgeInsets padding;

  const CustomToggleContainer({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.activeColor = Colors.blue,
    this.inactiveColor = const Color(0xFFF5F5F5),
    this.activeTextColor = Colors.white,
    this.inactiveTextColor = Colors.black,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          width: double.infinity,
          padding: padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: Colors.black.withValues(alpha: 0.1),width: 0.5)
          ),
          child: TitleWidget.normal(
            text,
            color: isSelected ? activeTextColor : inactiveTextColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
