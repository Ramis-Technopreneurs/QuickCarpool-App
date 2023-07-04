import 'dart:io';

import 'package:carpool_app/common/custom_blue_header.dart';
import 'package:carpool_app/common/editprofile/driver_container_widget.dart';
import 'package:carpool_app/common/editprofile/passenger_container_widget.dart';
import 'package:carpool_app/data/user/user.dart';
import 'package:flutter/material.dart';
import '../../common/editprofile/driver_tab.dart';
import '../../common/utils/utils.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatefulWidget {
  final UserController userController;
  final bool isDriverRegister;
  const EditProfileScreen(
      {super.key,
      required this.userController,
      required this.isDriverRegister});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isPassenger = true;

  void setPassenger(bool value) {
    setState(() {
      isPassenger = value;
    });
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
          Positioned(
            top: 330,
            child: SizedBox(
                width: size.width,
                height: size.height * 0.56,
                child: isPassenger == true
                    ? PassengerContainerWidget(
                        size: size,
                        userController: widget.userController,
                      )
                    : DriverContainerWidget(
                        size: size,
                        userController: widget.userController,
                      )),
          ),
          Container(
            height: size.height * 0.4,
            width: size.width,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.grey, spreadRadius: 7, blurRadius: 3)
            ]),
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 120,
                    child: Stack(children: [
                      (widget.userController.image == null)
                          ? Positioned(
                              left: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(widget
                                            .userController.user.userimage!),
                                        fit: BoxFit.fill),
                                    color: Colors.grey,
                                    shape: BoxShape.circle),
                                width: 120,
                                height: 120,
                              ),
                            )
                          : Positioned(
                              left: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(File(
                                            widget.userController.image!.path)),
                                        fit: BoxFit.fill),
                                    color: Colors.grey,
                                    shape: BoxShape.circle),
                                width: 120,
                                height: 120,
                              )),
                      // (widget.userController.user.userimage != null)
                      //     ? Container(
                      //         decoration: BoxDecoration(
                      //             image: DecorationImage(
                      //                 image: NetworkImage(
                      //                     widget.userController.user_image!),
                      //                 fit: BoxFit.fill),
                      //             color: Colors.grey,
                      //             shape: BoxShape.circle),
                      //         width: 120,
                      //         height: 120,
                      //       )
                      //     : (widget.userController.image == null)
                      //         ? Positioned(
                      //             left: 15,
                      //             child: Container(
                      //               decoration: const BoxDecoration(
                      //                   image: DecorationImage(
                      //                       image: AssetImage('assets/man.png'),
                      //                       fit: BoxFit.fill),
                      //                   color: Colors.grey,
                      //                   shape: BoxShape.circle),
                      //               width: 120,
                      //               height: 120,
                      //             ))
                      //         : Positioned(
                      //             left: 15,
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                   image: DecorationImage(
                      //                       image: FileImage(File(widget
                      //                           .userController.image!.path)),
                      //                       fit: BoxFit.fill),
                      //                   color: Colors.grey,
                      //                   shape: BoxShape.circle),
                      //               width: 120,
                      //               height: 120,
                      //             )),
                      Positioned(
                        top: 80,
                        left: 100,
                        child: GestureDetector(
                          onTap: () {
                            widget.userController.pickImage().then((value) {
                              setState(() {});
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 20,
                            child: const Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                  DriverTab(
                    size: size,
                    isPassenger: isPassenger,
                    userController: widget.userController,
                    setPassenger: setPassenger,
                    isDriverRegister: widget.isDriverRegister,
                  ),
                ],
              ),
            ),
          ),
          CustomBlueHeader(
              fromleft: 85,
              title: 'Edit Profile',
              size: size,
              callback: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back)
        ]),
      ),
    );
  }
}
