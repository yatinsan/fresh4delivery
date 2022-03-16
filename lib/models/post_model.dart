// To parse this JSON data, do
//
//     final postModal = postModalFromJson(jsonString);

import 'dart:convert';

PostModal postModalFromJson(String str) => PostModal.fromJson(json.decode(str));

String postModalToJson(PostModal data) => json.encode(data.toJson());

class PostModal {
  PostModal({
    this.sts,
    this.msg,
    this.cartcount,
    this.shop,
    this.category,
    this.products,
  });

  String? sts;
  String? msg;
  int? cartcount;
  ShopModal? shop;
  Category? category;
  List<Product>? products;

  factory PostModal.fromJson(Map<String, dynamic> json) => PostModal(
        sts: json["sts"],
        msg: json["msg"],
        cartcount: json["cartcount"],
        shop: ShopModal.fromJson(json["shop"]),
        category: Category.fromJson(json["category"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "cartcount": cartcount,
        "shop": shop!.toJson(),
        "category": category!.toJson(),
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.the5,
  });

  String the5;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        the5: json["5"],
      );

  Map<String, dynamic> toJson() => {
        "5": the5,
      };
}

class Product {
  Product({
    this.id,
    this.catId,
    this.shopType,
    this.shopId,
    this.type,
    this.name,
    this.price,
    this.offerprice,
    this.status,
    this.image,
    this.hasUnits,
    this.units,
  });

  int? id;
  int? catId;
  String? shopType;
  int? shopId;
  String? type;
  String? name;
  int? price;
  int? offerprice;
  String? status;
  String? image;
  String? hasUnits;
  List<Unit>? units;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        catId: json["cat_id"],
        shopType: json["shop_type"],
        shopId: json["shop_id"],
        type: json["type"],
        name: json["name"],
        price: json["price"],
        offerprice: json["offerprice"],
        status: json["status"],
        image: json["image"],
        hasUnits: json["has_units"],
        units: List<Unit>.from(json["units"].map((x) => Unit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_id": catId,
        "shop_type": shopType,
        "shop_id": shopId,
        "type": type,
        "name": name,
        "price": price,
        "offerprice": offerprice,
        "status": status,
        "image": image,
        "has_units": hasUnits,
        "units": List<dynamic>.from(units!.map((x) => x.toJson())),
      };
}

class Unit {
  Unit({
    this.id,
    this.productId,
    this.name,
    this.price,
    this.offerprice,
    this.dispOrder,
    this.status,
  });

  int? id;
  int? productId;
  Name? name;
  int? price;
  int? offerprice;
  int? dispOrder;
  Status? status;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        productId: json["product_id"],
        name: nameValues.map![json["name"]],
        price: json["price"],
        offerprice: json["offerprice"],
        dispOrder: json["disp_order"],
        status: statusValues.map![json["status"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": nameValues.reverse![name],
        "price": price,
        "offerprice": offerprice,
        "disp_order": dispOrder,
        "status": statusValues.reverse![status],
      };
}

enum Name { ROLL, PLATE }

final nameValues = EnumValues({"Plate": Name.PLATE, "Roll": Name.ROLL});

enum Status { ENABLED }

final statusValues = EnumValues({"Enabled": Status.ENABLED});

class ShopModal {
  ShopModal({
    this.id,
    this.name,
    this.ownerName,
    this.slugName,
    this.type,
    this.serviceType,
    this.rating,
    this.email,
    this.mobile,
    this.phone,
    this.password,
    this.desc,
    this.notes,
    this.gstNo,
    this.licence,
    this.aadhar,
    this.openTime,
    this.closeTime,
    this.hours,
    this.deliveryTime,
    this.deliveryCharge,
    this.payoutOptions,
    this.verifiedStore,
    this.promoted,
    this.paymentDetails,
    this.address,
    this.pincode,
    this.city,
    this.district,
    this.state,
    this.country,
    this.agentId,
    this.franchiseId,
    this.franchiseCommession,
    this.adminCommession,
    this.status,
    this.hasTax,
    this.taxValue,
    this.logo,
    this.banner,
    this.photo,
    this.sign,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? ownerName;
  String? slugName;
  String? type;
  int? serviceType;
  int? rating;
  String? email;
  String? mobile;
  String? phone;
  String? password;
  String? desc;
  String? notes;
  String? gstNo;
  String? licence;
  String? aadhar;
  int? openTime;
  int? closeTime;
  String? hours;
  String? deliveryTime;
  int? deliveryCharge;
  String? payoutOptions;
  String? verifiedStore;
  String? promoted;
  String? paymentDetails;
  String? address;
  String? pincode;
  String? city;
  int? district;
  int? state;
  int? country;
  int? agentId;
  int? franchiseId;
  int? franchiseCommession;
  int? adminCommession;
  String? status;
  String? hasTax;
  int? taxValue;
  String? logo;
  String? banner;
  String? photo;
  String? sign;
  String? latitude;
  String? longitude;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ShopModal.fromJson(Map<String, dynamic> json) => ShopModal(
        id: json["id"],
        name: json["name"],
        ownerName: json["owner_name"],
        slugName: json["slug_name"],
        type: json["type"],
        serviceType: json["service_type"],
        rating: json["rating"],
        email: json["email"],
        mobile: json["mobile"],
        phone: json["phone"],
        password: json["password"],
        desc: json["desc"],
        notes: json["notes"],
        gstNo: json["gst_no"],
        licence: json["licence"],
        aadhar: json["aadhar"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        hours: json["hours"],
        deliveryTime: json["delivery_time"],
        deliveryCharge: json["delivery_charge"],
        payoutOptions: json["payout_options"],
        verifiedStore: json["verified_store"],
        promoted: json["promoted"],
        paymentDetails: json["payment_details"],
        address: json["address"],
        pincode: json["pincode"],
        city: json["city"],
        district: json["district"],
        state: json["state"],
        country: json["country"],
        agentId: json["agent_id"],
        franchiseId: json["franchise_id"],
        franchiseCommession: json["franchise_commession"],
        adminCommession: json["admin_commession"],
        status: json["status"],
        hasTax: json["has_tax"],
        taxValue: json["tax_value"],
        logo: json["logo"],
        banner: json["banner"],
        photo: json["photo"],
        sign: json["sign"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "owner_name": ownerName,
        "slug_name": slugName,
        "type": type,
        "service_type": serviceType,
        "rating": rating,
        "email": email,
        "mobile": mobile,
        "phone": phone,
        "password": password,
        "desc": desc,
        "notes": notes,
        "gst_no": gstNo,
        "licence": licence,
        "aadhar": aadhar,
        "open_time": openTime,
        "close_time": closeTime,
        "hours": hours,
        "delivery_time": deliveryTime,
        "delivery_charge": deliveryCharge,
        "payout_options": payoutOptions,
        "verified_store": verifiedStore,
        "promoted": promoted,
        "payment_details": paymentDetails,
        "address": address,
        "pincode": pincode,
        "city": city,
        "district": district,
        "state": state,
        "country": country,
        "agent_id": agentId,
        "franchise_id": franchiseId,
        "franchise_commession": franchiseCommession,
        "admin_commession": adminCommession,
        "status": status,
        "has_tax": hasTax,
        "tax_value": taxValue,
        "logo": logo,
        "banner": banner,
        "photo": photo,
        "sign": sign,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
