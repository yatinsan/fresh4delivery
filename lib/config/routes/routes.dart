import 'package:flutter/material.dart';
import 'package:fresh4delivery/config/constants/route_path.dart';
import 'package:fresh4delivery/views/authentication/auth_screen.dart';
import 'package:fresh4delivery/views/authentication/login.dart';
import 'package:fresh4delivery/views/authentication/otp_verify.dart';
import 'package:fresh4delivery/views/authentication/phone.dart';
import 'package:fresh4delivery/views/main_screen/main_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutePath.phoneCheck:
        {
          return _route(routeSettings, Phone());
        }
      case RoutePath.authScreen:
        {
          return _route(routeSettings, AuthScreen());
        }
      case RoutePath.otpVerify:
        {
          return _route(routeSettings, OTPVerify());
        }
      case RoutePath.login:
        {
          return _route(routeSettings, Login());
        }
      case RoutePath.mainScreen:
        {
          return _route(routeSettings, MainScreen());
        }
      default:
        {
          return _route(routeSettings, Login());
        }
    }
  }

  static Route _route(routeSettings, Widget widget) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => widget,
    );
  }
}
