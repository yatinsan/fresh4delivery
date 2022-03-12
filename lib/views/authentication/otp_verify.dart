import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/provider/get_otp_details_provider.dart';
import 'package:fresh4delivery/provider/phone_number_provider.dart';
import 'package:fresh4delivery/repository/customer_repo.dart';
import 'package:fresh4delivery/widgets/form_field_widget.dart';
import 'package:fresh4delivery/widgets/named_button.dart';
import 'package:provider/provider.dart';

class OTPVerify extends StatelessWidget {
  OTPVerify({Key? key}) : super(key: key);

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GetOtpDetails>();
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
        title: Text("Verify Otp", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height * 7,
        // alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 170.h),
              Text("Verify",
                  style: TextStyle(fontSize: 25, color: Colors.grey.shade500)),
              SizedBox(height: 20.h),
              Container(
                width: 240.w,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          "Enter confirmation code we sent to +91 ********${context.watch<PhoneProvider>().phone.substring(context.watch<PhoneProvider>().phone.length - 2)}.",
                      style: TextStyle(color: Colors.grey.shade600)),
                  TextSpan(
                      text: " Request new one",
                      style:
                          TextStyle(color: Color.fromARGB(150, 139, 195, 74)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var otp = await AuthCustomer.registerOtp(
                              provider.name, provider.email, provider.phone);

                          print(otp);
                          print('url redirect');
                        })
                ])),
              ),
              SizedBox(height: 47.h),
              FormFieldWidget(controller: _phoneController, hintText: "otp"),
              SizedBox(height: 20.h),
              NamedButton(
                  title: 'Verify',
                  function: () {
                    print(_phoneController.text);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
