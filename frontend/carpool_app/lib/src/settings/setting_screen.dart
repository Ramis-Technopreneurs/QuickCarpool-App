import 'dart:developer';
import 'package:carpool_app/common/settings/custom_swtich_row.dart';
import 'package:carpool_app/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_blue_header.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool appNoti = false;
  bool localService = false;
  bool enaCall = false;
  bool showRideHistory = false;
  bool saveAdd = false;

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
                  CustomSwitchRow(
                      title: 'App Notifications',
                      switchValue: appNoti,
                      callbackAction: (val) {
                        setState(() {
                          appNoti = val;
                        });
                        log(appNoti.toString());
                      },
                      size: size),
                  CustomSwitchRow(
                      title: 'Local Services',
                      switchValue: localService,
                      callbackAction: (val) {
                        setState(() {
                          localService = val;
                        });
                      },
                      size: size),
                  CustomSwitchRow(
                      title: 'Enable Call/Messages',
                      switchValue: enaCall,
                      callbackAction: (val) {
                        setState(() {
                          enaCall = val;
                        });
                      },
                      size: size),
                  CustomSwitchRow(
                      title: 'Show Ride History',
                      switchValue: showRideHistory,
                      callbackAction: (val) {
                        setState(() {
                          showRideHistory = val;
                        });
                      },
                      size: size),
                  CustomSwitchRow(
                      title: 'Save Address',
                      switchValue: saveAdd,
                      callbackAction: (val) {
                        setState(() {
                          saveAdd = val;
                        });
                      },
                      size: size),
                  SizedBox(
                    height: size.height * 0.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CupertinoButton(
                        color: primaryColor,
                        child: const Text('Save Changes'),
                        onPressed: () {}),
                  )
                ],
              ),
            ),
          ),

          // sab se top wala portion

          CustomBlueHeader(
              fromleft: 90,
              size: size,
              callback: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back,
              title: 'Settings')
        ]),
      ),
    );
  }
}
