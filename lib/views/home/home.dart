import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fresh4delivery/models/home_model.dart';
import 'package:fresh4delivery/models/pincode_model.dart';
import 'package:fresh4delivery/models/res_model.dart';
import 'package:fresh4delivery/models/supermarket_model.dart';
import 'package:fresh4delivery/provider/pincode_provider.dart';
import 'package:fresh4delivery/provider/pincode_search_provider.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/utils/star_rating.dart';
import 'package:fresh4delivery/views/main_screen/main_screen.dart';
import 'package:fresh4delivery/views/new_you/near_you.dart';
import 'package:fresh4delivery/views/notification/notification.dart';
import 'package:fresh4delivery/views/search/search.dart';
import 'package:fresh4delivery/views/view_post/resturant_view_post.dart';
import 'package:fresh4delivery/widgets/header.dart';
import 'package:fresh4delivery/widgets/search_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  // TypeAheadField(
                  //   suggestionsCallback: suggestionsCallback,
                  //   itemBuilder: itemBuilder,
                  //   onSuggestionSelected: onSuggestionSelected),
                  Container(
                      padding:
                          const EdgeInsets.only(left: 40, top: 5, bottom: 5),
                      width: double.infinity,
                      color: Color.fromRGBO(201, 228, 125, 1),
                      child: const BottomPincodeSheet())
                ],
              ),
              preferredSize: Size.fromHeight(80.h))),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarousel(),
            SizedBox(height: 20.h),
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
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/near-you', arguments: false);
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
                    Navigator.pushNamed(context, '/near-you', arguments: true);
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
            Headerwidget(
                title: "Top Restaurants",
                route: '/restaurantsviewmore',
                type: "Restaurants"),
            SizedBox(height: 20),
            Container(
                constraints: BoxConstraints(maxHeight: 175, minHeight: 160),
                child: FutureBuilder(
                    future: HomeApi.restaurants(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data;
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: ((context, index) {
                              Nrestaurants restaurant = data[index];
                              return Cards(
                                  route: '/restuarant-view-post',
                                  itemId: restaurant.id.toString(),
                                  title: restaurant.name.toString(),
                                  time: restaurant.deliveryTime.toString(),
                                  ratings: restaurant.rating ?? 0,
                                  image: restaurant.logo.toString().isEmpty
                                      ? "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"
                                      : "https://ebshosting.co.in/${restaurant.logo}");
                            }));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
            SizedBox(height: 20),
            Headerwidget(
                title: "Top Super Markets",
                route: '/supermarketsviewmore',
                type: "Supermarkets"),
            SizedBox(height: 20),
            Container(
                constraints: BoxConstraints(maxHeight: 175, minHeight: 160),
                child: FutureBuilder(
                    future: HomeApi.supermarket(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data;
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: ((context, index) {
                              Nrestaurants supermarket = data[index];
                              return Cards(
                                  itemId: supermarket.id.toString(),
                                  route: '/supermarket-view-post',
                                  title: supermarket.name ?? "",
                                  time: supermarket.deliveryTime ?? "",
                                  image:
                                      "https://ebshosting.co.in/${supermarket.logo}");
                            }));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
            SizedBox(height: 20),
            Headerwidget(
                title: "Top Products",
                route: '/productsviewmore',
                type: "Products"),
            SizedBox(height: 20),
            Container(
                constraints: BoxConstraints(maxHeight: 175, minHeight: 160),
                child: FutureBuilder(
                    future: HomeApi.restProducts(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data;
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: ((context, index) {
                              RestproductModel products = data[index];
                              return Cards(
                                  route: '/restuarant-view-post',
                                  title: products.name ?? "",
                                  time: products.price.toString(),
                                  image: products.image.toString().isEmpty
                                      ? "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"
                                      : "https://ebshosting.co.in/${products.image}");
                            }));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
            SizedBox(height: 20),
            ImageCarousel(
              sorf: false,
            )
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends HookWidget {
  bool sorf;
  ImageCarousel({
    Key? key,
    this.sorf = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _index = useState(0);
    final _imageState = useState(0);
    return FutureBuilder(
        future: sorf ? HomeApi.fbanner() : HomeApi.sbanner(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<BannerModel> data = snapshot.data;
            return Column(
              children: [
                CarouselSlider.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index, realIndex) {
                      BannerModel banners = data[index];
                      return CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 1,
                        imageUrl:
                            "https://ebshosting.co.in/${banners.image.toString()}",
                        errorWidget: (context, url, error) => Image.network(
                            "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"),
                      );

                      // Image.network(
                      //     "https://ebshosting.co.in/${banners.image.toString()}",
                      //     fit: BoxFit.cover,
                      //     width: MediaQuery.of(context).size.width * 1);
                    },
                    options: CarouselOptions(
                        aspectRatio: 10 / 4.5,
                        viewportFraction: 1,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          _index.value = index;
                          _imageState.value = index;
                        })),
                !sorf
                    ? SizedBox()
                    : SizedBox(
                        height: 20,
                        child: AnimatedSmoothIndicator(
                            activeIndex: _index.value,
                            count: data.length,
                            effect: WormEffect(
                                dotWidth: 10.w,
                                dotHeight: 5.h,
                                dotColor: Colors.grey.shade300,
                                activeDotColor:
                                    Color.fromRGBO(201, 228, 125, 1),
                                strokeWidth: 1)))
              ],
            );
          } else {
            return AspectRatio(
              aspectRatio: 10 / 4.5,
              child: Image.asset(
                "assets/images/splash_logo2.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            );
          }
        }));
  }
}

class CircleWidget extends StatelessWidget {
  String? id;
  String title;
  String image;
  CircleWidget(
      {Key? key,
      this.title = 'not available',
      this.id,
      this.image =
          "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('category-One');
        Navigator.pushNamed(context, '/viewall', arguments: id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 18),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                width: 50,
                height: 50,
                imageUrl: image,
                placeholder: (context, url) => Image.network(
                    "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"),
                errorWidget: (context, url, error) => Image.network(
                    "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"),
              ),
            ),
            SizedBox(height: 4.h),
            Text(title,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  String route;
  String? itemId;
  String title;
  String time;
  double ratings;
  String image;
  bool isRating;
  Cards(
      {Key? key,
      required this.route,
      this.itemId,
      this.title = "not available",
      this.time = "!!",
      this.image =
          "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png",
      this.ratings = 4.5,
      this.isRating = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route, arguments: itemId);
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
              height: 110.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => Image.network(
                    "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"),
                errorWidget: (context, url, error) => Image.network(
                    "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png"),
              ),
              // Image.network(
              //   image,
              //   fit: BoxFit.cover,
              // ),
            ),
            Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      constraints: BoxConstraints(maxHeight: 30, minHeight: 10),
                      width: 110,
                      child: Text(title,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  height: 20.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isRating
                          ? StarRating(
                              rating: ratings,
                              iconsize: 12,
                            )
                          : SizedBox(),
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
          text: " ${context.watch<pincodeProvider>().pincode}",
          style: TextStyle(color: Colors.grey.shade600),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final response = await RestaurantApi.viewAll();
              final pref = await SharedPreferences.getInstance();
              print(pref.getString('Id'));
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
                                    Text("Select pincode",
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
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (val) {
                                      context
                                          .read<PincodeSearchProvider>()
                                          .getPincode(val);
                                    },
                                  )),
                              FutureBuilder(
                                  future: context
                                      .watch<PincodeSearchProvider>()
                                      .searchResults(),
                                  builder: ((context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      List<String> data = snapshot.data;
                                      return ListView.builder(
                                          controller: scrollController,
                                          shrinkWrap: true,
                                          itemCount: data.length,
                                          itemBuilder: ((context, index) {
                                            String pincodes = data[index];
                                            return GestureDetector(
                                              onTap: () async {
                                                Navigator.pop(context);
                                                final prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                var pin = prefs.setString(
                                                    "pincode", pincodes);
                                                context
                                                    .read<pincodeProvider>()
                                                    .getPincode(pincodes);
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
                                                      Text(pincodes.toString()),
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
