import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/config/constants/api_configurations.dart';
import 'package:fresh4delivery/models/pincode_model.dart';
import 'package:fresh4delivery/models/restaurant_models.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/views/cart/cart.dart';
import 'package:fresh4delivery/views/main_screen/main_screen.dart';
import 'package:fresh4delivery/views/new_you/near_you.dart';
import 'package:fresh4delivery/views/notification/notification.dart';
import 'package:fresh4delivery/views/search/search.dart';
import 'package:fresh4delivery/views/view_post/view_post.dart';
import 'package:fresh4delivery/widgets/header.dart';
import 'package:fresh4delivery/widgets/search_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      show(context);
    });
  }

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
                onPressed: () {
                  print('notification');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => NotificationScreen()));
                },
                icon: Icon(Icons.notifications_none, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                icon: Icon(Icons.local_grocery_store_outlined,
                    color: Colors.black)),
          ],
          bottom: PreferredSize(
              child: Column(
                children: [
                  SearchButton(),
                  Container(
                      padding:
                          const EdgeInsets.only(left: 40, top: 5, bottom: 5),
                      width: double.infinity,
                      color: Color.fromRGBO(201, 228, 125, 1),
                      child: BottomPincodeSheet())
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => NearYou()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 2, color: Color.fromRGBO(166, 206, 57, 1)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color.fromRGBO(166, 206, 57, 1),
                              Color.fromRGBO(72, 170, 152, 1)
                            ])),
                    clipBehavior: Clip.hardEdge,
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/images/carousal1.png",
                                width: 180.w,
                                height: 100.h,
                                fit: BoxFit.cover)),
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
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => NearYou()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Color.fromRGBO(166, 206, 57, 1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/carousal1.png",
                              width: 180.w, height: 100.h, fit: BoxFit.fill),
                        ),
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
                ),
              ],
            ),
            SizedBox(height: 20),
            Headerwidget(),
            SizedBox(height: 20),
            SizedBox(
                height: 160,
                child: FutureBuilder(
                    future: RestaurantApi.viewAll(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List data = snapshot.data;
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: ((context, index) {
                              RestaurantModel restaurant = data[index];
                              return Cards();
                            }));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
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

class Cards extends StatelessWidget {
  final String title;
  final String time;
  const Cards({Key? key, this.title = "not available", this.time = "!!"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ViewPost()));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5, left: 5),
        padding: const EdgeInsets.only(left: 2, right: 2, top: 4),
        width: 120.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 110,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/images/carousal1.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 10),
                Text(title,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                Container(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: ((context, index) {
                            return Icon(Icons.star,
                                size: 10, color: Colors.yellow);
                          })),
                      Text(time,
                          style: TextStyle(
                              fontSize: 8,
                              color: Color.fromRGBO(100, 120, 47, 1)))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BottomPincodeSheet extends StatelessWidget {
  const BottomPincodeSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Delivery to :", style: TextStyle(color: Colors.grey.shade600)),
      TextSpan(
          text: " location",
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final response = await RestaurantApi.viewAll();
              print(response);
              print('location select manually');
              showModalBottomSheet(
                  isDismissible: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: .5,
                      minChildSize: 0.5,
                      maxChildSize: 0.5,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Selected pincode",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                              Container(
                                height: 65,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20),
                                child: CupertinoSearchTextField(),
                              ),
                              FutureBuilder(
                                  future: SearchApi.pincode(),
                                  builder: ((context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      List<PincodeModel> data = snapshot.data;
                                      return ListView.builder(
                                          controller: scrollController,
                                          shrinkWrap: true,
                                          itemCount: data.length,
                                          itemBuilder: ((context, index) {
                                            PincodeModel pincodes = data[index];
                                            return GestureDetector(
                                              onTap: () async {
                                                Navigator.pop(context);
                                                final prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                var pin = prefs.setString(
                                                    "pincode", pincodes.text);
                                                print(await prefs
                                                    .getString("pincode"));
                                                print('pincode received');
                                              },
                                              child: Container(
                                                  height: 50,
                                                  margin: const EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                      top: 5),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors
                                                              .grey.shade300)),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons
                                                          .location_on_outlined),
                                                      SizedBox(width: 20),
                                                      Text(pincodes.text
                                                          .toString()),
                                                    ],
                                                  )),
                                            );
                                          }));
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }))
                            ],
                          ),
                        );
                      }));
            })
    ]));
  }
}

void show(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();
  pref.getString("pincode").toString().isEmpty
      ? showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          context: context,
          builder: (context) => DraggableScrollableSheet(
              expand: false,
              initialChildSize: .5,
              minChildSize: 0.5,
              maxChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Selected pincode",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Container(
                        height: 65,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: CupertinoSearchTextField(),
                      ),
                      FutureBuilder(
                          future: SearchApi.pincode(),
                          builder: ((context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              List<PincodeModel> data = snapshot.data;
                              return ListView.builder(
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: ((context, index) {
                                    PincodeModel pincodes = data[index];
                                    return GestureDetector(
                                      onTap: () async {
                                        Navigator.pop(context);
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        var pin = prefs.setString(
                                            "pincode", pincodes.text);
                                        print(await prefs.getString("pincode"));
                                        print('pincode received');
                                      },
                                      child: Container(
                                          height: 50,
                                          margin: const EdgeInsets.only(
                                              left: 20, right: 20, top: 5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.grey.shade300)),
                                          child: Row(
                                            children: [
                                              Icon(Icons.location_on_outlined),
                                              SizedBox(width: 20),
                                              Text(pincodes.text.toString()),
                                            ],
                                          )),
                                    );
                                  }));
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }))
                    ],
                  ),
                );
              }))
      : null;
}
