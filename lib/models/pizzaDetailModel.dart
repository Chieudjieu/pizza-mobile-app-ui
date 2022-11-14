// To parse this JSON data, do
//
//     final pizzaDetailModel = pizzaDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PizzaDetailModel> pizzaDetailModelFromJson(String str) => List<PizzaDetailModel>.from(json.decode(str).map((x) => PizzaDetailModel.fromJson(x)));

String pizzaDetailModelToJson(List<PizzaDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PizzaDetailModel {
  PizzaDetailModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  int id;
  String name;
  String price;
  String description;
  String image;

  factory PizzaDetailModel.fromJson(Map<String, dynamic> json) => PizzaDetailModel(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "image": image,
  };
}
