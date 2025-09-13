import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_flow/routing/routes.dart';
import 'package:onboarding_flow/theme/colors.dart';
import 'package:onboarding_flow/widgets/app_button.dart';
import 'package:onboarding_flow/widgets/language_button.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';

import '../gen/assets.gen.dart';
import '../widgets/back_button.dart';
import '../widgets/sign_in_bottom_sheet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen.route(
      BuildContext context,
      GoRouterState state, {
        super.key,
      });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
                child: LanguageButton(text: 'EN', icon: Assets.images.flagAmerica.image(height: 18,width: 20), onPressed: (){})),
            Image.asset(Assets.images.mobile.path,height: 400,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TitleWidget.heading('Calorie tracking made easy',fontSize: 36,align: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 14),
                    child: AppButton(title: 'Get Started', onTap: (){
                      context.pushNamed(AppRoutes.onboarding.name);
                    }),
                  ),
                  RichText(text: TextSpan(
                    text: 'Already have an account? ',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColor.black
                    ),
                  children: [
                      TextSpan(
                      text: 'Sign in',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColor.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                      ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            SignInBottomSheet.show(context);
                          },
                      )
                  ]
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
