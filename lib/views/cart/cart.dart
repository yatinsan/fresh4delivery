import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/widgets/search_button.dart';

class Cart extends StatelessWidget {
  static const routeName = '/cart';
  const Cart({Key? key}) : super(key: key);

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
                          children: [
                            Text("Delivery to :"),
                            Icon(Icons.location_on_outlined, size: 15),
                            Text("Ollur Thrissur"),
                            Text("(673482)")
                          ],
                        ))
                  ],
                ),
                preferredSize: Size.fromHeight(80.h))),
        body: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: ((context, index) {
                  return Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      width: 300.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.shade200, width: 2.w)),
                      child: CalculateTheTotal());
                })),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Colors.grey.shade200, width: 2.w)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery charges"),
                        Text("₹150"),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Taxes and Charges"),
                        Text("₹0"),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Amount",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Text("₹150", style: TextStyle(color: Colors.green))
                      ],
                    ),
                  ],
                ))
          ],
        ));
  }
}

class CalculateTheTotal extends HookWidget {
  const CalculateTheTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentNumber = useState(1);
    return Row(
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 5.h),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "₹180",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey.shade600,
                      fontSize: 12)),
              TextSpan(
                  text: " ₹140",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    // fontSize: 12
                  ))
            ])),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey.shade300, width: 2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        var number = currentNumber.value--;
                        if (number <= 1) currentNumber.value = 1;
                        print('minus');
                      },
                      child: Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 1),
                          width: 15,
                          height: 15,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Divider(
                            thickness: 2,
                            color: Colors.white,
                          ))),
                  SizedBox(width: 10),
                  Text("${currentNumber.value}"),
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        currentNumber.value++;
                        print('add');
                      },
                      child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child:
                              Icon(Icons.add, color: Colors.white, size: 15)))
                ],
              ),
            )
          ],
        ),
        IconButton(
            onPressed: () {
              print("delete");
            },
            icon: Icon(Icons.delete_forever_outlined,
                color: Color.fromARGB(255, 180, 51, 42)))
      ],
    );
  }
}
