import 'dart:developer';

import 'package:carpool_app/common/custom_blue_header.dart';
import 'package:carpool_app/data/auth/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils/utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  AuthProviderController authProviderController = AuthProviderController();
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
                  const Center(
                      child: Text(
                          'Your password must be at least 6 characters and should\n\t\t\t include combination of numbers, letters and special\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tcharacters. ')),

                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Enter your current password',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.032),
                    ),
                  ),
                  //

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      controller: authProviderController.currentPassword,
                      style: const TextStyle(height: 0.5),
                      decoration: InputDecoration(
                        hintText: "Current Password",
                        focusColor: primaryColor,
                        suffixIcon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                  //
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Enter your new password',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.032),
                    ),
                  ),
                  //

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      controller: authProviderController.newPasswordController,
                      style: const TextStyle(height: 0.5),
                      decoration: InputDecoration(
                        hintText: "New Password",
                        focusColor: primaryColor,
                        suffixIcon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                  //
                  //
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Confirm your password',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.032),
                    ),
                  ),
                  //

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      controller:
                          authProviderController.confirmNewPasswordController,
                      style: const TextStyle(height: 0.5),
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        focusColor: primaryColor,
                        suffixIcon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                  //
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 25, horizontal: 10),
                  //   child: RichText(
                  //     text: TextSpan(
                  //         text: 'if you forgot your password you can     ',
                  //         style: const TextStyle(
                  //             color: Colors.black, fontSize: 12),
                  //         children: <TextSpan>[
                  //           TextSpan(
                  //               text: ' Recover Password',
                  //               style: TextStyle(
                  //                   color: primaryColor, fontSize: 13),
                  //               recognizer: TapGestureRecognizer()
                  //                 ..onTap = () {})
                  //         ]),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 10),
                    child: CupertinoButton(
                        color: primaryColor,
                        child: const Text(
                          'Change Password',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          authProviderController.changePassword(context);
                        }),
                  )
                ],
              ),
            ),
          ),

          // sab se top wala portion

          CustomBlueHeader(
              fromleft: 60,
              size: size,
              callback: () {
                log('message');
                Navigator.pop(context);
              },
              icon: Icons.arrow_back,
              title: 'Change Password')
        ]),
      ),
    );
  }
}
