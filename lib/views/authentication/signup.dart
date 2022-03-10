import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/widgets/form_field_widget.dart';
import 'package:fresh4delivery/widgets/named_button.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

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
                SizedBox(height: 40.h),
                Text("Hello!",
                    style:
                        TextStyle(fontSize: 25, color: Colors.grey.shade500)),
                SizedBox(height: 10),
                SizedBox(
                  width: 200.w,
                  child: Text(
                      "Enter your informations below to join out family!",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade500)),
                ),
                SizedBox(height: 47.h),
                FormFieldWidget(
                    controller: _emailController, hintText: "Enter your ename"),
                SizedBox(height: 20.h),
                FormFieldWidget(
                    controller: _passwordController,
                    hintText: "Enter your mail"),
                SizedBox(height: 20.h),
                FormFieldWidget(
                    controller: _passwordController,
                    hintText: "Enter your phone number"),
                SizedBox(height: 20.h),
                FormFieldWidget(
                    controller: _passwordController,
                    hintText: "Enter your password"),
                SizedBox(height: 20.h),
                FormFieldWidget(
                    controller: _passwordController,
                    hintText: "re-enter your password"),
                SizedBox(height: 40.h),
                NamedButton(
                    title: 'Login',
                    function: () {
                      print(_emailController.text);
                      print(_passwordController.text);
                    }),
                SizedBox(height: 20.h),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Already have an account.?",
                      style: TextStyle(color: Colors.grey.shade600)),
                  TextSpan(
                      text: "Login",
                      style:
                          TextStyle(color: Color.fromARGB(150, 139, 195, 74)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('redirect to login page');
                        })
                ]))
              ],
            ),
            SizedBox(height: 40.h),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "By continuing, your agree to our",
                  style: TextStyle(color: Colors.grey.shade600)),
              TextSpan(
                  text: " Terms of Services and Privacy Policy",
                  style: TextStyle(color: Color.fromARGB(150, 139, 195, 74)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('url redirect');
                    })
            ]))
          ],
        ),
      ),
    );
  }
}
