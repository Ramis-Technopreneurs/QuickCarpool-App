import 'dart:convert';
import 'dart:math';
import 'package:carpool_app/common/utils/config.dart';
import 'package:carpool_app/data/model/user.dart';
import 'package:carpool_app/repository/repo.dart';
import 'package:carpool_app/src/auth/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:http/http.dart' as http;
import '../../route/route_utils.dart';
import '../../src/auth/changepassword/changepassword.dart';

class AuthProviderController {
  static final AuthProviderController _singleton =
      AuthProviderController._internal();

  factory AuthProviderController() {
    return _singleton;
  }

  AuthProviderController._internal();
  UserModel user = UserModel();
  TextEditingController phoneNumberController = TextEditingController();
  OtpFieldController otpController = OtpFieldController();
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  TextEditingController changePasswordController = TextEditingController();
  TextEditingController confirmChangePasswordController =
      TextEditingController();
  //TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController searchUserController = TextEditingController();
  int? id;
  String? token_;
  List<String> otpList = [""];
  int otpCode = 0;

  void register(BuildContext context) async {
    final navigator = Navigator.of(context);
    if (phoneNumberController.text.isEmpty &&
        phoneNumberController.text.length < 13) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please enter correct phone number",
        ),
      );
      return;
    } else {
      await registerCall(phoneNumberController.text).then((value) async {
        if (json.decode(value)['status'] == "success") {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Successfully registered",
            ),
          );

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt("userId", json.decode(value)['data']['id']);
          prefs.setString("token", json.decode(value)['data']['auth_key']);

          navigator.pushNamed(verifyNumberRoute);
        } else {
          String message = "";
          message = json.decode(value)['message'];
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: message,
            ),
          );
        }
      }).catchError((err) {
        //print(err.toString());
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Something went wrong",
          ),
        );
      });
    }
  }

  void getRandomOtp() {
    var random = Random();
    otpCode = random.nextInt(9000) + 1000;
    setOtpController();
  }

  void setOtpController() {
    otpList.clear();
    for (var i = 0; i < otpCode.toString().length; i++) {
      otpList.add(otpCode.toString()[i]);
    }
    otpController.set(otpList);
  }

  void checkOtpisVerified(BuildContext context) {
    if (otpCode == otpCode) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "OTP verified",
        ),
      );
      Navigator.of(context).pushNamed(profileDetailPageRoute);
    } else {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please enter correct OTP",
        ),
      );
    }
  }

  void login(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      // ignore: use_build_context_synchronously
      await loginCall(phoneNumberController.text, password.text, context)
          .then((value) {
        prefs.setInt("userId", value.id!);
        prefs.setString("token", value.authKey!);
        Navigator.popAndPushNamed(context, navigationPageRoute);
      });
    } catch (e) {
      
      showTopSnackBar(
        // ignore: use_build_context_synchronously
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Something went wrong",
        ),
      );
    }
  }

  Future changePassword(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId")!;
    String token = prefs.getString('token')!;
    String currentPass = currentPassword.text;
    String newPass = newPasswordController.text;
    String url = changePasswordApi + userId.toString();

    // print(userId);

    if (currentPassword.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        confirmNewPasswordController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please fill all the fields",
        ),
      );
    } else if (newPasswordController.text !=
        confirmNewPasswordController.text) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Confirm password is not matched",
        ),
      );
    } else {
      try {
        var response = await http.put(Uri.parse(url), headers: {
          'Authorization': token,
        }, body: {
          'current_password': currentPass,
          'new_password': newPass
        });
        if (response.statusCode == 200) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Password Changed Sucessfully",
            ),
          );
        } else {
          //print(response.body);
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "Something went wrong",
            ),
          );
        }
      } catch (e) {
        //  print(e);
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Server Error",
          ),
        );
      }
    }
  }

  Future searchUser(context) async {
    String searchUserNumber = searchUserController.text;

    var response = await http.post(Uri.parse(searchUserApi),
        body: {"phone_number": searchUserNumber});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      id = data['data']["id"];
      token_ = data['data']['auth_key'];
      // print(userId);
      // print(response.body);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ChangePreviousPassowrd()));
    } else {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "User Not Found",
        ),
      );
      searchUserController.clear();
    }
  }

  Future changePreviousPassword(context) async {
    String changePass = changePasswordController.text;
    String url = changePasswordApi + id.toString();
    if (changePasswordController.text.isEmpty &&
        confirmChangePasswordController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Fill all fields",
        ),
      );
    } else {
      try {
        var response = await http.put(Uri.parse(url), headers: {
          'Authorization': token_.toString(),
        }, body: {
          'new_password': changePass
        });
        if (response.statusCode == 200) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "Password Changed",
            ),
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignInScreen()));
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "Password not matched",
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Something went wrong",
          ),
        );
      }
    }
  }
}
