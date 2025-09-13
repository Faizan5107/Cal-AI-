import 'package:flutter/cupertino.dart';

import '../../widgets/selectable_tile.dart';
import '../../widgets/title_widget.dart';

class CrushGoal extends StatelessWidget {
  final String title;
  final String image;
  final String? subtitle;

  const CrushGoal({
    super.key,
    required this.title,
    required this.image,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
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

            Center(child: Image.asset(image,height: 280,)),


          ],
        ),
      ),
    );
  }
}
