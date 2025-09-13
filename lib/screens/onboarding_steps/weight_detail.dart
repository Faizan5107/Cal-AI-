import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_flow/theme/colors.dart';
import '../../widgets/title_widget.dart';

class WeightDetail extends StatelessWidget {
  final String title;
  final String? subtitle;

  const WeightDetail({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    // split logic -> detect "110.0 lbs" and style separately
    final String keyword = "110.0 lbs";
    final int startIndex = title.indexOf(keyword);

    return Padding(
      padding: const EdgeInsets.all(26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.interTight(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black),
              children: [
                TextSpan(text: title.substring(0, startIndex)),
                TextSpan(
                  text: keyword,
                  style: GoogleFonts.interTight(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  color: Colors.amber),
                ),
                TextSpan(
                  text: title.substring(startIndex + keyword.length),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TitleWidget.subtitle(
            subtitle ?? '',
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
