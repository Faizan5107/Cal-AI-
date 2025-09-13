import 'package:flutter/cupertino.dart';

import '../../widgets/selectable_tile.dart';
import '../../widgets/title_widget.dart';

class ThanksForTrust extends StatelessWidget {
  final String title;
  final String image;
  final String gif;
  final String? subtitle;

  const ThanksForTrust({
    super.key,
    required this.title,
    required this.image,
    required this.gif,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset(gif,height: 200,)),



            TitleWidget.heading(
              title,
              fontSize: 32,
              align: TextAlign.center,
            ),
            TitleWidget.subtitle(
              subtitle ?? '',
              align: TextAlign.center,
            ),

            Center(child: Image.asset(image,height: 130,)),


            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
