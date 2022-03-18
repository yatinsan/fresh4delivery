import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pincodeProvider extends ChangeNotifier {
  String _pincode = 'location';

  String get pincode => _pincode;

  void getPincode(pincode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _pincode =
        pincode.toString().isEmpty ? await prefs.getString('pincode') : pincode;
    notifyListeners();
  }
}
