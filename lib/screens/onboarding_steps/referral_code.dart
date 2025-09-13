import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_flow/widgets/app_button.dart';

import '../../widgets/text_field_widget.dart';
import '../../widgets/title_widget.dart';

class ReferralCode extends StatelessWidget {
  final String title;
  final String subtitle;

   ReferralCode({
    super.key,
    required this.title,
    required this.subtitle,
  });
TextEditingController referralController = TextEditingController();
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
            SizedBox(height: 5,),
            TitleWidget.subtitle(
              subtitle,
              fontSize: 14,
              align: TextAlign.start,
            ),
            Spacer(),
            TextFormFieldWidget(controller: referralController, hintText: 'Referral Code',suffixIcon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: AppButton(title: 'Submit', onTap: (){},size: Size(10, 10),),
            ),),

            const Spacer(),

          ],
        ),
      ),
    );
  }
}
