import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';

import '../gen/assets.gen.dart';
import '../theme/colors.dart';

class SignInBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [


            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10,right: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [

                  TitleWidget.normal(
                    "Sign in",
                      fontSize: 20,
                    align: TextAlign.center
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close,size: 12,),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),


            Divider(thickness: 0.3,),


            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.black,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    icon: Image.asset(
                      Assets.images.appleLogo.path,
                      height: 24,
                    ),
                    label: TitleWidget.normal("Sign in with Apple",color: Colors.white),
                    onPressed: () {
                      // TODO: handle Google sign in
                    },
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    icon: Image.asset(
                      Assets.images.google.path,
                      height: 24,
                    ),
                    label: TitleWidget.normal("Sign in with Google"),
                    onPressed: () {
                      // TODO: handle Google sign in
                    },
                  ),

                  const SizedBox(height: 12),

                  // Email Sign In Button
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    icon: const Icon(Icons.mail_outline),
                    label:  TitleWidget.normal("Sign in with Email"),
                    onPressed: () {
                      // TODO: handle Email sign in
                    },
                  ),

                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 52),
                    child: Text.rich(
                      TextSpan(
                        text: "By continuing, you agree to Cal AI's ",
                        style:  GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColor.black,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms and Conditions",
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline
                            ),
                          ),
                           TextSpan(text: " and "),
                           TextSpan(
                            text: "Privacy Policy",
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

          ],
        );
      },
    );
  }
}
