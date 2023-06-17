import 'package:flutter/material.dart';
import 'package:foods/data/dummy_data.dart';
import 'package:foods/models/category.dart';
import '../components/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals =
        dummyMeals.where((m) => m.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
      ),
    );
  }
}
