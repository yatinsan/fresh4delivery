// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'dart:convert';

List<RestaurantModel> restaurantModelFromJson(String str) =>
    List<RestaurantModel>.from(
        json.decode(str).map((x) => RestaurantModel.fromJson(x)));

String restaurantModelToJson(List<RestaurantModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantModel {
  RestaurantModel({
    this.id,
    this.name,
    this.logo,
    this.deliveryTime,
    this.promoted,
  });

  dynamic id;
  String? name;
  String? logo;
  String? deliveryTime;
  String? promoted;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        deliveryTime: json["delivery_time"],
        promoted: json["promoted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "delivery_time": deliveryTime,
        "promoted": promoted,
      };
}
