import 'package:flutter/cupertino.dart';
import 'package:onboarding_flow/widgets/weight_slider.dart';

import '../../widgets/selectable_tile.dart';
import '../../widgets/title_widget.dart';

class DesiredWeight extends StatelessWidget {
  final String title;
  final String? subtitle;

  const DesiredWeight({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget.heading(
            title,
            fontSize: 32,
            align: TextAlign.start,
          ),
          TitleWidget.subtitle(
            subtitle ?? '',
            align: TextAlign.start,
          ),
          // const Spacer(),

          WeightSlider(),


          // const Spacer(),
        ],
      ),
    );
  }
}
