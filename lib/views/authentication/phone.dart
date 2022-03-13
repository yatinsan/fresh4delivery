import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/provider/phone_number_provider.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/utils/url_launcher.dart';
import 'package:fresh4delivery/views/authentication/login.dart';
import 'package:fresh4delivery/views/authentication/signup.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Phone extends StatelessWidget {
  static const routeName = '/phone';
  Phone({Key? key}) : super(key: key);

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          // height: MediaQuery.of(context).size.height * 7,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 180.h),
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
                            borderSide:
                                BorderSide(color: Colors.grey.shade200)),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    PhoneButton(_phoneController),
                    SizedBox(height: 20.h),
                    GestureDetector(
                        onTap: () {
                          print('or');
                        },
                        child:
                            Text('or', style: TextStyle(color: Colors.grey))),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Login()));
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
                SizedBox(
                  width: 235.w,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "By continuing, you agree to our ",
                            style: TextStyle(color: Colors.grey.shade600)),
                        TextSpan(
                            text: "Terms of Services and Privacy Policy",
                            style: TextStyle(
                                color: Color.fromARGB(255, 135, 167, 48)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                print("redirect to url");
                                const url = 'https://twitter.com';
                                UrlLauncher.launhcUrl(url);
                              })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneButton extends HookWidget {
  final TextEditingController phoneNumber;
  const PhoneButton(
    this.phoneNumber, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useState(true);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.lightGreen, borderRadius: BorderRadius.circular(10)),
      child: state.value
          ? TextButton(
              onPressed: () async {
                print(phoneNumber.text);
                state.value = false;
                var response = await AuthCustomer.phoneCheck(phoneNumber.text);
                print(response && phoneNumber.text.length == 10);
                if (response && phoneNumber.text.length == 10) {
                  state.value = true;
                  context.read<PhoneProvider>().getNumber(phoneNumber.text);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                } else if (phoneNumber.text.isEmpty) {
                  state.value = true;
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Enter your mobile number')));
                } else if (phoneNumber.text.length <= 9 ||
                    phoneNumber.text.length > 10) {
                  state.value = true;
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Please enter valid phone number')));
                } else {
                  context.read<PhoneProvider>().getNumber(phoneNumber.text);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignUp()));
                  state.value = true;
                }
              },
              child: Text("Continue",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .5)))
          : FittedBox(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
    );
  }
}
