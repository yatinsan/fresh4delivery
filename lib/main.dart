import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/config/routes/routes.dart';
import 'package:fresh4delivery/provider/cart_charges.dart';
import 'package:fresh4delivery/provider/get_otp_details_provider.dart';
import 'package:fresh4delivery/provider/phone_number_provider.dart';
import 'package:fresh4delivery/provider/pincode_provider.dart';
import 'package:fresh4delivery/provider/pincode_search_provider.dart';
import 'package:fresh4delivery/provider/search_all_provider.dart';
import 'package:fresh4delivery/views/authentication/phone.dart';
import 'package:provider/provider.dart';

import 'views/main_screen/main_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PhoneProvider()),
    ChangeNotifierProvider(create: (_) => GetOtpDetails()),
    ChangeNotifierProvider(create: (_) => CartExtraCharges()),
    ChangeNotifierProvider(create: (_) => pincodeProvider()),
    ChangeNotifierProvider(create: (_) => PincodeSearchProvider()),
    ChangeNotifierProvider(create: (_) => SearchAllProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 830),
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: DefaultTabController(length: 4, child: Phone()),
              initialRoute: '/login',
              onGenerateRoute: Routes.generateRoute,
            ));
  }
}
