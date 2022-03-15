import 'dart:convert';

import 'package:fresh4delivery/config/constants/api_configurations.dart';
import 'package:fresh4delivery/models/address_model.dart';
import 'package:fresh4delivery/models/home_model.dart';
import 'package:fresh4delivery/models/orders_model.dart';
import 'package:fresh4delivery/models/pincode_model.dart';
import 'package:fresh4delivery/models/res_model.dart';
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
      print('starts here');
      print(responseBody);

      List<BannerModel> bannerList = [];
      for (var i in responseBody['fbanners']) {
        bannerList.add(BannerModel.fromJson(i));
      }
      print(bannerList);

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
      print('starts here');
      print(responseBody);

      List<BannerModel> bannerList = [];
      for (var i in responseBody['sbanners']) {
        bannerList.add(BannerModel.fromJson(i));
      }
      print(bannerList);

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
      print('starts here');
      print(responseBody);

      List<RestproductModel> productsList = [];
      for (var i in responseBody['restproducts']) {
        i["status"] = true;
        productsList.add(RestproductModel.fromJson(i));
      }
      for (var i in responseBody['nrestproducts']) {
        i["status"] = false;
        productsList.add(RestproductModel.fromJson(i));
      }
      print(productsList);

      return productsList;
    } catch (e) {
      return null;
    }
  }
}

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

class SearchApi {
  static Future<List<PincodeModel>?> pincode() async {
    try {
      var response = await http.get(Uri.parse(Api.search.pincodes));
      var responseBody = json.decode(response.body);
      print(responseBody["results"].length);

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
}

class RestaurantApi {
  static Future<List<Nrestaurants>?> viewAll() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = await http.post(Uri.parse(Api.restaurant.viewAll), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
        "limit": "10"
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
}

class SupermarketApi {
  static Future<List<Supermarket>?> viewAll() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      print('userid  ' + userId);
      print('pincode  ' + pincode);
      print(Api.supermarket.viewAll);
      var response = await http.post(Uri.parse(Api.supermarket.viewAll), body: {
        "user_id": userId,
        "pincode": pincode.toString().isEmpty ? "679577" : pincode,
        "limit": "10"
      });
      var responseBody = json.decode(response.body);

      List<Supermarket> supermarketList = [];
      print('start loop');
      for (var i in responseBody['supermarkets']) {
        i['status'] = true;
        supermarketList.add(Supermarket.fromJson(i));
      }
      for (var i in responseBody['nsupermarkets']) {
        i['status'] = false;
        supermarketList.add(Supermarket.fromJson(i));
      }

      return supermarketList;
    } catch (e) {
      return null;
    }
  }
}

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
      print(shopList);

      return shopList;
    } catch (e) {
      return null;
    }
  }
}

class AddressApi {
  static Future<List<AddressModel>?> addressList() async {
    try {
      var userId = await Preference.getPrefs("Id");
      var response = await http
          .post(Uri.parse(Api.address.getAddress), body: {"user_id": userId});
      var responseBody = json.decode(response.body);

      print(responseBody['address']);

      List<AddressModel> addressList = [];
      for (var i in responseBody['address']) {
        addressList.add(AddressModel.fromJson(i));
      }

      return addressList;
    } catch (e) {
      return null;
    }
  }
}

_saveCooke() async {
  final prefs = await SharedPreferences.getInstance();
  var result = prefs.setString('Id', cookie);
  print(result);
}
