import 'dart:convert';

import 'package:fresh4delivery/config/constants/api_configurations.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String cookie = '';

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
        "phone": phone,
        "password": password
      });

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

  static Future login(emailormobile, password) async {
    try {
      var response = await http.post(Uri.parse(Api.user.register),
          body: {"emailormobile": emailormobile, "password": password});

      var responseBody = json.decode(response.body);

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

_saveCooke(prefname, data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(prefname, data);
}