// To parse this JSON data, do
//
//     final supermarketModel = supermarketModelFromJson(jsonString);

import 'dart:convert';

SupermarketModel supermarketModelFromJson(String str) =>
    SupermarketModel.fromJson(json.decode(str));

String supermarketModelToJson(SupermarketModel data) =>
    json.encode(data.toJson());

class SupermarketModel {
  SupermarketModel({
    this.sts,
    this.msg,
    this.cartcount,
    this.supermarkets,
    this.nsupermarkets,
  });

  String? sts;
  String? msg;
  int? cartcount;
  List<Supermarket>? supermarkets;
  List<Supermarket>? nsupermarkets;

  factory SupermarketModel.fromJson(Map<String, dynamic> json) =>
      SupermarketModel(
        sts: json["sts"],
        msg: json["msg"],
        cartcount: json["cartcount"],
        supermarkets: List<Supermarket>.from(
            json["supermarkets"].map((x) => Supermarket.fromJson(x))),
        nsupermarkets: List<Supermarket>.from(
            json["nsupermarkets"].map((x) => Supermarket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "cartcount": cartcount,
        "supermarkets":
            List<dynamic>.from(supermarkets!.map((x) => x.toJson())),
        "nsupermarkets":
            List<dynamic>.from(nsupermarkets!.map((x) => x.toJson())),
      };
}

class Supermarket {
  Supermarket(
      {this.id,
      this.name,
      this.logo,
      this.deliveryTime,
      this.promoted,
      this.status});

  int? id;
  String? name;
  String? logo;
  String? deliveryTime;
  String? promoted;
  bool? status;

  factory Supermarket.fromJson(Map<String, dynamic> json) => Supermarket(
      id: json["id"],
      name: json["name"],
      logo: json["logo"],
      deliveryTime: json["delivery_time"],
      promoted: json["promoted"],
      status: false);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "delivery_time": deliveryTime,
        "promoted": promoted,
        "status": status
      };
}
