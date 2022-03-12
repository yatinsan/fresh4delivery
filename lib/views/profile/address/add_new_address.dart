import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/widgets/form_field_widget.dart';

class AddNewAddress extends StatelessWidget {
  AddNewAddress({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _addressController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _addresstypeController = TextEditingController();

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
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: GestureDetector(
                  onTap: () {
                    print('save');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.save, color: Colors.black),
                      Text("Save", style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
              )
            ],
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.black)),
            title:
                Text("Add New Address", style: TextStyle(color: Colors.black)),
            bottom: PreferredSize(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 40, top: 5, bottom: 5, right: 30),
                  width: double.infinity,
                  color: Color.fromRGBO(201, 228, 125, 1),
                  child: Text(
                    "Add New Address",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                preferredSize: Size.fromHeight(40.h))),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                AddAddressTextfield(
                    controller: _nameController, hintText: "name"),
                SizedBox(height: 20.h),
                AddAddressTextfield(
                    controller: _mobileController, hintText: "mobile"),
                SizedBox(height: 20.h),
                AddAddressTextfield(
                    controller: _pincodeController, hintText: "pincode"),
                SizedBox(height: 20.h),
                AddAddressTextfield(
                    controller: _addressController, hintText: "address"),
                SizedBox(height: 20.h),
                AddAddressTextfield(
                    controller: _landmarkController, hintText: "landmark"),
                SizedBox(height: 20.h),
                AddAddressTextfield(
                    controller: _cityController, hintText: "city"),
                SizedBox(height: 20.h),
                AddAddressTextfield(
                    controller: _stateController, hintText: "state"),
                SizedBox(height: 20.h),
                AddAddressTextfield(
                    controller: _addresstypeController,
                    hintText: "address type"),
              ],
            ),
          ),
        ));
  }
}

class AddAddressTextfield extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  const AddAddressTextfield(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade200)),
        ),
      ),
    );
  }
}
