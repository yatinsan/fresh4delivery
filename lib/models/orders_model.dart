import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.sts,
    this.msg,
    this.orders,
  });

  String? sts;
  String? msg;
  List<OrderObjectModel>? orders;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        sts: json["sts"],
        msg: json["msg"],
        orders: List<OrderObjectModel>.from(
            json["orders"].map((x) => OrderObjectModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class OrderObjectModel {
  OrderObjectModel({
    this.id,
    this.userId,
    this.cname,
    this.cphone,
    this.cemail,
    this.addressId,
    this.address,
    this.type,
    this.shopId,
    this.shop,
    this.amount,
    this.payType,
    this.payStatus,
    this.status,
    this.details,
    this.orderOn,
  });

  int? id;
  int? userId;
  dynamic cname;
  dynamic cphone;
  dynamic cemail;
  int? addressId;
  Address? address;
  String? type;
  int? shopId;
  Shop? shop;
  int? amount;
  String? payType;
  String? payStatus;
  String? status;
  String? details;
  String? orderOn;

  factory OrderObjectModel.fromJson(Map<String, dynamic> json) =>
      OrderObjectModel(
        id: json["id"],
        userId: json["user_id"],
        cname: json["cname"],
        cphone: json["cphone"],
        cemail: json["cemail"],
        addressId: json["address_id"],
        address: Address.fromJson(json["address"]),
        type: json["type"],
        shopId: json["shop_id"],
        shop: Shop.fromJson(json["shop"]),
        amount: json["amount"],
        payType: json["pay_type"],
        payStatus: json["pay_status"],
        status: json["status"],
        details: json["details"],
        orderOn: json["order_on"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "cname": cname,
        "cphone": cphone,
        "cemail": cemail,
        "address_id": addressId,
        "address": address!.toJson(),
        "type": type,
        "shop_id": shopId,
        "shop": shop!.toJson(),
        "amount": amount,
        "pay_type": payType,
        "pay_status": payStatus,
        "status": status,
        "details": details,
        "order_on": orderOn,
      };
}

class Address {
  Address({
    this.id,
    this.name,
    this.mobile,
    this.phone,
    this.pincode,
    this.landmark,
    this.city,
    this.address,
    this.type,
  });

  int? id;
  String? name;
  String? mobile;
  String? phone;
  String? pincode;
  String? landmark;
  String? city;
  String? address;
  String? type;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        phone: json["phone"],
        pincode: json["pincode"],
        landmark: json["landmark"],
        city: json["city"],
        address: json["address"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "phone": phone,
        "pincode": pincode,
        "landmark": landmark,
        "city": city,
        "address": address,
        "type": type,
      };
}

class Shop {
  Shop({
    this.id,
    this.name,
    this.logo,
    this.deliveryCharge,
    this.deliveryTime,
  });

  int? id;
  String? name;
  String? logo;
  int? deliveryCharge;
  String? deliveryTime;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        deliveryCharge: json["delivery_charge"],
        deliveryTime: json["delivery_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "delivery_charge": deliveryCharge,
        "delivery_time": deliveryTime,
      };
}
