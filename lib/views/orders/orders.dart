import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

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
                      padding: const EdgeInsets.only(
                          left: 40, top: 5, bottom: 5, right: 30),
                      width: double.infinity,
                      color: Color.fromRGBO(201, 228, 125, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Items",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Image.asset("assets/icons/filter.png")
                        ],
                      ))
                ],
              ),
              preferredSize: Size.fromHeight(80.h))),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: ((context, index) {
            return Container(
                margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                width: 300.w,
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Colors.grey.shade200, width: 2.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/chicken.png",
                      fit: BoxFit.cover,
                    ),
                    Column(
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
                    Text("140", style: TextStyle(color: Colors.green))
                  ],
                ));
          })),
    );
  }
}
