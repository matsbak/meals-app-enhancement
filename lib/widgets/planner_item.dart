import 'package:flutter/material.dart';

import 'package:meals_app_enhancement/models/meal.dart';
import 'package:meals_app_enhancement/screens/meal_details.dart';
import 'package:meals_app_enhancement/widgets/meal_item.dart';

class PlannerItem extends StatelessWidget {
  const PlannerItem({
    super.key,
    required this.text,
    required this.meal,
    required this.mealAction,
  });

  final String text;
  final Meal? meal;
  final void Function() mealAction;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: mealAction,
              icon: Icon(meal != null ? Icons.remove : Icons.add),
              iconSize: 30.0,
            ),
          ],
        ),
        if (meal != null)
          MealItem(
            meal: meal!,
            onSelectMeal: (meal) {
              _selectMeal(context, meal);
            },
          )
      ],
    );
  }
}
