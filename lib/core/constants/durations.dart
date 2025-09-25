class RouteDurations {
  static Duration get slow => const Duration(milliseconds: 600);
  static Duration get medium => const Duration(milliseconds: 3500);
}

class AnimationDuration {
  static Duration get onboardingPage => const Duration(milliseconds: 300);
}

class CrossFadeDuration {
  static Duration get fast => const Duration(microseconds: 200);
}
