import 'dart:developer';

import 'package:carpool_app/src/security/security_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../common/custom_blue_header.dart';
import '../../../common/utils/utils.dart';

class TwoAuthConfirmationScreen extends StatefulWidget {
  const TwoAuthConfirmationScreen({super.key});

  @override
  State<TwoAuthConfirmationScreen> createState() =>
      _TwoAuthConfirmationScreenState();
}

class _TwoAuthConfirmationScreenState extends State<TwoAuthConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Container(
                      width: size.width * 0.2,
                      height: size.height * 0.1,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/security_icon.png'))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Enter your code',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: size.height * 0.02),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Enter 6-digit code we sent to your\n             number *** ** **987',
                        style: TextStyle(
                            color: Colors.black, fontSize: size.height * 0.015),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: OTPTextField(
                      otpFieldStyle: OtpFieldStyle(),
                      length: 4,
                      width: size.width,
                      fieldWidth: 50,
                      style: const TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                        // ignore: prefer_interpolation_to_compose_strings
                        log("Completed: " + pin);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 30),
                    child: RichText(
                      text: TextSpan(
                          text:
                              'It may take a minute to receive your code. Haven’t receive code yet? ',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Resend Code ',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {})
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 70, horizontal: 30),
                    child: SizedBox(
                      width: size.width,
                      child: CupertinoButton(
                          color: const Color(0xff0077B6),
                          child: const Text('Confirm'),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SecurityScreen()),
                                (route) => route.isCurrent);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // sab se top wala portion

          CustomBlueHeader(
              fromleft: 45,
              size: size,
              callback: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back,
              title: 'Two-Factor Authentication')
        ]),
      ),
    );
  }
}
