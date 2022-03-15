class HomeModel {
  String? sts;
  String? msg;
  int? cartcount;
  List<Categories>? categories;
  List<Fbanners>? fbanners;
  List<Sbanners>? sbanners;
  List<dynamic>? restaurants;
  List<Nrestaurants>? nrestaurants;
  List<dynamic>? supermarkets;
  List<Nsupermarkets>? nsupermarkets;
  List<dynamic>? restproducts;
  List<Nrestproducts>? nrestproducts;

  HomeModel(
      {this.sts,
      this.msg,
      this.cartcount,
      this.categories,
      this.fbanners,
      this.sbanners,
      this.restaurants,
      this.nrestaurants,
      this.supermarkets,
      this.nsupermarkets,
      this.restproducts,
      this.nrestproducts});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json["sts"] is String) this.sts = json["sts"];
    if (json["msg"] is String) this.msg = json["msg"];
    if (json["cartcount"] is int) this.cartcount = json["cartcount"];
    if (json["categories"] is List)
      this.categories = json["categories"] == null
          ? null
          : (json["categories"] as List)
              .map((e) => Categories.fromJson(e))
              .toList();
    if (json["fbanners"] is List)
      this.fbanners = json["fbanners"] == null
          ? null
          : (json["fbanners"] as List)
              .map((e) => Fbanners.fromJson(e))
              .toList();
    if (json["sbanners"] is List)
      this.sbanners = json["sbanners"] == null
          ? null
          : (json["sbanners"] as List)
              .map((e) => Sbanners.fromJson(e))
              .toList();
    if (json["restaurants"] is List)
      this.restaurants = json["restaurants"] ?? [];
    if (json["nrestaurants"] is List)
      this.nrestaurants = json["nrestaurants"] == null
          ? null
          : (json["nrestaurants"] as List)
              .map((e) => Nrestaurants.fromJson(e))
              .toList();
    if (json["supermarkets"] is List)
      this.supermarkets = json["supermarkets"] ?? [];
    if (json["nsupermarkets"] is List)
      this.nsupermarkets = json["nsupermarkets"] == null
          ? null
          : (json["nsupermarkets"] as List)
              .map((e) => Nsupermarkets.fromJson(e))
              .toList();
    if (json["restproducts"] is List)
      this.restproducts = json["restproducts"] ?? [];
    if (json["nrestproducts"] is List)
      this.nrestproducts = json["nrestproducts"] == null
          ? null
          : (json["nrestproducts"] as List)
              .map((e) => Nrestproducts.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["sts"] = this.sts;
    data["msg"] = this.msg;
    data["cartcount"] = this.cartcount;
    if (this.categories != null)
      data["categories"] = this.categories?.map((e) => e.toJson()).toList();
    if (this.fbanners != null)
      data["fbanners"] = this.fbanners?.map((e) => e.toJson()).toList();
    if (this.sbanners != null)
      data["sbanners"] = this.sbanners?.map((e) => e.toJson()).toList();
    if (this.restaurants != null) data["restaurants"] = this.restaurants;
    if (this.nrestaurants != null)
      data["nrestaurants"] = this.nrestaurants?.map((e) => e.toJson()).toList();
    if (this.supermarkets != null) data["supermarkets"] = this.supermarkets;
    if (this.nsupermarkets != null)
      data["nsupermarkets"] =
          this.nsupermarkets?.map((e) => e.toJson()).toList();
    if (this.restproducts != null) data["restproducts"] = this.restproducts;
    if (this.nrestproducts != null)
      data["nrestproducts"] =
          this.nrestproducts?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Nrestproducts {
  int? id;
  String? name;
  String? type;
  int? catId;
  String? hasUnits;
  int? price;
  int? offerprice;
  String? image;
  String? restname;

  Nrestproducts(
      {this.id,
      this.name,
      this.type,
      this.catId,
      this.hasUnits,
      this.price,
      this.offerprice,
      this.image,
      this.restname});

  Nrestproducts.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["type"] is String) this.type = json["type"];
    if (json["cat_id"] is int) this.catId = json["cat_id"];
    if (json["has_units"] is String) this.hasUnits = json["has_units"];
    if (json["price"] is int) this.price = json["price"];
    if (json["offerprice"] is int) this.offerprice = json["offerprice"];
    if (json["image"] is String) this.image = json["image"];
    if (json["restname"] is String) this.restname = json["restname"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["type"] = this.type;
    data["cat_id"] = this.catId;
    data["has_units"] = this.hasUnits;
    data["price"] = this.price;
    data["offerprice"] = this.offerprice;
    data["image"] = this.image;
    data["restname"] = this.restname;
    return data;
  }
}

class Nsupermarkets {
  int? id;
  String? name;
  String? logo;
  String? deliveryTime;
  String? promoted;
  int? rating;

  Nsupermarkets(
      {this.id,
      this.name,
      this.logo,
      this.deliveryTime,
      this.promoted,
      this.rating});

  Nsupermarkets.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["logo"] is String) this.logo = json["logo"];
    if (json["delivery_time"] is String)
      this.deliveryTime = json["delivery_time"];
    if (json["promoted"] is String) this.promoted = json["promoted"];
    if (json["rating"] is int) this.rating = json["rating"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["logo"] = this.logo;
    data["delivery_time"] = this.deliveryTime;
    data["promoted"] = this.promoted;
    data["rating"] = this.rating;
    return data;
  }
}

class Nrestaurants {
  int? id;
  String? name;
  String? logo;
  String? deliveryTime;
  String? promoted;
  int? rating;

  Nrestaurants(
      {this.id,
      this.name,
      this.logo,
      this.deliveryTime,
      this.promoted,
      this.rating});

  Nrestaurants.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["logo"] is String) this.logo = json["logo"];
    if (json["delivery_time"] is String)
      this.deliveryTime = json["delivery_time"];
    if (json["promoted"] is String) this.promoted = json["promoted"];
    if (json["rating"] is int) this.rating = json["rating"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["logo"] = this.logo;
    data["delivery_time"] = this.deliveryTime;
    data["promoted"] = this.promoted;
    data["rating"] = this.rating;
    return data;
  }
}

class Sbanners {
  int? id;
  String? type;
  String? name;
  String? image;
  String? url;
  int? disporder;

  Sbanners(
      {this.id, this.type, this.name, this.image, this.url, this.disporder});

  Sbanners.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["type"] is String) this.type = json["type"];
    if (json["name"] is String) this.name = json["name"];
    if (json["image"] is String) this.image = json["image"];
    if (json["url"] is String) this.url = json["url"];
    if (json["disporder"] is int) this.disporder = json["disporder"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["type"] = this.type;
    data["name"] = this.name;
    data["image"] = this.image;
    data["url"] = this.url;
    data["disporder"] = this.disporder;
    return data;
  }
}

class Fbanners {
  int? id;
  String? type;
  String? name;
  String? image;
  String? url;
  int? disporder;

  Fbanners(
      {this.id, this.type, this.name, this.image, this.url, this.disporder});

  Fbanners.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["type"] is String) this.type = json["type"];
    if (json["name"] is String) this.name = json["name"];
    if (json["image"] is String) this.image = json["image"];
    if (json["url"] is String) this.url = json["url"];
    if (json["disporder"] is int) this.disporder = json["disporder"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["type"] = this.type;
    data["name"] = this.name;
    data["image"] = this.image;
    data["url"] = this.url;
    data["disporder"] = this.disporder;
    return data;
  }
}

class Categories {
  int? id;
  String? type;
  String? name;
  int? dispOrder;
  String? image;

  Categories({this.id, this.type, this.name, this.dispOrder, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["type"] is String) this.type = json["type"];
    if (json["name"] is String) this.name = json["name"];
    if (json["disp_order"] is int) this.dispOrder = json["disp_order"];
    if (json["image"] is String) this.image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["type"] = this.type;
    data["name"] = this.name;
    data["disp_order"] = this.dispOrder;
    data["image"] = this.image;
    return data;
  }
}
