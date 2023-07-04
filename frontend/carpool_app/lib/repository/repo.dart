import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../common/utils/config.dart';
import '../data/model/user.dart';

Future<UserModel> loginCall(String number, String password, context) async {
  final response = await http.post(
    Uri.parse(loginApi),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "phone_number": number,
      "password": password,
    }),
  );

  if (response.statusCode == 200) {
    return UserModel.fromJson(json.decode(response.body)["data"]);
  } else {
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: "Invalid credential",
      ),
    );
    log(response.statusCode.toString());
    log(response.body);
    throw Exception('Failed to login');
  }
}

Future<String> registerCall(String number) async {
  final response = await http.post(
    Uri.parse(registerApi),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode({"phone_number": number}),
  );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to login');
  }
}

Future<void> registerDriver(UserModel user, File image) async {
  String url = registerDriverApi + user.id.toString();
  try {
    final request = http.MultipartRequest('PUT', Uri.parse(url));
    request.headers['Authorization'] = user.authKey!;

    var multipart = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(multipart);

    log(user.dob);
    request.fields['email'] = user.email!;
    request.fields['fullName'] = user.fullName!;
    request.fields['gender'] = user.gender!;
    request.fields['country'] = user.country!;
    request.fields['car_number'] = user.carNumber!.toString();
    request.fields['car_model'] = user.carModel!.toString();
    request.fields['driving_license'] = user.drivingLicense!;
    request.fields['car_color'] = user.carColor!;
    request.fields['car_seats'] = user.carSeats!.toString();
    request.fields['driving_preferences'] = user.drivingPreferences!;
    request.fields['phone_number'] = user.phoneNumber!;
    request.fields['dob'] = user.dob!.toString();
    request.fields['role_id'] = "2";

    var response = await request.send();
    log(response.toString());
    if (response.statusCode == 200) {
      log("Driver registered successfully");
    } else {
      log("Error: ${response.statusCode}");
    }
  } catch (e) {
    log("Error: $e");
  }
}

Future<void> uploadImage(UserModel user, File image) async {
  String url = "$userApi/${user.id}";

  try {
    final request = http.MultipartRequest('PUT', Uri.parse(url));
    request.headers['Authorization'] = user.authKey!;

    var multipartFile = await http.MultipartFile.fromPath(
      'image',
      image.path,
    );

    request.files.add(multipartFile);
    request.fields['email'] = user.email!;
    request.fields['fullName'] = user.fullName!;
    request.fields['gender'] = user.gender!;
    request.fields['country'] = user.country!;
    request.fields['pass'] = user.password!;
    request.fields['is_driver'] = "0";

    var response = await request.send();

    if (response.statusCode == 200) {
      log('File uploaded');
    } else {
      log('File upload failed');
    }
  } catch (e) {
    log(image.path);

    log('$e');
  }
}

Future<void> requestRide(
    UserModel user,
    double fromLat,
    double toLat,
    double fromLong,
    double toLong,
    String fromAdd,
    String toAdd,
    String carType,
    double initialWait,
    double dis,
    double time) async {
  var response = await http.post(Uri.parse(requestRideApi),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': user.authKey!
      },
      body: jsonEncode({
        'user_id': user.id!,
        'from_lat': fromLat,
        'to_lat': toLat,
        'from_lng': fromLong,
        'to_lng': toLong,
        'from_address': fromAdd,
        'to_address': toAdd,
        'status': 'pending',
        'car_type': carType,
        'initial_waiting': initialWait,
        'distance': dis,
        'time': time
      }));
  if (response.statusCode == 200) {
    log('req a ride');
  } else {
    throw "Something went wrong";
  }
}

// Future<UserModel> updateUserCall(UserModel user) async {
//   String url = "$userApi/${user.id}";

//   final response = await http.put(
//     Uri.parse(url),
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': user.authKey!
//     },
//     body: json.encode(user.toJson()),
//   );
//   if (response.statusCode == 200) {
//     return UserModel.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to login');
//   }
// }

Future<UserModel> getUserCall(int userId, String token) async {
  //log(userId.toString());
  String url = "$userApi/$userId";

  final response = await http.get(Uri.parse(url),
      headers: {'Content-Type': 'application/json', 'Authorization': token});

  // log("get user");
  //log(response.statusCode.toString());
  if (response.statusCode == 200) {
    return UserModel.fromJson(json.decode(response.body)["data"]);
  } else {
    throw Exception('Failed to login');
  }
}
