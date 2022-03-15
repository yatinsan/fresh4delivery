import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/views/cart/cart.dart';

class ViewPost extends StatefulWidget {
  static const routeName = '/view-post';
  List<String> categories = ["a", "b"];

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Cart()));
            },
            child: Container(
              width: 30.w,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/cart.png",
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(171, 255, 255, 255),
              ),
            ),
          )
        ],
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(171, 255, 255, 255),
              ),
              child: Icon(Icons.keyboard_arrow_left_rounded,
                  color: Colors.black, size: 28)),
        ),
      ),
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 300.h,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("assets/images/carousal1.png"),
              //         fit: BoxFit.cover)),
              child: Image.asset(
                "assets/images/carousal1.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                        Color.fromARGB(218, 166, 206, 57),
                        Color.fromARGB(195, 72, 170, 152)
                      ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Text(
                          "Meat & fish",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: ((context, index) {
                                return Icon(Icons.star,
                                    color: Colors.yellow, size: 14);
                              })),
                        )
                      ]),
                      Text("30 minutes",
                          style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  )),
            )
          ]),
          Builder(builder: (context) {
            return DefaultTabController(
                length: 10,
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: Colors.grey.shade400, width: 0)),
                      child: TabBar(
                          indicator: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey.shade400)),
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: "hello"),
                            Tab(text: "hello"),
                            Tab(text: "hello"),
                            Tab(text: "hello"),
                            Tab(text: "hello"),
                            Tab(text: "hello"),
                            Tab(text: "hello"),
                            Tab(text: "hello"),
                            Tab(text: "hello"),
                            Tab(text: "hello"),
                          ]),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: 450.h,
                        child: const TabBarView(children: [
                          ViewPostsWidget(),
                          ViewPostsWidget(),
                          ViewPostsWidget(),
                          ViewPostsWidget(),
                          ViewPostsWidget(),
                          ViewPostsWidget(),
                          ViewPostsWidget(),
                          ViewPostsWidget(),
                          ViewPostsWidget(),
                          ViewPostsWidget(),
                        ]),
                      ),
                    )
                  ],
                ));
          })
        ],
      ),
    );
  }
}

class ViewPostsWidget extends StatelessWidget {
  const ViewPostsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Container(
              margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
              width: 300.w,
              height: 100.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200, width: 2.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/chicken.png",
                          fit: BoxFit.contain,
                          width: 60,
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fresh chicken",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(height: 5.h),
                        Text("Delivery in 30 min",
                            style: TextStyle(fontSize: 12)),
                        SizedBox(height: 5.h),
                        Text("04/02/2022 | 4:30",
                            style: TextStyle(fontSize: 12)),
                        SizedBox(height: 5.h),
                        Text("Processing",
                            style: TextStyle(fontSize: 12, color: Colors.red)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 30.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      Color.fromRGBO(166, 206, 57, 1),
                                      Color.fromRGBO(72, 170, 152, 1)
                                    ]),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: Text("Add Address",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500)))),
                      ],
                    ),
                  ),
                ],
              ));
        }));
  }
}
