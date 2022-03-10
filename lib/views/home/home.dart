import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/views/main_screen/main_screen.dart';
import 'package:fresh4delivery/widgets/header.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                Color.fromRGBO(166, 206, 57, 1),
                Color.fromRGBO(72, 170, 152, 1)
              ]))),
          automaticallyImplyLeading: false,
          title: Image.asset("assets/icons/logo1.png"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none, color: Colors.black)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.local_grocery_store_outlined,
                    color: Colors.black)),
          ],
          bottom: PreferredSize(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CupertinoSearchTextField(),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(left: 40, top: 5, bottom: 5),
                      width: double.infinity,
                      color: Color.fromRGBO(201, 228, 125, 1),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Delivery to :",
                            style: TextStyle(color: Colors.grey.shade600)),
                        TextSpan(
                            text: " location",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('location select manually');
                              })
                      ])))
                ],
              ),
              preferredSize: Size.fromHeight(80.h))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageCarousel(),
            SizedBox(height: 20.h),
            CircleWidget(),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      ClipRRect(
                          // borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/carousal1.png",
                              width: 180.w, height: 100.h, fit: BoxFit.cover)),
                      Positioned(
                        left: -10,
                        bottom: -10,
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 5, left: 15, right: 5, bottom: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      Color.fromRGBO(166, 206, 57, 1),
                                      Color.fromRGBO(72, 170, 152, 1)
                                    ])),
                            child: Text("SuperMarkets",
                                style: TextStyle(
                                    fontSize: 10, letterSpacing: .5))),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      ClipRRect(
                          // borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/carousal1.png",
                              width: 180.w, height: 100.h, fit: BoxFit.cover)),
                      Positioned(
                        right: -10,
                        bottom: -10,
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 5, left: 5, right: 15, bottom: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      Color.fromRGBO(166, 206, 57, 1),
                                      Color.fromRGBO(72, 170, 152, 1)
                                    ])),
                            child: Text("Restaurants",
                                style: TextStyle(
                                    fontSize: 10, letterSpacing: .5))),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Headerwidget(),
            SizedBox(height: 20),
            SizedBox(
              height: 160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Cards();
                  })),
            ),
            SizedBox(height: 20),
            Headerwidget(),
            SizedBox(height: 20),
            SizedBox(
              height: 160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Cards();
                  })),
            ),
            AspectRatio(
                aspectRatio: 3 / 1.5,
                child: Image.asset("assets/images/end_image.png",
                    fit: BoxFit.cover))
          ],
        ),
      ),
    );
  }
}
