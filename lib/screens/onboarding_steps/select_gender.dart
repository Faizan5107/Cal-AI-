import 'package:flutter/material.dart';
import 'package:onboarding_flow/theme/colors.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';
import 'package:onboarding_flow/widgets/custom_toggle_container.dart';

import '../../widgets/animation.dart';

class SelectGender extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String> onSelected;

  const SelectGender({
    super.key,
    required this.title,
    required this.subtitle,
    required this.options,
    required this.selectedOption,
    required this.onSelected,
  });

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _animations = List.generate(widget.options.length, (index) {
      final start = index * 0.10;
      final end = start + 0.8;
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOut),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget.heading(
              widget.title,
              fontSize: 32,
              align: TextAlign.start,
            ),
            TitleWidget.subtitle(
              widget.subtitle,
              align: TextAlign.start,
            ),
            const Spacer(),
            ...List.generate(widget.options.length, (i) {
              return AnimatedWrapper(
                animation: _animations[i],
                child: CustomToggleContainer(
                  text: widget.options[i],
                  isSelected: widget.selectedOption == widget.options[i],
                  onTap: () => widget.onSelected(widget.options[i]),
                  activeColor: AppColor.black,
                  inactiveColor: AppColor.inactiveColor,
                  activeTextColor: Colors.white,
                  inactiveTextColor: AppColor.black,
                ),
              );
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
