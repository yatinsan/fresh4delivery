import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/widgets/named_button.dart';

class Phone extends StatelessWidget {
  Phone({Key? key}) : super(key: key);

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: MediaQuery.of(context).size.height * 7,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 80.h),
                Image.asset("assets/icons/logo.png",
                    height: 69.h, width: 160.w),
                SizedBox(height: 47.h),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  controller: _phoneController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade600),
                    ),
                    prefixIcon: Image.asset('assets/icons/indiaflag.png',
                        width: 40.w, height: 40.h),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade200)),
                  ),
                ),
                SizedBox(height: 20.h),
                NamedButton(
                    title: 'Login',
                    function: () {
                      print(_phoneController.text);
                    }),
                SizedBox(height: 20.h),
                GestureDetector(
                    onTap: () {
                      print('or');
                    },
                    child: Text('or', style: TextStyle(color: Colors.grey))),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    print('email');
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(width: 20.w),
                          Icon(Icons.mail, color: Colors.grey.shade600),
                          SizedBox(width: 50.w),
                          Text("Continue with email",
                              style: TextStyle(color: Colors.grey.shade600))
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(height: 180.h),
            Text(
                "By continuing, you agree to our Terms of Services and Privacy Policy",
                style: TextStyle(color: Colors.grey.shade600))
          ],
        ),
      ),
    );
  }
}
