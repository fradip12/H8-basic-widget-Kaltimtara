class RecipesModel {
  int? id;
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  int? prepTimeMinutes;
  int? cookTimeMinutes;
  int? servings;
  String? difficulty;
  String? cuisine;
  int? caloriesPerServing;
  List<String>? tags;
  int? userId;
  String? image;
  double? rating;
  int? reviewCount;
  List<String>? mealType;
  bool? isFavorite;

  RecipesModel({
    this.id,
    this.name,
    this.ingredients,
    this.instructions,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.servings,
    this.difficulty,
    this.cuisine,
    this.caloriesPerServing,
    this.tags,
    this.userId,
    this.image,
    this.rating,
    this.reviewCount,
    this.mealType,
    this.isFavorite,
  });

  factory RecipesModel.fromJson(Map<String, dynamic> json) => RecipesModel(
        id: json["id"],
        name: json["name"],
        ingredients: json["ingredients"] == null
            ? []
            : List<String>.from(json["ingredients"]!.map((x) => x)),
        instructions: json["instructions"] == null
            ? []
            : List<String>.from(json["instructions"]!.map((x) => x)),
        prepTimeMinutes: json["prepTimeMinutes"],
        cookTimeMinutes: json["cookTimeMinutes"],
        servings: json["servings"],
        difficulty: json["difficulty"],
        cuisine: json["cuisine"],
        caloriesPerServing: json["caloriesPerServing"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        userId: json["userId"],
        image: json["image"],
        rating: json["rating"]?.toDouble(),
        reviewCount: json["reviewCount"],
        mealType: json["mealType"] == null
            ? []
            : List<String>.from(json["mealType"]!.map((x) => x)),
        isFavorite: false,
      );
}
