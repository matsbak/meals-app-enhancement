import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app_enhancement/models/meal.dart';
import 'package:meals_app_enhancement/providers/planner_provider.dart';
import 'package:meals_app_enhancement/screens/meal_details.dart';
import 'package:meals_app_enhancement/widgets/meal_item.dart';

class MealsScreen extends ConsumerWidget {
  const MealsScreen({
    super.key,
    this.title,
    this.planner,
    required this.meals,
  });

  final String? title;
  final String? planner;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  void _selectMealForPlanner(WidgetRef ref, Meal meal) {
    ref.read(plannerProvider.notifier).addMealToPlanner(planner!, meal);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            planner != null ? _selectMealForPlanner(ref, meal) : _selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    if (planner != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Meal Planner'),
        ),
        body: content,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
