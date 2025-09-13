enum AppRoutes {
  main('main', '/main'),
  onboarding('onboarding', '/onboarding'),
  generatingPlan('generating-plan', '/generating-plan'),
  ;

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);

  static String get initialLocation => AppRoutes.main.path;

}

