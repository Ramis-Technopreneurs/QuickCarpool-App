import 'package:carpool_app/src/finding%20rider/finding_rider.dart';
import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class CustomDriverWidget extends StatefulWidget {
  final Size size;
  const CustomDriverWidget({super.key, required this.size});

  @override
  State<CustomDriverWidget> createState() => _CustomDriverWidgetState();
}

class _CustomDriverWidgetState extends State<CustomDriverWidget> {
  List<int> selectedSeats = [];

  void changeSeats(int index) {
    if (selectedSeats.contains(index)) {
      setState(() {
        selectedSeats.remove(index);
      });
    } else {
      setState(() {
        selectedSeats.add(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
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
            height: 30,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Your car details:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 50,
              width: widget.size.width,
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
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Seats available:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            width: widget.size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      changeSeats(index);
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
                        color: selectedSeats.contains(index)
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: widget.size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FindingRiderScreen(isDriver: true,)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0077B6),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: const Text(
                  "Offer Ride",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
