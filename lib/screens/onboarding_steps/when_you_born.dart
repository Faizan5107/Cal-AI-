import 'package:flutter/cupertino.dart';
import 'package:onboarding_flow/widgets/custom_date_picker.dart';

import '../../widgets/selectable_tile.dart';
import '../../widgets/title_widget.dart';

class WhenYouBorn extends StatelessWidget {
  final String title;
  final String? subtitle;

  const WhenYouBorn({
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
            SizedBox(height: 40,),
            CustomDOBPicker(
              initialDate: DateTime.now(),
              onDateChanged: (date) {
                print("Selected DOB: $date");
              },
            ),
          ],
        ),
      ),
    );
  }
}
