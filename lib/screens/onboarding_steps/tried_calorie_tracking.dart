import 'package:flutter/cupertino.dart';
import 'package:onboarding_flow/widgets/animation.dart';

import '../../widgets/selectable_tile.dart';
import '../../widgets/title_widget.dart';

class TriedCalorieTracking extends StatefulWidget {
  final String title;
  final String? subtitle;
  final List<Map<String, String>> options;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  const TriedCalorieTracking({
    super.key,
    required this.title,
    this.subtitle,
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  State<TriedCalorieTracking> createState() => _TriedCalorieTrackingState();
}

class _TriedCalorieTrackingState extends State<TriedCalorieTracking>
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
      final end = (start + 0.8).clamp(0.0, 1.0);
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
              widget.subtitle ?? '',
              align: TextAlign.start,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: widget.options.length,
                itemBuilder: (context, index) {
                  return AnimatedWrapper(
                    animation: _animations[index],
                    child: SelectableTile(
                      height: 80,
                      image: widget.options[index]["image"]!,
                      title: widget.options[index]["title"]!,
                      isSelected: widget.selectedIndex == index,
                      onTap: () => widget.onSelected(index),
                    ),
                  );
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}
