import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/views/category/category.dart';
import 'package:fresh4delivery/views/home/home.dart';
import 'package:fresh4delivery/views/orders/orders.dart';
import 'package:fresh4delivery/views/profile/profile.dart';
import 'package:fresh4delivery/widgets/header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    TabController _tabController;
    return Scaffold(
        bottomNavigationBar: menu(),
        body: TabBarView(children: [
          Home(),
          Category(),
          Orders(),
          Profile(),
        ]));
  }
}

Widget menu() {
  return Container(
    child: const TabBar(
      indicator: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Colors.black,
        width: 3,
      ))),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(color: Colors.black),
      indicatorSize: TabBarIndicatorSize.tab,
      // indicatorPadding: EdgeInsets.only(bottom: 5),
      indicatorColor: Colors.black,
      tabs: [
        Tab(
          text: "Home",
          icon: Icon(Icons.home_outlined),
        ),
        Tab(
          text: "Category",
          icon: Icon(Icons.category_outlined),
        ),
        Tab(
          text: "Orders",
          icon: Icon(Icons.local_grocery_store_outlined),
        ),
        Tab(
          text: "Account",
          icon: Icon(Icons.person_outline_outlined),
        ),
      ],
    ),
  );
}

class ImageCarousel extends HookWidget {
  List images = [
    "assets/images/carousal1.png",
    "assets/images/carousal1.png",
    "assets/images/carousal1.png"
  ];

  @override
  Widget build(BuildContext context) {
    final _index = useState(0);
    final _imageState = useState(0);
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) {
              return Image.asset(images[index],
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 1);
            },
            options: CarouselOptions(
                aspectRatio: 10 / 4.5,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  _index.value = index;
                  _imageState.value = index;
                })),
        SizedBox(
            height: 20,
            child: AnimatedSmoothIndicator(
                activeIndex: _index.value,
                count: images.length,
                effect: WormEffect(
                    dotWidth: 10.w,
                    dotHeight: 5.h,
                    dotColor: Colors.grey.shade300,
                    activeDotColor: Color.fromRGBO(201, 228, 125, 1),
                    strokeWidth: 1)))
      ],
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10, left: 18),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/images/carousal1.png",
                          fit: BoxFit.cover, width: 50.w, height: 50.h)),
                  SizedBox(height: 4.h),
                  Text("Grills",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
                ],
              ),
            );
          })),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text("Thaj Restuarant",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
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
                    Text("12 min",
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
    );
  }
}
