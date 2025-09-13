import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../gen/assets.gen.dart';
import '../theme/colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    this.isSpaced = true,
    this.isNormalButton = false,
    this.onPressed,
    this.icon,
  });

  final bool isSpaced;
  final bool isNormalButton;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (icon != null) {
      child = Icon(icon, color: AppColor.black);
    } else {
      child = Icon(Icons.arrow_back_sharp);
    }
    if (isNormalButton) {
      return GestureDetector(
        onTap: onPressed ?? context.pop,
        child: child,
      );
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: onPressed ?? context.pop,
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBg
              ),padding: EdgeInsets.all(8),
              child: child),
        ),
      ),
      if (isSpaced) const SizedBox(height: 1.25),
    ]);
  }
}