import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/provider/phone_number_provider.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/views/main_screen/main_screen.dart';
import 'package:fresh4delivery/widgets/form_field_widget.dart';
import 'package:fresh4delivery/widgets/named_button.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _emailormobileController =
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
        title: Text("Login", style: TextStyle(color: Colors.white)),
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
                  SizedBox(height: 120.h),
                  Text("Hello Again!",
                      style:
                          TextStyle(fontSize: 25, color: Colors.grey.shade500)),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200.w,
                    child: Text("Welcome back you've been missed !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade500)),
                  ),
                  SizedBox(height: 47.h),
                  FormFieldWidget(
                      controller: _emailormobileController,
                      hintText: "Enter your mobile number"),
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
                  LoginButton(_emailormobileController, _passwordController)
                ],
              ),
              SizedBox(height: 160.h),
              Text(
                  "By continuing, you agree to our Terms of Services and Privacy Policy",
                  style: TextStyle(color: Colors.grey.shade600))
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends HookWidget {
  final TextEditingController emailormobile;
  final TextEditingController password;
  const LoginButton(
    this.emailormobile,
    this.password, {
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
                state.value = false;
                var response =
                    await AuthCustomer.login(emailormobile.text, password.text);
                print(response);
                if (emailormobile.text.isNotEmpty && password.text.isNotEmpty) {
                  if (response) {
                    state.value = true;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MainScreen()));
                  }
                } else {
                  state.value = true;
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill the form')));
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
