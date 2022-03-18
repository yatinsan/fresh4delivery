import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/models/home_model.dart';
import 'package:fresh4delivery/models/res_model.dart';
import 'package:fresh4delivery/models/restaurant_category_modal.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/views/home/home.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
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
        title: Image.asset("assets/icons/logo1.png"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                height: 50,
                child: SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                      hintText: 'Enter a search term',
                    ),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  height: 80.h,
                  child: FutureBuilder(
                      future: HomeApi.categories(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<CategoryModel> data = snapshot.data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.length,
                              itemBuilder: ((context, index) {
                                CategoryModel category = data[index];
                                return CircleWidget(
                                    id: category.id.toString(),
                                    title: category.name ?? '',
                                    image:
                                        "https://ebshosting.co.in/${category.image}");
                              }));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      })),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: FutureBuilder(
                    future: RestaurantApi.viewAll(),
                    builder: ((context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<Nrestaurants> data = snapshot.data;
                        return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: ((context, index) {
                              Nrestaurants categoryProducts = data[index];
                              return Container(
                                  margin: const EdgeInsets.only(
                                    top: 15,
                                  ),
                                  width: 300.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 2.w)),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 20),
                                      Image.network(
                                        categoryProducts.logo
                                                    .toString()
                                                    .isEmpty ||
                                                categoryProducts.logo == null
                                            ? "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"
                                            : "https://ebshosting.co.in${categoryProducts.logo}",
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                                categoryProducts.name
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          SizedBox(height: 5.h),
                                          Text(
                                              categoryProducts.status
                                                  .toString(),
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
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
