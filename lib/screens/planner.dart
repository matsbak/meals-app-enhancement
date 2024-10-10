import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app_enhancement/models/meal.dart';
import 'package:meals_app_enhancement/providers/filters_provider.dart';
import 'package:meals_app_enhancement/providers/planner_provider.dart';
import 'package:meals_app_enhancement/screens/categories.dart';
import 'package:meals_app_enhancement/widgets/planner_item.dart';

class PlannerScreen extends ConsumerWidget {
  const PlannerScreen({super.key});

  void _selectMeal(BuildContext context, List<Meal> availableMeals, String day) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => CategoriesScreen(
          availableMeals: availableMeals,
          planner: day,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableMeals = ref.watch(filteredMealsProvider);
    final plannedMeals = ref.watch(plannerProvider);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlannerItem(
            text: 'Monday',
            meal: plannedMeals['monday'],
            onSelectMeal: () => _selectMeal(context, availableMeals, 'monday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Tuesday',
            meal: plannedMeals['tuesday'],
            onSelectMeal: () => _selectMeal(context, availableMeals, 'tuesday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Wednesday',
            meal: plannedMeals['wednesday'],
            onSelectMeal: () => _selectMeal(context, availableMeals, 'wednesday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Thursday',
            meal: plannedMeals['thursday'],
            onSelectMeal: () => _selectMeal(context, availableMeals, 'thursday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Friday',
            meal: plannedMeals['friday'],
            onSelectMeal: () => _selectMeal(context, availableMeals, 'friday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Saturday',
            meal: plannedMeals['saturday'],
            onSelectMeal: () => _selectMeal(context, availableMeals, 'saturday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Sunday',
            meal: plannedMeals['sunday'],
            onSelectMeal: () => _selectMeal(context, availableMeals, 'sunday'),
          ),
        ],
      ),
    );
  }
}
