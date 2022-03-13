import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/widgets/search_button.dart';

class NearYou extends StatelessWidget {
  static const routeName = '/near-you';
  const NearYou({Key? key}) : super(key: key);

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
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back)),
                        SearchButton(width: 330)
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 40, top: 5, bottom: 5, right: 30),
                        width: double.infinity,
                        color: Color.fromRGBO(201, 228, 125, 1),
                        child: Text(
                          "Supermarket near you",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                preferredSize: Size.fromHeight(80.h))),
        body: ListView.builder(
            itemCount: 5,
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
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      Image.asset(
                        "assets/images/chicken.png",
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Fresh chicken",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          SizedBox(height: 5.h),
                          Text("30 minutes", style: TextStyle(fontSize: 12)),
                          SizedBox(height: 5.h),
                          SizedBox(
                            height: 20,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: ((context, index) {
                                  return Icon(Icons.star,
                                      color: Colors.yellow, size: 14);
                                })),
                          )
                        ],
                      ),
                    ],
                  ));
            })));
  }
}
