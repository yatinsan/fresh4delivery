import 'dart:convert';

import 'package:fresh4delivery/config/constants/api_configurations.dart';
import 'package:fresh4delivery/models/pincode_model.dart';
import 'package:fresh4delivery/models/res_model.dart';
import 'package:fresh4delivery/models/restaurant_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String cookie = '';

class Preference {
  static getPrefs(String data) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(data);
  }
}

class Home {
  static Future home() async {
    try {
      final pincode = await Preference.getPrefs("pincode");
      final userId = await Preference.getPrefs("Id");
      var response = http.post(Uri.parse(Api.user.home));
    } catch (e) {
      return "Error";
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
      print('userid  ' + userId);
      print('pincode  ' + pincode);
      var response = await http.post(Uri.parse(Api.restaurant.viewAll),
          body: {"user_id": userId, "pincode": pincode, "limit": "10"});
      print(response.body);
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Nrestaurants> resList1 = [];
      print('start loop');
      for (var i in responseBody['restaurants']) {
        i['status'] = true;
        resList1.add(Nrestaurants.fromJson(i));
        print(i);
      }
      for (var i in responseBody['nrestaurants']) {
        i['status'] = false;
        resList1.add(Nrestaurants.fromJson(i));
        print(i);
      }
      print(resList1);
      return resList1;
    } catch (e) {
      print('rest ' + e.toString());
      return null;
    }
  }
}

_saveCooke() async {
  final prefs = await SharedPreferences.getInstance();
  var result = prefs.setString('Id', cookie);
  print(result);
}
