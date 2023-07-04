import 'package:flutter/material.dart';

import '../../src/ride/ride_screen.dart';
import '../custom_text_field.dart';

class RideAcceptDialoge extends StatelessWidget {
  final bool isDriver;
  const RideAcceptDialoge({super.key, required this.isDriver});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: size.width / 1.2,
              height: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "John Doe",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("4/5"),
                      Container(
                        height: 20,
                        width: 60,
                        margin: const EdgeInsets.only(left: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            );
                          },
                          itemCount: 5,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset("assets/images/circle_icon.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("2 requested seats"),
                        const Spacer(),
                        Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xff8E8E8E), width: 2)),
                          child: const Center(child: Text("\$3.56")),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/images/points.png"),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: size.width / 2 + 20,
                              child: const CustomTextField(
                                  title: "From: Your pickup location"),
                            ),
                            SizedBox(
                              width: size.width / 2 + 20,
                              child: const CustomTextField(
                                  title: "To: Your drop off location"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Decline",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                        ),
                        SizedBox(
                          height: 40,
                          width: 160,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RiderScreen(isDriver: isDriver)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0077B6),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            child: const Text(
                              "Accept Ride",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
