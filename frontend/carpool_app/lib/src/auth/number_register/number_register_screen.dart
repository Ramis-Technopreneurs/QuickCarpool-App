import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../common/utils/utils.dart';
import '../../../data/auth/auth_provider.dart';

class NumberRegisterScreen extends StatefulWidget {
  const NumberRegisterScreen({super.key});

  @override
  State<NumberRegisterScreen> createState() => _NumberRegisterScreenState();
}

class _NumberRegisterScreenState extends State<NumberRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  AuthProviderController authProvider = AuthProviderController();

  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.65,
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
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          'Enter Phone Number',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            'Please verify your number',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: TextFormField(
                          controller: authProvider.phoneNumberController,
                          style: const TextStyle(height: 0.05),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              hintText: '+92 0003216544',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Checkbox(
                                value: checkBox,
                                onChanged: (value) {
                                  setState(() {
                                    checkBox = value!;
                                  });
                                }),
                            const Text(
                              'Get news and email from quick',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CupertinoButton(
                              color: primaryColor,
                              child: const Text('Send OTP'),
                              onPressed: () {
                                authProvider.register(context);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
