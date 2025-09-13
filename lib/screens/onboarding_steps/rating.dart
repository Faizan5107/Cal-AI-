import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/title_widget.dart';

class Rating extends StatelessWidget {
  final String title;
  final String gif;

  const Rating({
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
            Image.asset(gif,fit: BoxFit.cover,height: 400,),
          ],
        ),
      ),
    );
  }
}
