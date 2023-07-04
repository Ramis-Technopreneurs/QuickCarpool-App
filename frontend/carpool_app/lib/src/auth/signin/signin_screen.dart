import 'package:carpool_app/data/auth/auth_provider.dart';
import 'package:carpool_app/route/route_utils.dart';
import 'package:carpool_app/src/auth/searchuser/searchuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthProviderController auth = AuthProviderController();
  final _formKey = GlobalKey<FormState>();
  bool checkBox = false;
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
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        'SignIn',
                        style: TextStyle(
                          fontSize: size.width * 0.06,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          'Please sign in to continue using our app',
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextFormField(
                         keyboardType: TextInputType.phone,
                        controller: auth.phoneNumberController,
                        style: const TextStyle(height: 0.05),
                        decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: TextFormField(
                       
                        controller: auth.password,
                        style: const TextStyle(height: 0.05),
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.remove_red_eye),
                            hintText: 'Password',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Checkbox(
                              value: checkBox,
                              onChanged: (value) {
                                setState(() {
                                  checkBox = value!;
                                });
                              }),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              'Keep me signed in',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchUserScreen()));
                              },
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(color: primaryColor),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 90,
                            child: Divider(
                              thickness: 0.9,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'or contiue with',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Divider(
                              thickness: 0.9,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 140),
                      child: Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.google),
                              color: Colors.red,
                            ),
                            //
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.facebook),
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: SizedBox(
                        width: size.width,
                        child: CupertinoButton(
                            color: primaryColor,
                            child: const Text('Sign In'),
                            onPressed: () {
                              auth.login(context);
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      child: RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Register now >',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 15),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, numberRegisterRoute);
                                      // MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         const NumberRegisterScreen()));
                                    }),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
