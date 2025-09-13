import 'package:flutter/cupertino.dart';

import '../../widgets/title_widget.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String gif;

  const NotificationWidget({
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
            const Spacer(),

            TitleWidget.heading(
              title,
              fontSize: 32,
              align: TextAlign.center,
            ),
            SizedBox(height: 20,),
            Image.asset(gif),

            const Spacer(),






            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
