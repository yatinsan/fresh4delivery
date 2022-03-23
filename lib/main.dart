import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/config/routes/routes.dart';
import 'package:fresh4delivery/provider/cart_charges.dart';
import 'package:fresh4delivery/provider/get_otp_details_provider.dart';
import 'package:fresh4delivery/provider/phone_number_provider.dart';
import 'package:fresh4delivery/provider/pincode_provider.dart';
import 'package:fresh4delivery/provider/pincode_search_provider.dart';
import 'package:fresh4delivery/provider/search_all_provider.dart';
import 'package:fresh4delivery/provider/total_amount_provider.dart';
import 'package:fresh4delivery/views/authentication/phone.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PhoneProvider()),
    ChangeNotifierProvider(create: (_) => GetOtpDetails()),
    ChangeNotifierProvider(create: (_) => CartExtraCharges()),
    ChangeNotifierProvider(create: (_) => pincodeProvider()),
    ChangeNotifierProvider(create: (_) => PincodeSearchProvider()),
    ChangeNotifierProvider(create: (_) => SearchAllProvider()),
    ChangeNotifierProvider(create: (_) => TotalAmount())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userId = false;
  @override
  void initState() {
    super.initState();
    loggedIn();
  }

  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 830),
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: DefaultTabController(length: 4, child: Phone()),
              initialRoute: '/authScreen',
              onGenerateRoute: Routes.generateRoute,
            ));
  }

  Future loggedIn() async {
    WidgetsFlutterBinding.ensureInitialized();
    var prefs = await SharedPreferences.getInstance();
    print(prefs.getString('Id') == null);
    // print(prefs.getString('Id'));
    userId = prefs.getString('Id') == null ? true : false;
  }
}
