import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class RideStartWidget extends StatelessWidget {
  final Size size;
  final Function(bool) setRideStop;
  const RideStartWidget({super.key, required this.size, required this.setRideStop});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Your current location:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Row(children: [
          Image.asset("assets/images/home_location.png"),
          const SizedBox(
            width: 20,
          ),
          const Expanded(
            child: CustomTextField(title: "St Eagle Lake, Minnes(MN) 56024"),
          )
        ]),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 40,
          width: size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // changeSeats(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.circular(50)),
                    child: Image.asset(
                      "assets/images/seat_icon.png",
                      color:
                          //  selectedSeats.contains(index)
                          //     ?
                          Colors.blue,
                      // : Colors.grey,
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 125,
          width: size.width,
          decoration: BoxDecoration(
              color: const Color(0xff232323),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Jhon Doe",
                      style: TextStyle(color: Colors.white),
                    ),
                    const Spacer(),
                    Image.asset("assets/images/call.png"),
                    // Image.asset("assets/images/seats.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff8E8E8E), width: 2)),
                      child: const Center(
                          child: Text(
                        "\$3.56",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Image.asset("assets/images/points.png"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                          width: size.width - 120,
                          child: const CustomTextField(
                            title: "From: Your pickup location",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: size.width - 120,
                          child: const CustomTextField(
                            title: "To: Your drop off location",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            height: 50,
            width: size.width,
            child: ElevatedButton(
              onPressed: () {
                setRideStop(true);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             const FindingRiderScreen(
                //               isDriver: false,
                //             )));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0077B6),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              child: const Text(
                "Drop off Colin",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
