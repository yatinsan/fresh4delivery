import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/models/cart_modal.dart';
import 'package:fresh4delivery/provider/cart_charges.dart';
import 'package:fresh4delivery/provider/pincode_provider.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/widgets/named_button.dart';
import 'package:fresh4delivery/widgets/search_button.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  static const routeName = '/cart';
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<CartExtraCharges>();
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
                            Text("${context.watch<pincodeProvider>().pincode}"),
                          ],
                        ))
                  ],
                ),
                preferredSize: Size.fromHeight(80.h))),
        body: Column(
          children: [
            FutureBuilder(
                future: CartApi.getCart(),
                builder: (context, AsyncSnapshot snapshot) {
                  print(snapshot.hasData);
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    return SizedBox(
                      height: 600.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: ((context, index) {
                                  CartListModal cartList = data[index];
                                  return Container(
                                      margin: const EdgeInsets.only(
                                          top: 15, left: 20, right: 20),
                                      width: 300.w,
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 2.w)),
                                      child: CalculateTheTotal(
                                        quantity: cartList.quantity ?? 1,
                                        unitText:
                                            ' (${cartList.unitname.toString()})',
                                        cartId: cartList.id.toString(),
                                        image:
                                            "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png",
                                        title: cartList.productname.toString(),
                                        discountprice:
                                            cartList.price.toString(),
                                        price: cartList.offerprice.toString(),
                                      ));
                                })),
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 2.w)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Delivery charges"),
                                          Text(
                                              "₹${watchProvider.deliveryCharges}"),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Taxes and Charges"),
                                          Text(
                                              "₹${watchProvider.othercharges}"),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total Amount",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          Text(
                                              "₹${watchProvider.deliveryCharges + watchProvider.othercharges + watchProvider.productTotal}",
                                              style: TextStyle(
                                                  color: Colors.green))
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: NamedButton(
                                  title: "Place Order",
                                  function: () {
                                    print('order placed');
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return SizedBox(
                        height: 600.h,
                        child: Center(child: CircularProgressIndicator()));
                  }
                }),
          ],
        ));
  }
}

class CalculateTheTotal extends HookWidget {
  int quantity;
  String unitText;
  String? cartId;
  String image;
  String title;
  String discountprice;
  String price;
  CalculateTheTotal(
      {Key? key,
      this.quantity = 1,
      this.cartId,
      this.unitText = '',
      this.image =
          "https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png",
      this.title = "productName",
      this.discountprice = "discountPrice",
      this.price = "realPrice"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readProvider = context.read<CartExtraCharges>();
    final currentNumber = useState(quantity);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          image,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [TextSpan(text: title), TextSpan(text: unitText)],
            )),
            SizedBox(height: 5.h),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "₹${discountprice}",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey.shade600,
                      fontSize: 12)),
              TextSpan(
                  text:
                      " ₹${double.parse(price) * (quantity == 0 ? 1 : quantity)}",
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
                      onTap: () async {
                        currentNumber.value =
                            currentNumber == 0 ? 1 : currentNumber.value - 1;
                        if (currentNumber.value <= 0) currentNumber.value = 1;

                        var response = await CartApi.updateCart(
                            cartId.toString(), currentNumber.value.toString());
                        print(response);
                        // if (response == true) {
                        //   Navigator.pop(context);
                        //   Navigator.pushNamed(context, '/cart');
                        //   print('minus' + response);
                        // }
                        // print('minus');
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
                      onTap: () async {
                        currentNumber.value =
                            currentNumber == 0 ? 1 : currentNumber.value + 1;
                        if (currentNumber.value >= 10) currentNumber.value = 10;
                        var response = await CartApi.updateCart(
                            cartId.toString(), currentNumber.value.toString());
                        print(response);
                        // if (response == true) {
                        //   Navigator.pop(context);
                        //   Navigator.pushNamed(context, '/cart');
                        //   print('add' + response);
                        // }
                        // print('add');
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
            onPressed: () async {
              var response = await CartApi.removeCart(cartId);
              if (response == true) {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart');
              }
              print(response);
              print("delete");
            },
            icon: Icon(Icons.delete_forever_outlined,
                color: Color.fromARGB(255, 180, 51, 42)))
      ],
    );
  }
}
