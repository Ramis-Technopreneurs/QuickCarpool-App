import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../src/auth/signin/signin_screen.dart';
import '../../src/feedback/feedback_screen.dart';
import '../../src/security/security_screen.dart';
import '../../src/settings/setting_screen.dart';

class AppDetailsWidget extends StatelessWidget {
  final Size size;
  const AppDetailsWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.4,
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
                        builder: (context) => const SettingScreen()));
              },
              child: Row(
                children: const [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Settings')
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecurityScreen()));
              },
              child: Row(
                children: const [
                  Icon(Icons.security),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Security')
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FeedBackScreen()));
              },
              child: Row(
                children: const [
                  Icon(Icons.feedback),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Send Feedback')
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Center(child: Text('Logout')),
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel')),
                        ElevatedButton(
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.clear();
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFF523B)),
                            child: const Text('Log out')),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: const [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 30,
                  ),
                  Text('LogOut')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
