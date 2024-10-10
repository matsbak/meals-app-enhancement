import 'package:flutter/material.dart';
import 'package:meals_app_enhancement/models/meal.dart';

class PlannerItem extends StatelessWidget {
  const PlannerItem({
    super.key,
    required this.text,
    required this.meal,
    required this.onSelectMeal,
  });

  final String text;
  final Meal? meal;
  final void Function() onSelectMeal;

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
              onPressed: onSelectMeal,
              icon: const Icon(Icons.add),
              iconSize: 30.0,
            ),
          ],
        ),
        // Testing widget
        Text(
          meal != null ? meal!.title : 'No meal',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
