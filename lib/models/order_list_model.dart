class OrderListModel {
  String sts;
  String msg;
  List<Orders> orders;

  OrderListModel({required this.sts, required this.msg, required this.orders});

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        sts: json["sts"],
        msg: json["msg"],
        orders:
            List<Orders>.from(json["orders"].map((x) => Orders.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "sts": sts,
        "msg": msg,
        "orders": orders.map((e) => e.toJson()).toList(),
      };
}

class Orders {
  int id;
  int userId;
  dynamic cname;
  dynamic cphone;
  dynamic cemail;
  int addressId;
  Address address;
  String type;
  int shopId;
  Shop shop;
  int amount;
  String payType;
  String payStatus;
  dynamic paytype;
  dynamic paystatus;
  String status;
  String details;
  String orderOn;

  Orders(
      {required this.id,
      required this.userId,
      required this.cname,
      required this.cphone,
      required this.cemail,
      required this.addressId,
      required this.address,
      required this.type,
      required this.shopId,
      required this.shop,
      required this.amount,
      required this.payType,
      required this.payStatus,
      required this.paytype,
      required this.paystatus,
      required this.status,
      required this.details,
      required this.orderOn});

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
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
        paytype: json["paytype"],
        paystatus: json["paystatus"],
        status: json["status"],
        details: json["details"],
        orderOn: json["order_on"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["user_id"] = userId;
    data["cname"] = cname;
    data["cphone"] = cphone;
    data["cemail"] = cemail;
    data["address_id"] = addressId;
    if (address != null) data["address"] = address.toJson();
    data["type"] = type;
    data["shop_id"] = shopId;
    if (shop != null) data["shop"] = shop.toJson();
    data["amount"] = amount;
    data["pay_type"] = payType;
    data["pay_status"] = payStatus;
    data["paytype"] = paytype;
    data["paystatus"] = paystatus;
    data["status"] = status;
    data["details"] = details;
    data["order_on"] = orderOn;
    return data;
  }
}

class Shop {
  int id;
  String name;
  String logo;
  int deliveryCharge;
  String deliveryTime;

  Shop(
      {required this.id,
      required this.name,
      required this.logo,
      required this.deliveryCharge,
      required this.deliveryTime});

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

class Address {
  int id;
  int userId;
  String name;
  String mobile;
  String phone;
  String pincode;
  String landmark;
  String city;
  String address;
  int district;
  int state;
  int country;
  String type;
  String status;

  Address(
      {required this.id,
      required this.userId,
      required this.name,
      required this.mobile,
      required this.phone,
      required this.pincode,
      required this.landmark,
      required this.city,
      required this.address,
      required this.district,
      required this.state,
      required this.country,
      required this.type,
      required this.status});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        mobile: json["mobile"],
        phone: json["phone"],
        pincode: json["pincode"],
        landmark: json["landmark"],
        city: json["city"],
        address: json["address"],
        district: json["district"],
        state: json["state"],
        country: json["country"],
        type: json["type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["user_id"] = userId;
    data["name"] = name;
    data["mobile"] = mobile;
    data["phone"] = phone;
    data["pincode"] = pincode;
    data["landmark"] = landmark;
    data["city"] = city;
    data["address"] = address;
    data["district"] = district;
    data["state"] = state;
    data["country"] = country;
    data["type"] = type;
    data["status"] = status;
    return data;
  }
}
