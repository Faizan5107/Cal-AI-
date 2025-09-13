import 'package:flutter/material.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';

import '../theme/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.backgroundColor,
    this.disabledColor,
    this.buttonRadius,
    this.size = const Size.fromHeight(56),
    this.enabled = true,
  });

  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? disabledColor;
  final double? buttonRadius;
  final String title;
  final Size size;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = !enabled || onTap == null;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: size,
        backgroundColor: isDisabled
            ? (disabledColor ?? AppColor.buttonDisable)
            : (backgroundColor ?? AppColor.buttonBg),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius ?? 500),
        ),
      ),
      onPressed: isDisabled ? null : onTap,
      child: TitleWidget.normal(
        title,
        color: isDisabled ? AppColor.buttonText : AppColor.buttonText,
        fontSize: 18,
      ),
    );
  }
}
