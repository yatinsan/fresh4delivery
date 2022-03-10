import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/widgets/form_field_widget.dart';
import 'package:fresh4delivery/widgets/named_button.dart';

class OTPVerify extends StatelessWidget {
  OTPVerify({Key? key}) : super(key: key);

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    text: "Enter confirmation code we sent to +91 *******96.",
                    style: TextStyle(color: Colors.grey.shade600)),
                TextSpan(
                    text: " Request new one",
                    style: TextStyle(color: Color.fromARGB(150, 139, 195, 74)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
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
    );
  }
}
