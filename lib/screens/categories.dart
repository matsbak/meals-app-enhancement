import 'package:flutter/material.dart';

import 'package:meals_app_enhancement/data/dummy_data.dart';
import 'package:meals_app_enhancement/models/category.dart';
import 'package:meals_app_enhancement/models/meal.dart';
import 'package:meals_app_enhancement/screens/meals.dart';
import 'package:meals_app_enhancement/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    this.planner,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;
  final String? planner;

  @override
  State<CategoriesScreen> createState() {
    return _CategoriesScreenState();
  }
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      // lowerBound: 0.0,
      // upperBound: 1.0,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Navigator.push(context, route);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  void _selectCategoryInPlanner(
      BuildContext context, Category category, String planner) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Navigator.push(context, route);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          planner: planner,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(24.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
          children: [
            // ...availableCategories
            //     .map((category) => CategoryGridItem(category: category)),
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  widget.planner != null
                      ? _selectCategoryInPlanner(
                      context, category, widget.planner!)
                      : _selectCategory(context, category);
                },
              )
          ],
        ),
        builder: (context, child) => SlideTransition(
          position: Tween(
            begin: const Offset(0.0, 0.3),
            end: const Offset(0.0, 0.0),
          ).animate(CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          )),
          child: child,
        ));

    if (widget.planner != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Meal Planner'),
        ),
        body: content,
      );
    }

    return content;
  }
}
