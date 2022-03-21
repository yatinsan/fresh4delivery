import 'dart:convert';

import 'package:fresh4delivery/config/constants/api_configurations.dart';
import 'package:fresh4delivery/models/address_model.dart';
import 'package:fresh4delivery/models/cart_modal.dart';
import 'package:fresh4delivery/models/home_model.dart';
import 'package:fresh4delivery/models/orders_model.dart';
import 'package:fresh4delivery/models/pincode_model.dart';
import 'package:fresh4delivery/models/post_model.dart';
import 'package:fresh4delivery/models/res_model.dart';
import 'package:fresh4delivery/models/restaurant_category_modal.dart';
import 'package:fresh4delivery/models/search_state_model.dart';
import 'package:fresh4delivery/models/supermarket_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String cookie = '';

class Preference {
  static getPrefs(String data) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(data);
  }

  static remove(String data) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(data);
  }
}

class HomeApi {
  static Future<List<CategoryModel>?> categories() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = await http.post(Uri.parse(Api.user.home), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
        "limit": "10"
      });

      var responseBody = json.decode(response.body);
      // print(responseBody['categories']);

      List<CategoryModel> categoriesList = [];
      for (var i in responseBody['categories']) {
        categoriesList.add(CategoryModel.fromJson(i));
      }

      return categoriesList;
    } catch (e) {
      return null;
    }
  }

  static Future<List<BannerModel>?> fbanner() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = await http.post(Uri.parse(Api.user.home), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
        "limit": "10"
      });

      var responseBody = json.decode(response.body);

      List<BannerModel> bannerList = [];
      for (var i in responseBody['fbanners']) {
        bannerList.add(BannerModel.fromJson(i));
      }

      return bannerList;
    } catch (e) {
      return null;
    }
  }

  static Future<List<BannerModel>?> sbanner() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = await http.post(Uri.parse(Api.user.home), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
        "limit": "10"
      });

      var responseBody = json.decode(response.body);

      List<BannerModel> bannerList = [];
      for (var i in responseBody['sbanners']) {
        bannerList.add(BannerModel.fromJson(i));
      }

      return bannerList;
    } catch (e) {
      return null;
    }
  }

  static Future<List<RestproductModel>?> restProducts() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = await http.post(Uri.parse(Api.user.home), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
        "limit": "10"
      });

      var responseBody = json.decode(response.body);

      List<RestproductModel> productsList = [];
      for (var i in responseBody['restproducts']) {
        i["status"] = true;
        productsList.add(RestproductModel.fromJson(i));
      }
      for (var i in responseBody['nrestproducts']) {
        i["status"] = false;
        productsList.add(RestproductModel.fromJson(i));
      }

      return productsList;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Nrestaurants>?> restaurants() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = await http.post(Uri.parse(Api.user.home), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
      });

      var responseBody = json.decode(response.body);
      List<Nrestaurants> restaurantList = [];
      for (var i in responseBody['restaurants']) {
        i["status"] = true;
        restaurantList.add(Nrestaurants.fromJson(i));
      }
      for (var i in responseBody['nrestaurants']) {
        i["status"] = false;
        restaurantList.add(Nrestaurants.fromJson(i));
      }

      return restaurantList;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Nrestaurants>?> supermarket() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = await http.post(Uri.parse(Api.user.home), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
      });

      var responseBody = json.decode(response.body);
      List<Nrestaurants> supermarketList = [];
      for (var i in responseBody['supermarkets']) {
        i["status"] = true;
        supermarketList.add(Nrestaurants.fromJson(i));
      }
      for (var i in responseBody['nsupermarkets']) {
        i["status"] = false;
        supermarketList.add(Nrestaurants.fromJson(i));
      }

      return supermarketList;
    } catch (e) {
      return null;
    }
  }
}

//**************//
//Authentication api
class AuthCustomer {
  static Future phoneCheck(phone) async {
    try {
      var response = await http
          .post(Uri.parse(Api.user.checkNumber), body: {"number": phone});

      var responseBody = json.decode(response.body);
      print(responseBody);

      if (responseBody["sts"] == "01") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return "Error";
    }
  }

  static Future signUp(name, email, phone, password) async {
    try {
      var response = await http.post(Uri.parse(Api.user.register), body: {
        "name": name,
        "email": email,
        "number": phone,
        "password": password
      });

      var responseBody = json.decode(response.body);
      cookie = responseBody["user"]["id"];
      _saveCooke();
      print(responseBody["user"]["id"]);

      if (responseBody["sts"] == "01") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return "Error";
    }
  }

  static Future login(emailormobile, password) async {
    try {
      print(emailormobile);
      print(password);
      var response = await http.post(Uri.parse(Api.user.login),
          body: {"emailormobile": emailormobile, "password": password});

      var responseBody = json.decode(response.body);
      cookie = "${responseBody["user"]["id"]}";
      await _saveCooke();
      print(cookie);

      if (responseBody["sts"] == "01") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return "Error";
    }
  }

  static Future registerOtp(name, email, phone) async {
    try {
      var response = await http.post(Uri.parse(Api.user.sendregisterotp),
          body: {"email": email, "number": phone, "name": name});

      var responseBody = json.decode(response.body);
      print(responseBody);

      if (responseBody["sts"] == "01") {
        return responseBody;
      } else {
        return false;
      }
    } catch (e) {
      return "Error";
    }
  }

  static Future logout() async {
    try {
      var pref = await Preference.remove("Id");
    } catch (e) {
      return "Error";
    }
  }
}

//**************//
//Search api
class SearchApi {
  static Future<List<PincodeModel>?> pincode() async {
    try {
      var response = await http.get(Uri.parse(Api.search.pincodes));
      var responseBody = json.decode(response.body);

      List<PincodeModel> pincodeList = [];
      for (var i = 0; i < responseBody["results"].length; i++) {
        pincodeList.add(PincodeModel.fromJson(responseBody["results"][i]));
      }

      return pincodeList;

      // return
    } catch (e) {
      return null;
    }
  }

  static Future<List<PincodeModel>> pincodeList(String query) async {
    var response = await http.get(Uri.parse(Api.search.pincodes));
    final responseBody = json.decode(response.body);

    print(responseBody['results']);

    if (response.statusCode == 200) {
      return responseBody['results']
          .map((e) => PincodeModel.fromJson(e))
          .where((pincode) {
        final nameLower = pincode.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<StateModel>?> searchState() async {
    try {
      var response = await http.post(Uri.parse(Api.search.searchState));
      var responseBody = json.decode(response.body);
      print(responseBody['states']);
      List<StateModel> stateList = [];
      for (var i in responseBody['states']) {
        stateList.add(StateModel.fromJson(i));
      }
      return stateList;
    } catch (e) {
      return null;
    }
  }

  static Future<List<StateModel>?> searchDistrict() async {
    try {
      var response = await http.post(Uri.parse(Api.search.searchDistrict));
      var responseBody = json.decode(response.body);
      print(responseBody['districts']);
    } catch (e) {
      return null;
    }
  }
}

//**************//
//Restaurant api
class RestaurantApi {
  static Future<List<Nrestaurants>?> viewAll() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = await http.post(Uri.parse(Api.restaurant.viewAll), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
      });
      var responseBody = json.decode(response.body);
      List<Nrestaurants> resList1 = [];
      // print('start loop');
      for (var i in responseBody['restaurants']) {
        i['status'] = true;
        resList1.add(Nrestaurants.fromJson(i));
      }
      for (var i in responseBody['nrestaurants']) {
        i['status'] = false;
        resList1.add(Nrestaurants.fromJson(i));
      }
      return resList1;
    } catch (e) {
      print('rest ' + e.toString());
      return null;
    }
  }

  static Future<List<ProductModal>?> restaurantCategory(id) async {
    try {
      print(id);
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = await http
          .post(Uri.parse(Api.restaurant.restaurantCagegory(id)), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
        "limit": "10"
      });

      var responseBody = json.decode(response.body);

      List<ProductModal> categoriesList = [];
      for (var i in responseBody['products']) {
        categoriesList.add(ProductModal.fromJson(i));
      }

      return categoriesList;
    } catch (e) {
      return null;
    }
  }

  static Future<PostModal?> getOneRestaurant(id) async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = await http.post(
          Uri.parse(Api.restaurant.restaurantOne(id)),
          body: {"user_id": userId, "pincode": pincode});
      Map<String, dynamic> data = json.decode(response.body);
      var dt = PostModal.fromJson(data);
      return PostModal.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}

//**************//
//Supermarket api
class SupermarketApi {
  static Future<List<Nrestaurants>?> viewAll() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      print('userid  ' + userId);
      print('pincode  ' + pincode);
      var response = await http.post(Uri.parse(Api.supermarket.viewAll), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
      });
      var responseBody = json.decode(response.body);

      List<Nrestaurants> supermarketList = [];
      print('start loop');
      for (var i in responseBody['supermarkets']) {
        i['status'] = true;
        supermarketList.add(Nrestaurants.fromJson(i));
      }
      for (var i in responseBody['nsupermarkets']) {
        i['status'] = false;
        supermarketList.add(Nrestaurants.fromJson(i));
      }

      return supermarketList;
    } catch (e) {
      return null;
    }
  }
}

//**************//
//Cart api
class CartApi {
  static Future addToCart(type, productId, shopId, unitId) async {
    print(type);
    print(productId);
    print(shopId);
    final userId = await Preference.getPrefs("Id");
    var response = await http.post(Uri.parse(Api.cart.addtocart), body: {
      "type": type,
      "product_id": productId,
      "user_id": userId,
      "shop_id": shopId,
      "unit_id": unitId,
      "quantity": "1"
    });
    var responseBody = json.decode(response.body);
    print("response" + responseBody['sts']);
  }

  static Future<CartModal?> getCart() async {
    try {
      final userId = await Preference.getPrefs("Id");
      var response = await http
          .post(Uri.parse(Api.cart.getcart), body: {"user_id": userId});
      // var responseBody = json.decode(response.body);
      // print('cart api');
      // print(responseBody['cart']);

      // List<CartListModal> cartList = [];
      // for (var i in responseBody['cart']) {
      //   cartList.add(CartListModal.fromJson(i));
      // }

      Map<String, dynamic> data = json.decode(response.body);
      print(data);

      return CartModal.fromJson(data);
    } catch (e) {
      return null;
    }
  }

  static Future removeCart(cartId) async {
    try {
      var response =
          await http.post(Uri.parse(Api.cart.remove), body: {"cartid": cartId});
      var responseBody = json.decode(response.body);
      print(responseBody);
      if (responseBody['sts'] == "00") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return 'Error';
    }
  }

  static Future updateCart(cartId, quantity) async {
    print(cartId);
    print(quantity);
    var response = await http.post(Uri.parse(Api.cart.changeQuantity),
        body: {"cartid": cartId, "quantity": quantity});
    print('working0');
    var responseBody = json.decode(response.body);
    print(responseBody);
    if (responseBody['sts'] == "01") {
      return true;
    } else {
      return false;
    }
  }
}

//**************//
//Order api
class OrderApi {
  static Future<dynamic> allOrder() async {
    try {
      var userId = await Preference.getPrefs('Id');
      var response = await http
          .post(Uri.parse(Api.order.allorders), body: {"user_id": userId});
      var responseBody = json.decode(response.body);
      print(responseBody);

      List<OrderObjectModel> shopList = [];
      print('order start loop');
      for (var i in responseBody["orders"]) {
        shopList.add(OrderObjectModel.fromJson(i));
      }

      return shopList;
    } catch (e) {
      return null;
    }
  }

  static Future addOrder() async {
    try {
      var userId = await Preference.getPrefs('Id');
      var response = await http
          .post(Uri.parse(Api.cart.placeorder), body: {"user_id": userId});
      var responseBody = json.decode(response.body);
      print(responseBody);
    } catch (e) {
      return 'Error';
    }
  }
}

class AddressApi {
  static Future<List<AddressListModel>?> addressList() async {
    try {
      var userId = await Preference.getPrefs("Id");
      var response = await http
          .post(Uri.parse(Api.address.getAddress), body: {"user_id": userId});
      var responseBody = json.decode(response.body);

      // print(responseBody['address']);
      print("response : -");
      List<AddressListModel> addressList = [];
      for (var i in responseBody['address']) {
        addressList.add(AddressListModel.fromJson(i));
      }

      return addressList;
    } catch (e) {
      return null;
    }
  }

  static Future createAddress(
      String name,
      String phone,
      String mobile,
      String landmark,
      String city,
      String address,
      String district,
      String state,
      String type) async {
    try {
      var userId = await Preference.getPrefs("Id");
      var pincode = await Preference.getPrefs("pincode");
      print(name);
      print(phone);
      print(mobile);
      print(landmark);
      print(city);
      print(address);
      print(district);
      print(state);
      print(type);
      print("response : -");
      // var response =
      //     await http.post(Uri.parse(Api.address.createAddress), body: {
      //   "user_id": userId,
      //   "name": name,
      //   "phone": phone,
      //   "pincode": pincode,
      //   "mobile": mobile,
      //   "landmark": landmark,
      //   "city": city,
      //   "address": address,
      //   "district": district,
      //   "state": state,
      //   "type": type
      // });

      // var responseBody = json.decode(response.body);
      // print(responseBody);
      // print("if and else");
      // if (responseBody['sts'] == "01") {
      //   return true;
      // } else {
      //   return false;
      // }
    } catch (e) {
      return 'Error';
    }
  }
}

_saveCooke() async {
  final prefs = await SharedPreferences.getInstance();
  var result = prefs.setString('Id', cookie);
  print(result);
}
