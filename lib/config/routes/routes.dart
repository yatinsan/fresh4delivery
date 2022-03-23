import 'package:flutter/material.dart';
import 'package:fresh4delivery/config/constants/route_path.dart';
import 'package:fresh4delivery/views/authentication/auth_screen.dart';
import 'package:fresh4delivery/views/authentication/login.dart';
import 'package:fresh4delivery/views/authentication/otp_verify.dart';
import 'package:fresh4delivery/views/authentication/phone.dart';
import 'package:fresh4delivery/views/cart/cart.dart';
import 'package:fresh4delivery/views/main_screen/main_screen.dart';
import 'package:fresh4delivery/views/new_you/near_you.dart';
import 'package:fresh4delivery/views/notification/notification.dart';
import 'package:fresh4delivery/views/profile/address/add_new_address.dart';
import 'package:fresh4delivery/views/profile/address/your_address.dart';
import 'package:fresh4delivery/views/search/search_view.dart';
import 'package:fresh4delivery/views/view_all/view_all.dart';
import 'package:fresh4delivery/views/view_more/products_view_more.dart';
import 'package:fresh4delivery/views/view_more/restaurants_view_more.dart';
import 'package:fresh4delivery/views/view_more/supermarkets_view_more.dart';
import 'package:fresh4delivery/views/view_post/resturant_view_post.dart';
import 'package:fresh4delivery/views/view_post/supermarket_view_post.dart';

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
      case RoutePath.nearYou:
        {
          return _route(routeSettings, NearYou());
        }
      case RoutePath.login:
        {
          return _route(routeSettings, Login());
        }
      case RoutePath.mainScreen:
        {
          return _route(routeSettings, MainScreen());
        }
      case RoutePath.viewall:
        {
          return _route(routeSettings, ViewAll());
        }
      case RoutePath.cart:
        {
          return _route(routeSettings, Cart());
        }
      case RoutePath.notification:
        {
          return _route(routeSettings, NotificationScreen());
        }
      case RoutePath.restuarantViewPost:
        {
          return _route(routeSettings, RestuarantViewPost());
        }
      case RoutePath.supermarketViewPost:
        {
          return _route(routeSettings, SupermarketViewPost());
        }
      case RoutePath.productsViewMore:
        {
          return _route(routeSettings, ProductsViewMore());
        }
      case RoutePath.restaurantsViewMore:
        {
          return _route(routeSettings, RestuarantsViewMore());
        }
      case RoutePath.supermarketsViewMore:
        {
          return _route(routeSettings, SupermarketsViewMore());
        }
      case RoutePath.searchView:
        {
          return _route(routeSettings, SearchView());
        }
      case RoutePath.yourAddress:
        {
          return _route(routeSettings, YourAddress());
        }
      case RoutePath.addNewAddress:
        {
          return _route(routeSettings, AddNewAddress());
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
