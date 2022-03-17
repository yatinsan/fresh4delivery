// To parse this JSON data, do
//
//     final cartModal = cartModalFromJson(jsonString);

import 'dart:convert';

CartModal cartModalFromJson(String str) => CartModal.fromJson(json.decode(str));

String cartModalToJson(CartModal data) => json.encode(data.toJson());

class CartModal {
  CartModal({
    this.sts,
    this.msg,
    this.cart,
    this.deliveryCharge,
    this.hasTax,
    this.taxValue,
  });

  String? sts;
  String? msg;
  List<CartListModal>? cart;
  int? deliveryCharge;
  String? hasTax;
  int? taxValue;

  factory CartModal.fromJson(Map<String, dynamic> json) => CartModal(
        sts: json["sts"],
        msg: json["msg"],
        cart: List<CartListModal>.from(
            json["cart"].map((x) => CartListModal.fromJson(x))),
        deliveryCharge: json["delivery_charge"],
        hasTax: json["has_tax"],
        taxValue: json["tax_value"],
      );

  Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "cart": List<dynamic>.from(cart!.map((x) => x.toJson())),
        "delivery_charge": deliveryCharge,
        "has_tax": hasTax,
        "tax_value": taxValue,
      };
}

class CartListModal {
  CartListModal({
    this.id,
    this.userId,
    this.shopType,
    this.shopId,
    this.productId,
    this.unitId,
    this.quantity,
    this.createdAt,
    this.productname,
    this.unitname,
    this.price,
    this.offerprice,
  });

  int? id;
  int? userId;
  String? shopType;
  int? shopId;
  int? productId;
  int? unitId;
  int? quantity;
  DateTime? createdAt;
  String? productname;
  String? unitname;
  int? price;
  int? offerprice;

  factory CartListModal.fromJson(Map<String, dynamic> json) => CartListModal(
        id: json["id"],
        userId: json["user_id"],
        shopType: json["shop_type"],
        shopId: json["shop_id"],
        productId: json["product_id"],
        unitId: json["unit_id"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        productname: json["productname"],
        unitname: json["unitname"],
        price: json["price"],
        offerprice: json["offerprice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "shop_type": shopType,
        "shop_id": shopId,
        "product_id": productId,
        "unit_id": unitId,
        "quantity": quantity,
        "created_at": createdAt!.toIso8601String(),
        "productname": productname,
        "unitname": unitname,
        "price": price,
        "offerprice": offerprice,
      };
}
