import 'package:carpool_app/data/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../src/changepassword/change_password.dart';
import '../../src/editprofile/edit_profile_screen.dart';

class UserDetails extends StatefulWidget {
  final Size size;
  final UserController userController;
  const UserDetails(
      {super.key, required this.size, required this.userController});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen(
                              userController: widget.userController,
                              isDriverRegister: false,
                            )));
              },
              child: Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Edit Profile')
                ],
              ),
            ),
            Row(
              children: const [
                Icon(Icons.call),
                SizedBox(
                  width: 30,
                ),
                Text('Phone Number')
              ],
            ),
            Row(
              children: const [
                Icon(Icons.pin_drop),
                SizedBox(
                  width: 30,
                ),
                Text('Location')
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen()));
              },
              child: Row(
                children: const [
                  Icon(Icons.lock),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Change Password')
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen(
                              userController: widget.userController,
                              isDriverRegister: true,
                            )));
              },
              child: Row(
                children: const [
                  Icon(CupertinoIcons.car),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Register as driver')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
