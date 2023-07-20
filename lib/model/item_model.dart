import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 1)
class ItemModel extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String title;
  @HiveField(2)
  dynamic price;
  @HiveField(3)
  late String description;
  @HiveField(4)
  late String category;
  @HiveField(5)
  late String image;
  @HiveField(6)
  late Rating rating;

  ItemModel(
      {required this.id,
      required this.title,
      this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        (json['rating'] != null ? new Rating.fromJson(json['rating']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class Rating extends HiveObject {
  dynamic rate;
  late int count;

  Rating({this.rate, required this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
