import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/views/authentication/forgot_password.dart';
import 'package:fresh4delivery/views/authentication/login.dart';
import 'package:fresh4delivery/views/authentication/otp_verify.dart';
import 'package:fresh4delivery/views/authentication/phone.dart';
import 'package:fresh4delivery/views/authentication/signup.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: GestureDetector(
              onTap: () {
                print('go back');
              },
              child: Icon(Icons.arrow_back, color: Colors.white)),
          title: Text("login", style: TextStyle(color: Colors.white)),
        ),
        body: Phone());
  }
}
