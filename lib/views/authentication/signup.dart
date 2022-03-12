import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/provider/get_otp_details_provider.dart';
import 'package:fresh4delivery/provider/phone_number_provider.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/views/authentication/otp_verify.dart';
import 'package:fresh4delivery/views/main_screen/main_screen.dart';
import 'package:fresh4delivery/widgets/form_field_widget.dart';
import 'package:fresh4delivery/widgets/named_button.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _phoneController =
        TextEditingController(text: "${context.watch<PhoneProvider>().phone}");
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              print('go back');
            },
            child: Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Register", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
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
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade500)),
                  ),
                  SizedBox(height: 47.h),
                  FormFieldWidget(
                      controller: _nameController, hintText: "Enter your name"),
                  SizedBox(height: 20.h),
                  FormFieldWidget(
                      controller: _emailController,
                      hintText: "Enter your mail"),
                  SizedBox(height: 20.h),
                  FormFieldWidget(
                      controller: _phoneController,
                      hintText: "Enter your phone number"),
                  SizedBox(height: 20.h),
                  FormFieldWidget(
                      controller: _passwordController,
                      hintText: "Enter your password"),
                  SizedBox(height: 20.h),
                  FormFieldWidget(
                      controller: _confirmpassController,
                      hintText: "re-enter your password"),
                  SizedBox(height: 40.h),
                  RegisterButton(
                      _nameController,
                      _emailController,
                      _phoneController,
                      _passwordController,
                      _confirmpassController),
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
      ),
    );
  }
}

class RegisterButton extends HookWidget {
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  const RegisterButton(
    this.name,
    this.email,
    this.phone,
    this.password,
    this.confirmPassword, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useState(true);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.lightGreen, borderRadius: BorderRadius.circular(10)),
      child: state.value
          ? TextButton(
              onPressed: () async {
                state.value = false;
                if (name.text.isNotEmpty &&
                    email.text.isNotEmpty &&
                    phone.text.isNotEmpty &&
                    password.text.isNotEmpty &&
                    confirmPassword.text.isNotEmpty) {
                  // state.value = true;
                  var response = await AuthCustomer.signUp(
                      name.text, email.text, phone.text, password.text);

                  var otp = await AuthCustomer.registerOtp(
                      name.text, email.text, phone.text);
                  context
                      .read<GetOtpDetails>()
                      .getDetails(name.text, email.text, phone.text);
                  print(response);
                  print(otp);
                  if (response && otp["sts"] == "01") {
                    print(response);
                    print("done");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => OTPVerify()));
                    state.value = true;
                  }
                } else {
                  state.value = true;
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill the empty fields')));
                }
              },
              child: Text("Sign Up",
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
