import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_flow/screens/generating_plan.dart';
import 'package:onboarding_flow/screens/main_page.dart';
import 'package:onboarding_flow/screens/onboarding_page.dart';
import 'package:onboarding_flow/routing/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRoutes.initialLocation,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.initialLocation,
      name: AppRoutes.main.name,
      builder: MainScreen.route,
      routes: [
        GoRoute(
          path: AppRoutes.onboarding.path,
          name: AppRoutes.onboarding.name,
          builder: OnboardingScreen.route,
          routes: [
            GoRoute(path: AppRoutes.generatingPlan.path,
            name: AppRoutes.generatingPlan.name,
            builder: GeneratingPlan.route)
          ]
        )
      ]
    ),
  ],
);
