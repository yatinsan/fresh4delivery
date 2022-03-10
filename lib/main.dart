import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/views/authentication/auth_screen.dart';
import 'package:fresh4delivery/views/main_screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 830),
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DefaultTabController(length: 4, child: MainScreen())));
  }
}
