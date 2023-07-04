import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class PassengerRideStartWidget extends StatelessWidget {
  final Size size;
  const PassengerRideStartWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 80,
          width: size.width,
          // color: Colors.blue,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/Ellipse8.png"),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Zac Thomas"),
                  SizedBox(
                      height: 20,
                      width: size.width / 3,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) =>
                              Image.asset("assets/images/star.png"))),
                ],
              ),
              const Spacer(),
              Image.asset("assets/images/chat.png"),
              Image.asset("assets/images/call.png"),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            height: 50,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: const Color(0xffE5E5E5),
                )),
            child: Row(
              children: [
                Image.asset("assets/images/car3.png"),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Blue Suzuki Vitara - QUI764",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            )),
        const SizedBox(height: 30),
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
                    width: size.width - 100,
                    child:
                        const CustomTextField(title: "From: Gulshan 1, Dhaka"),
                  ),
                  SizedBox(
                    width: size.width - 100,
                    child: const CustomTextField(
                        title: "To: Kennedy Rd, Cranes(MN) 72490"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
