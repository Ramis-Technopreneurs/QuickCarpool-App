import 'package:carpool_app/src/auth/twofactorauthfactor/two_factor_authentication_confirmation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/custom_blue_header.dart';
import '../../../common/utils/utils.dart';

class TwoFactorAuthScreen extends StatefulWidget {
  const TwoFactorAuthScreen({super.key});

  @override
  State<TwoFactorAuthScreen> createState() => _TwoFactorAuthScreenState();
}

class _TwoFactorAuthScreenState extends State<TwoFactorAuthScreen> {
  bool whatsApp = false;
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
                    child: Text(
                      'Choose Your Security Method',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: size.height * 0.022),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text:
                                'Choose where you want us to send you a security code when we need to confirm that it is you logging in',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Learn More',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 15),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})
                            ]),
                      ),
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Transform.scale(
                      scale: 1.1,
                      child: SwitchListTile(
                        activeColor: primaryColor,
                        title: const Text(
                          'Whatsapp',
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: const Text(
                            'We’ll send a code to your WhatsApp account.'),
                        value: whatsApp,
                        onChanged: (value) {
                          setState(() {
                            whatsApp = value;
                          });
                        },
                      ),
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Transform.scale(
                      scale: 1.1,
                      child: SwitchListTile(
                        activeColor: primaryColor,
                        title: const Text(
                          'Text Message',
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: const Text(
                            'We’ll send a code to the number you provided.'),
                        value: whatsApp,
                        onChanged: (value) {
                          setState(() {
                            whatsApp = value;
                          });
                        },
                      ),
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Transform.scale(
                      scale: 1.1,
                      child: SwitchListTile(
                        activeColor: primaryColor,
                        title: const Text(
                          'Recommended Account/Email',
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: const Text(
                            'We’ll send a code to your email account.'),
                        value: whatsApp,
                        onChanged: (value) {
                          setState(() {
                            whatsApp = value;
                          });
                        },
                      ),
                    ),
                  ),
                  //
                  SizedBox(
                    height: size.height * 0.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CupertinoButton(
                        color: primaryColor,
                        child: const Text('Next'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TwoAuthConfirmationScreen()));
                        }),
                  )
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
