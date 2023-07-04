import 'package:carpool_app/src/backupcodegenerator/backup_code_generatot_screen.dart';
import 'package:carpool_app/src/auth/twofactorauth/two_factor_authentication_screen.dart';
import 'package:flutter/material.dart';

import '../../common/custom_blue_header.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
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
              padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TwoFactorAuthScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Two-factor authentication',
                          style: TextStyle(
                              fontSize: size.height * 0.02,
                              color: Colors.black),
                        ),
                        Icon(
                          size: size.height * 0.022,
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BackUpCodeGeneratorScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Backup code generator',
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                color: Colors.black),
                          ),
                          Icon(
                            size: size.height * 0.022,
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Header
          CustomBlueHeader(
              fromleft: 90,
              size: size,
              callback: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) => const AccountScreen())));
              },
              icon: Icons.arrow_back,
              title: 'Security')
        ]),
      ),
    );
  }
}
