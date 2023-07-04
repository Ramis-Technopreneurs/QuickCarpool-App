import 'package:carpool_app/data/user/user.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class PassengerContainerWidget extends StatelessWidget {
  final Size size;
  final UserController userController;
  const PassengerContainerWidget({super.key, required this.size, required this.userController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Full Name',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              controller: userController.fullNameController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "full name",
                  labelText: "full name",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Phone Number',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              controller: userController.phoneNumberController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "number",
                  labelText: "number",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Gender',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              controller: userController.genderController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "gender",
                  labelText: "gender",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Country',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              controller: userController.countryController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "country",
                  labelText: "country",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Email',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              controller: userController.emailController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  userController.updateUser(context,true);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const FindingRiderScreen(isDriver: false,)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0077B6),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
