import 'package:flutter/cupertino.dart';
import 'package:onboarding_flow/widgets/weight_gain_slider.dart';
import 'package:onboarding_flow/widgets/weight_slider.dart';

import '../../widgets/title_widget.dart';

class WeightGoal extends StatelessWidget {
  final String title;
  final String? subtitle;

  const WeightGoal({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget.heading(
              title,
              fontSize: 32,
              align: TextAlign.start,
            ),

            const Spacer(),
            TitleWidget.subtitle(
              subtitle ?? '',
              align: TextAlign.center,
            ),
            // const Spacer(),
            SizedBox(height: 20,),

            WeightGainSlider(),


            const Spacer(),
          ],
        ),
      ),
    );
  }
}
