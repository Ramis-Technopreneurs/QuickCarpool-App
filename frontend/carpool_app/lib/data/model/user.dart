import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? fullName;
  String? email;
  String? gender;
  String? phoneNumber;
  String? country;
  String? password;
  String? userimage;
  dynamic dob;
  int? roleId;
  String? isDriver;
  dynamic carNumber;
  dynamic carModel;
  dynamic drivingLicense;
  dynamic carColor;
  dynamic carSeats;
  dynamic drivingPreferences;
  dynamic userLat;
  dynamic userLong;
  String? authKey;

  UserModel(
      {this.id,
      this.fullName,
      this.email,
      this.gender,
      this.phoneNumber,
      this.country,
      this.dob,
      this.userimage,
      this.roleId,
      this.carNumber,
      this.isDriver,
      this.carModel,
      this.drivingLicense,
      this.carColor,
      this.carSeats,
      this.drivingPreferences,
      this.userLat,
      this.userLong,
      this.authKey,
      this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        country: json["country"],
        userimage: json["image"],
        dob: json["dob"],
        roleId: json["role_id"],
        isDriver: json["is_driver"],
        carNumber: json["car_number"],
        carModel: json["car_model"],
        drivingLicense: json["driving_license"],
        carColor: json["car_color"],
        carSeats: json["car_seats"],
        drivingPreferences: json["driving_preferences"],
        userLat: json["user_lat"],
        userLong: json["user_long"],
        authKey: json["auth_key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "gender": gender,
        "phone_number": phoneNumber,
        "country": country,
        "dob": dob,
        "image": userimage,
        "pass": password,
        "is_driver": isDriver,
        "role_id": roleId,
        "car_number": carNumber,
        "car_model": carModel,
        "driving_license": drivingLicense,
        "car_color": carColor,
        "car_seats": carSeats,
        "driving_preferences": drivingPreferences,
        "user_lat": userLat,
        "user_long": userLong,
        "auth_key": authKey,
      };
}
