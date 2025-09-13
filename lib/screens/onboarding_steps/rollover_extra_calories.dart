import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/title_widget.dart';

class RolloverExtraCalorie extends StatelessWidget {
  final String title;
  final String gif;

  const RolloverExtraCalorie({
    super.key,
    required this.title,
    required this.gif,
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
              align: TextAlign.center,
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12)
              ),padding: EdgeInsets.all(6),
              child: TitleWidget.normal(
                'Rollover up to 200 cals',
                fontSize: 12,
                align: TextAlign.center,
              ),
            ),
            Center(child: Image.asset(gif,height: 300,)),


          ],
        ),
      ),
    );
  }
}
