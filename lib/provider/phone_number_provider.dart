import 'package:flutter/cupertino.dart';

class PhoneProvider extends ChangeNotifier {
  String _number = 'Enter your mobile number';

  String get phone => _number;

  void getNumber(String number) {
    _number = number;
    notifyListeners();
  }
}
