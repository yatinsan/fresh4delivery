import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/views/search/search.dart';
import 'package:fresh4delivery/widgets/form_field_widget.dart';

class AddNewAddress extends StatefulWidget {
  static const routeName = '/add-new-address';
  AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _stateController = TextEditingController();
  final _addresstypeController = TextEditingController();
  static const _dropDownitems1 = <String>[
    "Kerala",
    "Karnataka",
    "Gujarat",
    "Punjab"
  ];

  static const _dropDownitems2 = <String>["Home", "Work"];

  final List<DropdownMenuItem<String>> _dropDownButtonItems1 = _dropDownitems1
      .map((String value) =>
          DropdownMenuItem<String>(child: Text(value), value: value))
      .toList();

  final List<DropdownMenuItem<String>> _dropDownButtonItems2 = _dropDownitems2
      .map((String value) =>
          DropdownMenuItem<String>(child: Text(value), value: value))
      .toList();

  String? _btnSelectVal1;
  String? _btnSelectVal2;

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
                  onTap: () async {
                    var response = await AddressApi.createAddress(
                        _nameController.text,
                        _phoneController.text,
                        _mobileController.text,
                        _landmarkController.text,
                        _cityController.text,
                        _addressController.text,
                        _districtController.text,
                        _stateController.text,
                        _addresstypeController.text);
                    print(response);
                    print('save');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.save, color: Colors.grey.shade800, size: 20),
                      SizedBox(width: 10),
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
                    controller: _phoneController, hintText: "phone"),
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
                Container(
                    height: 45,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade200)),
                    child: caatogoryseacrh("District")),
                SizedBox(height: 20.h),
                Container(
                    height: 45,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade200)),
                    child: caatogoryseacrh("State")),
                SizedBox(height: 20.h),
                Container(
                  height: 45,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(width: 1, color: Colors.grey.shade200)),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          hint: Text('Choose type'),
                          isExpanded: true,
                          value: _btnSelectVal2,
                          onChanged: (String? newValue) {
                            setState(() {
                              _btnSelectVal2 = newValue;
                              _addresstypeController.text = newValue as String;
                            });
                          },
                          items: _dropDownButtonItems2)),
                ),
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
        style: TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
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
