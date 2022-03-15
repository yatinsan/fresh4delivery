import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/views/home/home.dart';
import 'package:fresh4delivery/widgets/search_button.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

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
                        child: BottomPincodeSheet())
                  ],
                ),
                preferredSize: Size.fromHeight(80.h))),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 10 / 4.5,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/images/carousal1.png"),
                              fit: BoxFit.cover)),
                    ),
                  )),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: ((context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 18),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset("assets/images/carousal1.png",
                                fit: BoxFit.cover, width: 50.w, height: 50.h)),
                      ),
                    );
                  }),
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Cards(
                        title: "yes",
                        time: "",
                        ratings: 5,
                      ),
                    );
                  })),
            ],
          ),
        ));
  }
}
