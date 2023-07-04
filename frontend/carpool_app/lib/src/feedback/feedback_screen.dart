import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_blue_header.dart';
import '../../common/utils/utils.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
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
                  Text(
                    'Rate your experience with the app',
                    style: TextStyle(
                        fontSize: size.height * 0.02, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Send Feedback:',
                      style: TextStyle(
                          fontSize: size.height * 0.017, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Share your feedback about the app or what we could be doing better.',
                        style: TextStyle(
                            fontSize: size.height * 0.017, color: Colors.black),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: 'Enter feedback here'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 50),
                    child: CupertinoButton(
                        color: primaryColor,
                        child: const Text('Submit Feedback'),
                        onPressed: () {}),
                  )
                ],
              ),
            ),
          ),

          // sab se top wala portion

          CustomBlueHeader(
              fromleft: 100,
              size: size,
              callback: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back,
              title: 'FeedBack')
        ]),
      ),
    );
  }
}
