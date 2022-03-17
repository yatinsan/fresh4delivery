import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/models/res_model.dart';
import 'package:fresh4delivery/models/restaurant_category_modal.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/views/home/home.dart';
import 'package:fresh4delivery/views/notification/notification.dart';
import 'package:fresh4delivery/widgets/search_button.dart';

class RestuarantsViewMore extends StatelessWidget {
  static const routeName = '/restaurantsviewmore';
  const RestuarantsViewMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments;
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Products List",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          // Image.asset("assets/icons/filter.png")
                        ],
                      ))
                ],
              ),
              preferredSize: Size.fromHeight(80.h))),
      body: FutureBuilder(
          future: RestaurantApi.viewAll(),
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Nrestaurants> data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    Nrestaurants categoryProducts = data[index];
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
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 20),
                            Image.network(
                              categoryProducts.logo.toString().isEmpty ||
                                      categoryProducts.logo == null
                                  ? "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"
                                  : "https://ebshosting.co.in${categoryProducts.logo}",
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(categoryProducts.name.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                                SizedBox(height: 5.h),
                                Text(categoryProducts.status.toString(),
                                    style: TextStyle(fontSize: 12)),
                                SizedBox(height: 5.h),
                                // StarRating(
                                //   rating: resturants.rating!.toDouble(),
                                // )
                              ],
                            ),
                          ],
                        ));
                  }));
            } else if (snapshot.data == null) {
              return const Center(child: Text(" Not Available"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })),
    );
  }
}
