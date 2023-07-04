import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/custom_blue_header.dart';
import '../../common/utils/utils.dart';

class BackUpCodeGeneratorScreen extends StatefulWidget {
  const BackUpCodeGeneratorScreen({super.key});

  @override
  State<BackUpCodeGeneratorScreen> createState() =>
      _BackUpCodeGeneratorScreenState();
}

class _BackUpCodeGeneratorScreenState extends State<BackUpCodeGeneratorScreen> {
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
                      'Recovery Codes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Center(
                      child: Text(
                        'Save your backup codes in a safe place. Without these, you may not be able to login to your account if you lose access to your phone or can’t login using your security method.',
                        style: TextStyle(
                            fontSize: size.height * 0.015, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Center(
                      child: Text(
                        ' 5467 9835 \n\n 6723 9823 \n\n 9867 4178 \n\n 7623 1832 \n\n 5892 7213',
                        style: TextStyle(
                            fontSize: size.height * 0.017, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Center(
                      child: Text(
                        'You can use each backup code once. You can also get new codes if this set is no longer secure or if you have used most of them.',
                        style: TextStyle(
                            fontSize: size.height * 0.015, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 70),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'Save codes ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Get new codes ',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 15),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {})
                              ]),
                        ),
                      ))
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
              title: 'Backup code generator')
        ]),
      ),
    );
  }
}
