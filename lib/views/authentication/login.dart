import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/widgets/form_field_widget.dart';
import 'package:fresh4delivery/widgets/named_button.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                SizedBox(height: 120.h),
                Text("Hello Again!",
                    style:
                        TextStyle(fontSize: 25, color: Colors.grey.shade500)),
                SizedBox(height: 10),
                SizedBox(
                  width: 200.w,
                  child: Text("Welcome back you've been missed !",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade500)),
                ),
                SizedBox(height: 47.h),
                FormFieldWidget(
                    controller: _emailController,
                    hintText: "Enter your email or phone number"),
                SizedBox(height: 20.h),
                FormFieldWidget(
                    obscureText: true,
                    controller: _passwordController,
                    hintText: "Enter your password"),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Reset Password",
                        style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
                SizedBox(height: 40.h),
                NamedButton(
                    title: 'Login',
                    function: () {
                      print(_emailController.text);
                      print(_passwordController.text);
                    }),
              ],
            ),
            SizedBox(height: 160.h),
            Text(
                "By continuing, you agree to our Terms of Services and Privacy Policy",
                style: TextStyle(color: Colors.grey.shade600))
          ],
        ),
      ),
    );
  }
}
