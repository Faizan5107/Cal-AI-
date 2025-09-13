import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_flow/screens/onboarding_steps/calorie_burned.dart';
import 'package:onboarding_flow/screens/onboarding_steps/crush_goal.dart';
import 'package:onboarding_flow/screens/onboarding_steps/desired_weight.dart';
import 'package:onboarding_flow/screens/onboarding_steps/follow_diet.dart';
import 'package:onboarding_flow/screens/onboarding_steps/generat_custom_plan.dart';
import 'package:onboarding_flow/screens/onboarding_steps/hear_about_us.dart';
import 'package:onboarding_flow/screens/onboarding_steps/height_weight.dart';
import 'package:onboarding_flow/screens/onboarding_steps/long_term_result.dart';
import 'package:onboarding_flow/screens/onboarding_steps/rating.dart';
import 'package:onboarding_flow/screens/onboarding_steps/referral_code.dart';
import 'package:onboarding_flow/screens/onboarding_steps/rollover_extra_calories.dart';
import 'package:onboarding_flow/screens/onboarding_steps/select_goal.dart';
import 'package:onboarding_flow/screens/onboarding_steps/select_workout.dart';
import 'package:onboarding_flow/screens/onboarding_steps/stopping_your_goal.dart';
import 'package:onboarding_flow/screens/onboarding_steps/thanks_for_trust.dart';
import 'package:onboarding_flow/screens/onboarding_steps/tried_calorie_tracking.dart';
import 'package:onboarding_flow/screens/onboarding_steps/weight_detail.dart';
import 'package:onboarding_flow/screens/onboarding_steps/weight_goal.dart';
import 'package:onboarding_flow/screens/onboarding_steps/when_you_born.dart';
import 'package:onboarding_flow/screens/onboarding_steps/with_cal_ai.dart';
import 'package:onboarding_flow/theme/colors.dart';
import 'package:onboarding_flow/widgets/app_button.dart';
import 'package:onboarding_flow/widgets/back_button.dart';
import 'package:onboarding_flow/widgets/custom_date_picker.dart';
import 'package:onboarding_flow/widgets/weight_slider.dart';

import '../gen/assets.gen.dart';
import '../routing/routes.dart';
import 'onboarding_steps/notification.dart';
import 'onboarding_steps/select_gender.dart';
import 'onboarding_steps/what_accomplish.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen.route(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final int totalSteps = 23;

  String? _selectedOption;

  void _nextPage() {
    if (_currentIndex < totalSteps - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
        selectedIndex = null; // ✅ reset selection index
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _selectedOption = null;
        selectedIndex = null;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }


  int? selectedIndex;

  final List<Map<String, String>> workoutOptions = [
    {
      "title": "0 – 2",
      "subtitle": "Workouts now and then",
      "image": Assets.images.workout02.path,
    },
    {
      "title": "3 – 5",
      "subtitle": "A few workouts per week",
      "image": Assets.images.workout35.path,
    },
    {
      "title": "6+",
      "subtitle": "Dedicated athlete",
      "image": Assets.images.workout6Plus.path,
    },
  ];

  final List<Map<String, String>> socialOptions = [
    {"title": "Instagram", "image": Assets.images.instagram.path},
    {"title": "Facebook", "image": Assets.images.facebook.path},
    {"title": "Tik Tok", "image": Assets.images.tiktok.path},
    {"title": "Youtube", "image": Assets.images.youtube.path},
    {"title": "Google", "image": Assets.images.google.path},
    {"title": "Friend or family", "image": Assets.images.friendOrFamily.path},
    {"title": "Play Store", "image": Assets.images.googlePlay.path},
  ];
  final List<Map<String, String>> goalOptions = [
    {"title": "Lack of consistency", "image": Assets.images.graph.path},
    {"title": "Unhealthy eating habits", "image": Assets.images.burger.path},
    {"title": "Lack of supports", "image": Assets.images.handshake.path},
    {"title": "Busy Schedule", "image": Assets.images.calender.path},
    {"title": "Lack of meal inspiration", "image": Assets.images.fruit.path},
  ];
  final List<Map<String, String>> dietOptions = [
    {"title": "Classic", "image": Assets.images.classicMeal.path},
    {"title": "Pescatarian", "image": Assets.images.fish.path},
    {"title": "Vegetarian", "image": Assets.images.fruit.path},
    {"title": "Vegan", "image": Assets.images.vegan.path},
  ];
  final List<Map<String, String>> accomplishOptions = [
    {"title": "Eat and live healthier", "image": Assets.images.apple.path},
    {
      "title": "Boost my energy and mood",
      "image": Assets.images.brightness.path,
    },
    {
      "title": "Stay motivated and consistent",
      "image": Assets.images.bicep.path,
    },
    {"title": "Feel better about my body", "image": Assets.images.yoga.path},
  ];
  final List<Map<String, String>> calorieOptions = [
    {"title": "Yes", "image": Assets.images.thumbUp.path},
    {"title": "No", "image": Assets.images.thumbDown.path},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading:
            _currentIndex > 0
                ? Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: BackButtonWidget(onPressed: _prevPage),
                )
                : null,
        title: LinearProgressIndicator(
          value: (_currentIndex + 1) / totalSteps,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation(AppColor.black),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => setState(() {
          _currentIndex = index;
          _selectedOption = null;
          selectedIndex = null;
        }),
        itemCount: totalSteps,
        itemBuilder: (context, index) {
          return _buildStep(index);
        },
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, -3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _currentIndex == 18 || _currentIndex == 19
              ? Row(
            children: [
              Expanded(
                child: AppButton(
                  onTap: () {
                    _nextPage();
                  },
                  title: "Yes",
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppButton(
                  onTap: () {
                    _nextPage();
                  },
                  title: "No",
                ),
              ),
            ],
          )
              : AppButton(
            onTap: (_currentIndex == 22)
                ? () {
              context.pushNamed(AppRoutes.generatingPlan.name);
            }
                : (_selectedOption != null ||
                _currentIndex == 4 ||
                _currentIndex == 5 ||
                _currentIndex == 6 ||
                _currentIndex == 8 ||
                _currentIndex == 9 ||
                _currentIndex == 10 ||
                _currentIndex == 11 ||
                _currentIndex == 15 ||
                _currentIndex == 16 ||
                _currentIndex == 17 ||
                _currentIndex == 20 ||
                _currentIndex == 21 ||
                _currentIndex == 22
            )
                ? _nextPage
                : null,
            title: "Continue",
          ),
        )

      ),
    );
  }

  Widget _buildStep(int index) {
    switch (index) {
      case 0:
        return SelectGender(
          title: "Choose your Gender",
          subtitle: "Choose the gender your physiology best aligns with.",
          options: ["Female", "Male", "Other"],
          selectedOption: _selectedOption,
          onSelected: (val) => setState(() => _selectedOption = val),
        );
      case 1:
        return SelectWorkout(
          title: "How many workouts do you do per week?",
          subtitle: "Choose the option that best aligns with you.",
          options: workoutOptions,
          onSelected: (index) {
            setState(() {
              selectedIndex = index;
              _selectedOption = workoutOptions[index]["title"];
            });
          },
          selectedIndex: selectedIndex,
        );
      case 2:
        return HearAboutUs(
          title: "Where did you hear about us?",
          options: socialOptions,
          onSelected: (index) {
            setState(() {
              selectedIndex = index;
              _selectedOption =
                  socialOptions[index]["title"]; // <-- correct list
            });
          },
          selectedIndex: selectedIndex,
        );
      case 3:
        return TriedCalorieTracking(
          title: "Have you tried other calorie tracking apps?",
          options: calorieOptions,
          onSelected: (index) {
            setState(() {
              selectedIndex = index;
              _selectedOption =
                  calorieOptions[index]["title"]; // <-- correct list
            });
          },
          selectedIndex: selectedIndex,
        );
      case 4:
        return LongTermResult(
          title: 'Cal AI creates long-term results',
          image: Assets.images.result.path,
        );
      case 5:
        return HeightWeightScreen();
      case 6:
        return WhenYouBorn(
          title: 'When were you born?',
          subtitle:
              'This will be taken into account when calculating your daily nutrition goals.',
        );
      case 7:
        return SelectGoal(
          title: "What is your goal?",
          subtitle: "This help us generate a plan for your calorie intake.",
          options: ["Lose Weight", "Maintain", "Gain Weight"],
          selectedOption: _selectedOption,
          onSelected: (val) => setState(() => _selectedOption = val),
        );
      case 8:
        return DesiredWeight(title: 'What is your desired weight?');
      case 9:
        return WeightDetail(
          title:
              'Gaining 110.0 lbs is a realistic target. it\'s not hard at all!',
          subtitle:
              '90% of users say that the change is obvious after usin Cal AI and it is not easy to rebound',
        );
      case 10:
        return WeightGoal(
          title: 'How fast do you want to reach your goal?',
          subtitle: 'Gain Weight speed per week',
        );
      case 11:
        return WithCalAI(
          title: 'Lose twice as much weight with Cal AI vs on your own',
          image: Assets.images.calAi.path,
        );
      case 12:
        return StoppingYourGoal(
          title: "What\'s stopping you from reaching your goals?",
          options: goalOptions,
          onSelected: (index) {
            setState(() {
              selectedIndex = index;
              _selectedOption = goalOptions[index]["title"];
            });
          },
          selectedIndex: selectedIndex,
        );
      case 13:
        return FollowDiet(
          title: "Do you follow a specific diet?",
          options: dietOptions,
          onSelected: (index) {
            setState(() {
              selectedIndex = index;
              _selectedOption = dietOptions[index]["title"];
            });
          },
          selectedIndex: selectedIndex,
        );
      case 14:
        return WhatAccomplish(
          title: "What would you like to accomplish?",
          options: accomplishOptions,
          onSelected: (index) {
            setState(() {
              selectedIndex = index;
              _selectedOption = accomplishOptions[index]["title"];
            });
          },
          selectedIndex: selectedIndex,
        );
      case 15:
        return CrushGoal(
          title: 'You have great potential to crush your goal',
          image: Assets.images.crushGoal.path,
        );
      case 16:
        return ThanksForTrust(
          title: 'Thank you for trusting us!',
          subtitle: 'Now let\'s personalize Cal AI for you...',
          image: Assets.images.privacy.path,
          gif: Assets.images.trusting.path,
        );
      case 17:
        return NotificationWidget(
          title: 'Reach your goals with notifications',
          gif: Assets.images.notification.path,
        );
      case 18:
        return CalorieBurned(title: 'Add calories burned back to your daily goal?', gif: Assets.images.calorieBurned.path);
      case 19:
        return RolloverExtraCalorie(title: 'Rollover extra calories to the next day?', gif: Assets.images.extraCalories.path);
      case 20:
        return Rating(title: 'Give us rating', gif: Assets.images.rating.path);
      case 21:
        return ReferralCode(title: 'Enter referral code (optional)', subtitle: 'You can skip this step');
      case 22:
        return GenerateCustomPlan(title: 'Time to generate your custom plan!', gif: Assets.images.customPlan.path);
        default:
        return Center(child: Text("Unknown step $index"));
    }
  }
}
