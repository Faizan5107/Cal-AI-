import 'package:flutter/material.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';

import '../theme/colors.dart';

class LanguageButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onPressed;

  const LanguageButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        height: 27,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.lightBg,
        ),
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: TextButton.icon(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact
          ),
          onPressed: onPressed,
          icon: icon,
          label: TitleWidget.normal(text,fontSize: 10),
        ),
      ),
    );
  }
}
