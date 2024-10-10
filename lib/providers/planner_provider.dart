import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app_enhancement/models/meal.dart';

class PlannerNotifier extends StateNotifier<Map<String, Meal>> {
  PlannerNotifier() : super({});

  void addMealToPlanner(String day, Meal meal) {
    Map<String, Meal> map = {day: meal};
    map.addAll(state);
    state = map;
  }

  void removeMealFromPlanner(String day) {
    Map<String, Meal> map = state;
    map.remove(day);
    state = map;
  }
}

final plannerProvider =
    StateNotifierProvider<PlannerNotifier, Map<String, Meal>>((ref) {
  return PlannerNotifier();
});
