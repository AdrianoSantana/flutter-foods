import 'package:flutter/material.dart';
import 'package:foods/utils/app_routes.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({super.key, required this.meal});

  void _selectMealDetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoutes.mealDetails,
      arguments: meal,
    )
        .then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMealDetails(context),
      borderRadius: BorderRadius.circular(15.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 300,
                  color: Colors.black45,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    meal.title,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(meal.complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(meal.complexityText)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
