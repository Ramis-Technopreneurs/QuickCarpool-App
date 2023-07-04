import 'dart:io';

import 'package:carpool_app/data/user/user.dart';
import 'package:flutter/material.dart';

import '../../common/utils/utils.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Center(
                  child: Text(
                "More Info",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: SizedBox(
                width: size.width * 0.1,
                height: size.height * 0.15,
                //decoration: const BoxDecoration(color: Colors.orange),
                child: Stack(
                  children: [
                    (userController.image == null)
                        ? Positioned(
                            left: 15,
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/man.png'),
                                      fit: BoxFit.fill),
                                  color: Colors.grey,
                                  shape: BoxShape.circle),
                              width: 120,
                              height: 120,
                            ))
                        : Positioned(
                            left: 15,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(userController.image!.path)),
                                      fit: BoxFit.fill),
                                  color: Colors.grey,
                                  shape: BoxShape.circle),
                              width: 120,
                              height: 120,
                            )),
                    Positioned(
                      top: 82,
                      left: 100,
                      child: GestureDetector(
                        onTap: () {
                          userController.pickImage().then((value) {
                            setState(() {});
                          });
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: primaryColor,
                          child: const Icon(Icons.camera),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                'Password',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.04),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextFormField(
                controller: userController.passwordController,
                style: const TextStyle(height: 0.5),
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    focusColor: primaryColor,
                    suffixIcon: const Icon(Icons.edit),
                    border: const OutlineInputBorder()),
              ),
            ),
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    userController.updateUser(context, false);
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
      ),
    );
  }
}
