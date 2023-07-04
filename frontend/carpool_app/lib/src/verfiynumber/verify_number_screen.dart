import 'package:carpool_app/data/auth/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../common/utils/utils.dart';

class VerifyNumberScreen extends StatefulWidget {
  final AuthProviderController authProvider;
  const VerifyNumberScreen({super.key, required this.authProvider});

  @override
  State<VerifyNumberScreen> createState() => _VerifyNumberScreenState();
}

class _VerifyNumberScreenState extends State<VerifyNumberScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      widget.authProvider.getRandomOtp();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        SizedBox(
          width: size.width,
          height: size.height,
        ),
        Container(
          width: size.width,
          height: size.height * 0.4,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/map 1.png'), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                //color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('assets/Quick-Logo W.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ),
        Positioned(
          top: 260,
          child: Container(
            width: size.width,
            height: size.height * 0.65,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'Verify Phone Number',
                        style: TextStyle(
                          fontSize: size.width * 0.06,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          'Please verify your number',
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 40, right: 40),
                      child: OTPTextField(
                        controller: widget.authProvider.otpController,
                        otpFieldStyle: OtpFieldStyle(),
                        length: 4,
                        width: size.width,
                        fieldWidth: 50,
                        style: const TextStyle(fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                        onCompleted: (pin) {
                          // ignore: prefer_interpolation_to_compose_strings
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 50),
                      child: RichText(
                        text: TextSpan(
                            text: ' Don\'t recieve OTP ? ',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Rsend OTP ',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 15),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      child: SizedBox(
                        width: size.width,
                        child: CupertinoButton(
                            color: const Color(0xff0077B6),
                            child: const Text('Verify OTP'),
                            onPressed: () {
                              widget.authProvider.checkOtpisVerified(context);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
