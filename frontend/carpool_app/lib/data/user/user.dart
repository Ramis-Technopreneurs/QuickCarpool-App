import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carpool_app/route/route_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../repository/repo.dart';
import '../model/user.dart';

class UserController {
  static final UserController _singleton = UserController._internal();

  factory UserController() {
    return _singleton;
  }

  UserController._internal();

  int? carSeats;
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController drivingLicenseController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  TextEditingController driverPrefernceController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  UserModel user = UserModel();
  // ignore: non_constant_identifier_names
  String? user_image;
  final ImagePicker picker = ImagePicker();
  XFile? image;

  Future<void> pickImage() async {
    try {
      image = (await picker.pickImage(source: ImageSource.gallery));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> registerDriverCall(BuildContext context) async {
    if (fullNameController.text.isNotEmpty) {
      if (emailController.text.isNotEmpty) {
        if (genderController.text.isNotEmpty) {
          if (countryController.text.isNotEmpty) {
            if (phoneNumberController.text.isNotEmpty) {
              if (carNumberController.text.isNotEmpty) {
                if (carModelController.text.isNotEmpty) {
                  if (drivingLicenseController.text.isNotEmpty) {
                    if (carColorController.text.isNotEmpty) {
                      if (driverPrefernceController.text.isNotEmpty) {
                        if (dobController.text.isNotEmpty) {
                          if (image!.path.isNotEmpty) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            UserModel user = UserModel();
                            user.id = prefs.getInt("userId")!;
                            user.authKey = prefs.getString("token")!;
                            //  log(user.id.toString());
                            // log(carModelController.text);
                            user.email = emailController.text;
                            user.fullName = fullNameController.text;
                            user.gender = genderController.text;
                            user.country = countryController.text;
                            user.phoneNumber = phoneNumberController.text;
                            user.carNumber = carNumberController.text;
                            user.carModel = carModelController.text;
                            user.drivingLicense = drivingLicenseController.text;
                            user.carColor = carColorController.text;
                            user.carSeats = carSeats.toString();
                            user.drivingPreferences =
                                driverPrefernceController.text;
                            user.dob = dobController.text;

                            registerDriver(user, File(image!.path))
                                .then((value) {
                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.success(
                                  message: "Driver register  successfully",
                                ),
                              );

                              Navigator.pushNamed(context, navigationPageRoute);
                            }).catchError((err) {
                              //log(err);
                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.error(
                                  message: "Something went wrong",
                                ),
                              );
                            });
                          } else {
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.error(
                                message: "Please Select Image",
                              ),
                            );
                          }
                        } else {
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.error(
                              message: "Please enter Date of Birth ",
                            ),
                          );
                        }
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.error(
                            message: "Please enter driver preference ",
                          ),
                        );
                      }
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(
                          message: "Please enter car color ",
                        ),
                      );
                    }
                  } else {
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.error(
                        message: "Please enter driving License ",
                      ),
                    );
                  }
                } else {
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.error(
                      message: "Please enter car model ",
                    ),
                  );
                }
              } else {
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.error(
                    message: "Please enter car number",
                  ),
                );
              }
            } else {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.error(
                  message: "Please enter phone number ",
                ),
              );
            }
          } else {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: "Please enter country ",
              ),
            );
          }
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "Please enter gender ",
            ),
          );
        }
      } else {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Please enter email",
          ),
        );
      }
    } else {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please enter full name",
        ),
      );
    }
  }

  Future<void> updateUser(BuildContext context, bool isEdit) async {
    if (fullNameController.text.isNotEmpty) {
      if (emailController.text.isNotEmpty) {
        if (isEdit == true || passwordController.text.isNotEmpty) {
          if (genderController.text.isNotEmpty) {
            if (countryController.text.isNotEmpty) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              UserModel user = UserModel();
              user.id = prefs.getInt("userId")!;
              user.authKey = prefs.getString("token")!;
              user.email = emailController.text;
              user.fullName = fullNameController.text;
              user.gender = genderController.text;
              user.country = countryController.text;
              user.password = passwordController.text;
              uploadImage(user, File(image!.path)).then((value) {
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.success(
                    message: "Successfully updated",
                  ),
                );

                Navigator.pushNamed(context, navigationPageRoute);
              }).catchError((err) {
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.error(
                    message: "Something went wrong",
                  ),
                );
              });
            } else {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.error(
                  message: "Please enter country",
                ),
              );
            }
          } else {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: "Please enter gender",
              ),
            );
          }
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "Please enter password",
            ),
          );
        }
      } else {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Please enter email",
          ),
        );
      }
    } else {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please enter full name",
        ),
      );
    }
  }

  Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // log("User id from shared preference ${prefs.getInt("userId")}");
    int id = prefs.getInt("userId")!;

    await getUserCall(id, prefs.getString("token")!).then((value) {
      user = value;
      emailController.text = user.email!;
      fullNameController.text = user.fullName!;
      phoneNumberController.text = user.phoneNumber!;
      genderController.text = user.gender!;
      countryController.text = user.country!;
      user_image = user.userimage;
      dobController.text = user.dob;
      carNumberController.text = user.carNumber;
      carModelController.text = user.carModel;
      drivingLicenseController.text = user.drivingLicense;
      carColorController.text = user.carColor;
      carSeats = user.carSeats;
      driverPrefernceController.text = user.drivingPreferences;
      return user;
    }).catchError((err) {
      throw err;
    });
    return user;
  }
}
