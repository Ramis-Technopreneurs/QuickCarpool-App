import 'package:flutter/material.dart';
import '../../common/account/app_details_widget.dart';
import '../../common/account/user_details_widget.dart';
import '../../common/utils/utils.dart';
import '../../data/user/user.dart';

class AccountScreen extends StatefulWidget {
  final UserController userController;
  const AccountScreen({super.key, required this.userController});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isUserDeatil = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Account',
          style: TextStyle(
              fontSize: size.height * 0.025,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 250, left: 30, right: 30, bottom: 40),
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isUserDeatil = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'User details',
                              style: TextStyle(
                                  fontSize: size.height * 0.025,
                                  color: (isUserDeatil == true)
                                      ? primaryColor
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 130,
                              child: Divider(
                                thickness: 4,
                                color: (isUserDeatil == true)
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isUserDeatil = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'App details',
                              style: TextStyle(
                                  fontSize: size.height * 0.025,
                                  color: (isUserDeatil == false)
                                      ? primaryColor
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 130,
                              child: Divider(
                                thickness: 4,
                                color: (isUserDeatil == false)
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                isUserDeatil == true
                    ? UserDetails(
                        size: size, userController: widget.userController)
                    : AppDetailsWidget(size: size),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 3), color: Colors.grey, blurRadius: 5)
                ],
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (widget.userController.user.userimage != null)
                    ? Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.userController.user.userimage!),
                                fit: BoxFit.fill),
                            color: Colors.grey,
                            shape: BoxShape.circle),
                        width: 120,
                        height: 120,
                      )
                    : Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/man.png'),
                                fit: BoxFit.fill),
                            color: Colors.grey,
                            shape: BoxShape.circle),
                        width: 120,
                        height: 120,
                      ),
                Text(
                  widget.userController.user.fullName!,
                  style: TextStyle(
                    fontSize: size.height * 0.022,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.userController.user.email!,
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
