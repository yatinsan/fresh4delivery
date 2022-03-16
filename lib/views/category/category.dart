import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/models/home_model.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/views/cart/cart.dart';
import 'package:fresh4delivery/views/notification/notification.dart';
import 'package:fresh4delivery/widgets/search_button.dart';

class Category extends StatelessWidget {
  static const routeName = '/category';
  const Category({Key? key}) : super(key: key);

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
                      child: Text("all category"))
                ],
              ),
              preferredSize: Size.fromHeight(80.h))),
      body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FutureBuilder(
              future: HomeApi.categories(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<CategoryModel> data = snapshot.data;
                  return GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0),
                      itemBuilder: (context, index) {
                        CategoryModel categories = data[index];
                        return Circlewidget(
                            title: categories.name ?? '',
                            image:
                                'https://ebshosting.co.in/${categories.image}');
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}

class Circlewidget extends StatelessWidget {
  String image;
  String title;
  Circlewidget(
      {Key? key,
      this.image =
          "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png",
      this.title = 'not availabel'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(image,
                fit: BoxFit.cover, width: 70.w, height: 70.h)),
        SizedBox(height: 4.h),
        Text(title, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500))
      ],
    );
  }
}
