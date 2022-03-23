import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/models/order_list_model.dart';
import 'package:fresh4delivery/models/orders_model.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/views/cart/cart.dart';
import 'package:fresh4delivery/views/notification/notification.dart';
import 'package:fresh4delivery/widgets/search_button.dart';

class Orders extends StatelessWidget {
  static const routeName = '/orders';
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
                  onPressed: () {
                    print('notification');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => NotificationScreen()));
                  },
                  icon: Icon(Icons.notifications_none, color: Colors.black)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Cart()));
                  },
                  icon: Icon(Icons.local_grocery_store_outlined,
                      color: Colors.black)),
            ],
            bottom: PreferredSize(
                child: Column(
                  children: [
                    SearchButton(),
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
        body: FutureBuilder(
          future: OrderApi.allOrder(),
          builder: (context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              OrderListModel data = snapshot.data;
              return ListView.builder(
                  itemCount: data.orders.length,
                  itemBuilder: ((context, index) {
                    final orders = data.orders[index];
                    return Container(
                        margin:
                            const EdgeInsets.only(top: 15, left: 20, right: 20),
                        width: 300.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.grey.shade200, width: 2.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png",
                                placeholder: (context, url) => Image.network(
                                    "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"),
                                errorWidget: (context, url, error) => Image.network(
                                    "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"),
                              ),
                              // Image.network(
                              //   "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"
                              //   // 'https://ebshosting.co.in/${orders.shop?.logo}'
                              //   ,
                              //   fit: BoxFit.contain,
                              //   width: 60,
                              //   height: 60,
                              // ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Fresh chicken",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 5.h),
                                  Text("Delivery in 30 min",
                                      style: TextStyle(fontSize: 12)),
                                  SizedBox(height: 5.h),
                                  Text("04/02/2022 | 4:30",
                                      style: TextStyle(fontSize: 12)),
                                  SizedBox(height: 5.h),
                                  Text("Processing",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red)),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text("₹140",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        print("close");
                                      },
                                      icon: Icon(Icons.cancel_rounded,
                                          size: 20,
                                          color: Colors.grey.shade800)),
                                ],
                              ),
                            )
                          ],
                        ));
                  }));
            } else {
              return
                  // Center(child: CircularProgressIndicator());
                  Center(
                      child: Text('No orders yet!!',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)));
            }
          },
        ));
  }
}
