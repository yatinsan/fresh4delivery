import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/views/category/category.dart';
import 'package:fresh4delivery/views/home/home.dart';
import 'package:fresh4delivery/views/orders/orders.dart';
import 'package:fresh4delivery/views/profile/profile.dart';
import 'package:fresh4delivery/views/view_post/view_post.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';
  MainScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          bottomNavigationBar: menu(),
          body: const TabBarView(children: [
            Home(),
            Category(),
            Orders(),
            Profile(),
          ])),
    );
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
      labelStyle: TextStyle(color: Colors.black, fontSize: 12),
      indicatorSize: TabBarIndicatorSize.tab,
      // indicatorPadding: EdgeInsets.only(bottom: 5),
      indicatorColor: Colors.black,
      tabs: [
        Tab(
          text: "Home",
          icon: Icon(
            Icons.home_outlined,
            size: 22,
          ),
        ),
        Tab(
          text: "Category",
          icon: Icon(
            Icons.category_outlined,
            size: 22,
          ),
        ),
        Tab(
          text: "Orders",
          icon: Icon(
            Icons.local_grocery_store_outlined,
            size: 22,
          ),
        ),
        Tab(
          text: "Account",
          icon: Icon(
            Icons.person_outline_outlined,
            size: 22,
          ),
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
