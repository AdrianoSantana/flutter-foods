import 'package:flutter/material.dart';
import 'package:foods/data/dummy_data.dart';
import 'package:foods/models/settings.dart';
import 'package:foods/screens/meal_details_screen.dart';
import 'package:foods/screens/settings_screen.dart';
import 'package:foods/screens/tabs_screen.dart';
import 'package:foods/utils/app_routes.dart';

import './screens/categories_meals_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = dummyMeals;
  Settings settings = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGlutten = settings.isGluttenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterIsVegan = settings.isVegan && !meal.isVegan;
        final filterIsVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGlutten &&
            !filterLactose &&
            !filterIsVegan &&
            !filterIsVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber[300],
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
              titleSmall: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.home: (_) => TabsScreen(),
        AppRoutes.categoriesMeals: (_) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.mealDetails: (_) => const MealDetailsScreen(),
        AppRoutes.settings: (_) => SettingScreens(
              settings: settings,
              onSettingsChanged: _filterMeals,
            ),
      },
    );
  }
}
