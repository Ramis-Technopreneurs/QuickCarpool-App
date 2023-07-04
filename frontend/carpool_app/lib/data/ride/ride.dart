import 'package:carpool_app/common/home/custom_passenger_widget.dart';
import 'package:carpool_app/repository/repo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../model/user.dart';

class RideController {
  static final RideController _singleton = RideController._internal();

  factory RideController() {
    return _singleton;
  }

  RideController._internal();
  String carType = "car";
  TextEditingController pickupLocationController = TextEditingController();
  TextEditingController dropOffLocationController = TextEditingController();

  Future<void> requestRiderCall(context) async {
    if (pickupLocationController.text.isNotEmpty) {
      if (dropOffLocationController.text.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        UserModel user = UserModel();
        user.id = prefs.getInt("userId")!;
        user.authKey = prefs.getString("token")!;
        requestRide(
            user,
            47.3212,
            29.1234,
            123.4154,
            125,
            pickupLocationController.text,
            dropOffLocationController.text,
            carType,
            24.4,
            1,
            2.5);
      } else {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Please Enter DropOff Location",
          ),
        );
      }
    } else {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please Enter Pickup Location",
        ),
      );
    }
  }
}
