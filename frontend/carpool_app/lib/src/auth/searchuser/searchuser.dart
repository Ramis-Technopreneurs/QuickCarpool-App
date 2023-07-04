import 'package:carpool_app/data/auth/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/utils.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  AuthProviderController authProviderController = AuthProviderController();
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
        Container(
          width: size.width,
          height: size.height * 0.4,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/map 1.png'), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                //color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('assets/Quick-Logo W.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ),
        Positioned(
          top: 260,
          child: Container(
            width: size.width,
            height: size.height * 0.65,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Search User',
                      style: TextStyle(
                        fontSize: size.width * 0.06,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextFormField(
                      controller: authProviderController.searchUserController,
                      style: const TextStyle(height: 0.05),
                      decoration: const InputDecoration(
                          hintText: 'Search Phone Number',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 100, horizontal: 30),
                    child: SizedBox(
                      width: size.width,
                      child: CupertinoButton(
                          color: primaryColor,
                          child: const Text('Search'),
                          onPressed: () {
                            authProviderController.searchUser(context);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
