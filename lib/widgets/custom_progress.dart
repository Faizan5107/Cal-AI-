import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGradientProgressBar extends StatelessWidget {
  final double progress;

  const CustomGradientProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double barWidth = constraints.maxWidth;
        return Stack(
          children: [
            // Background bar
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            // Progress bar with gradient
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: barWidth * progress,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFf02f83),
                    Color(0xFF5f3bfe),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}