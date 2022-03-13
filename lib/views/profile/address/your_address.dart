import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/views/profile/address/add_new_address.dart';

class YourAddress extends StatelessWidget {
  static const routeName = '/your-address';
  const YourAddress({Key? key}) : super(key: key);

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
            // automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.black)),
            title:
                Text("Manage Address", style: TextStyle(color: Colors.black)),
            bottom: PreferredSize(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 40, top: 5, bottom: 5, right: 30),
                  width: double.infinity,
                  color: Color.fromRGBO(201, 228, 125, 1),
                  child: Text(
                    "Manage Address",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                preferredSize: Size.fromHeight(40.h))),
        body: Stack(clipBehavior: Clip.none, children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * .78,
              child: SelectableAddressWidget()),
          Positioned(
            right: 30,
            bottom: -10,
            child: GestureDetector(
              onTap: () {
                print('add');
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AddNewAddress()));
              },
              child: Container(
                  height: 45.h,
                  width: 115.w,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color.fromRGBO(166, 206, 57, 1),
                            Color.fromRGBO(72, 170, 152, 1)
                          ]),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Text("Add Address"))),
            ),
          )
        ]));
  }
}

class SelectableAddressWidget extends HookWidget {
  const SelectableAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useState(0);
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: ((context, index) {
          return Container(
              margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
              width: 300.w,
              height: 100.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200, width: 2.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Radio(
                          value: index,
                          groupValue: state.value,
                          onChanged: (val) {
                            state.value = index;
                          })),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sample Name",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(height: 5.h),
                        Text("address address", style: TextStyle(fontSize: 12)),
                        SizedBox(height: 5.h),
                        Text("phone number", style: TextStyle(fontSize: 12)),
                        SizedBox(height: 5.h),
                        Text("pincode", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          print('edit');
                        },
                        child: Container(
                            height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text("Edit",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600))),
                      )),
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
                                size: 20, color: Colors.grey.shade800)),
                      ],
                    ),
                  )
                ],
              ));
        }));
  }
}
