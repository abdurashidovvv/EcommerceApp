import 'RatingModel.dart';

class ProductModel {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  RatingModel rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        price: json["price"] ?? 0,
        description: json["description"] ?? "",
        category: json["category"],
        image: json["image"],
        rating: RatingModel.fromJson(json["rating"] ?? {}));
  }
}
