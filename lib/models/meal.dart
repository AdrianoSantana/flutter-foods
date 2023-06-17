enum Complexity { simple, medium, difficult }

enum Cost { cheap, fair, expensive }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final int duration;
  final Cost cost;
  final Complexity complexity;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
    required this.duration,
    required this.cost,
    required this.complexity,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simples";
      case Complexity.medium:
        return "Médio";

      case Complexity.difficult:
        return "Difícil";

      default:
        return "Desconhecida";
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return "Simples";
      case Cost.fair:
        return "Justo";
      case Cost.expensive:
        return "Caro";

      default:
        return "Desconhecido";
    }
  }
}
