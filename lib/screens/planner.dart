import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app_enhancement/models/meal.dart';
import 'package:meals_app_enhancement/providers/filters_provider.dart';
import 'package:meals_app_enhancement/providers/planner_provider.dart';
import 'package:meals_app_enhancement/screens/categories.dart';
import 'package:meals_app_enhancement/widgets/planner_item.dart';

class PlannerScreen extends ConsumerStatefulWidget {
  const PlannerScreen({super.key});

  @override
  ConsumerState<PlannerScreen> createState() {
    return _PlannerScreenState();
  }
}

class _PlannerScreenState extends ConsumerState<PlannerScreen> {
  void _selectMeal(
      BuildContext context, List<Meal> availableMeals, String day) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => CategoriesScreen(
          availableMeals: availableMeals,
          planner: day,
        ),
      ),
    );
  }

  void _removeMeal(String day) {
    setState(() {
      ref.read(plannerProvider.notifier).removeMealFromPlanner(day);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            mealAction: plannedMeals['monday'] != null
                ? () => _removeMeal('monday')
                : () => _selectMeal(context, availableMeals, 'monday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Tuesday',
            meal: plannedMeals['tuesday'],
            mealAction: plannedMeals['tuesday'] != null
                ? () => _removeMeal('tuesday')
                : () => _selectMeal(context, availableMeals, 'tuesday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Wednesday',
            meal: plannedMeals['wednesday'],
            mealAction: plannedMeals['wednesday'] != null
                ? () => _removeMeal('wednesday')
                : () => _selectMeal(context, availableMeals, 'wednesday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Thursday',
            meal: plannedMeals['thursday'],
            mealAction: plannedMeals['thursday'] != null
                ? () => _removeMeal('thursday')
                : () => _selectMeal(context, availableMeals, 'thursday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Friday',
            meal: plannedMeals['friday'],
            mealAction: plannedMeals['friday'] != null
                ? () => _removeMeal('friday')
                : () => _selectMeal(context, availableMeals, 'friday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Saturday',
            meal: plannedMeals['saturday'],
            mealAction: plannedMeals['saturday'] != null
                ? () => _removeMeal('saturday')
                : () => _selectMeal(context, availableMeals, 'saturday'),
          ),
          const SizedBox(height: 24.0),
          PlannerItem(
            text: 'Sunday',
            meal: plannedMeals['sunday'],
            mealAction: plannedMeals['sunday'] != null
                ? () => _removeMeal('sunday')
                : () => _selectMeal(context, availableMeals, 'sunday'),
          ),
        ],
      ),
    );
  }
}
