import 'dart:developer';

import 'package:carpool_app/common/home/custom_selectable_service.dart';
import 'package:carpool_app/data/ride/ride.dart';
import 'package:flutter/material.dart';
import '../../src/finding rider/finding_rider.dart';
import '../custom_text_field.dart';

class CustomPassengerWidget extends StatefulWidget {
  final Size size;

  const CustomPassengerWidget({super.key, required this.size});

  @override
  State<CustomPassengerWidget> createState() => _CustomPassengerWidgetState();
}

class _CustomPassengerWidgetState extends State<CustomPassengerWidget> {
  int index = 0;

  List<int> selectedIndex = [];
  void checkCarType() {
    if (index == 0) {
      rideController.carType = "car";

      setState(() {});
    } else if (index == 1) {
      rideController.carType = "ride";

      setState(() {});
    } else {
      rideController.carType = 'mini ride';

      setState(() {});
    }
  }

  void setIndex(int value) {
    index = value;
    checkCarType();
    setState(() {});
    // if (selectedIndex.contains(value)) {
    //   selectedIndex.remove(value);

    //   return;
    // } else {
    //   setState(() {
    //     selectedIndex.add(value);
    //   });
    // }
  }

  RideController rideController = RideController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 100,
          width: widget.size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSelectableCarServiceOption(
                  title: "Car",
                  image: "assets/images/car3.png",
                  index: 0,
                  selectedIndex: index,
                  setIndex: setIndex,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomSelectableCarServiceOption(
                  title: "Ride",
                  image: "assets/images/car1.png",
                  index: 1,
                  selectedIndex: index,
                  setIndex: setIndex,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomSelectableCarServiceOption(
                  title: "Mini Ride",
                  image: "assets/images/car2.png",
                  index: 2,
                  selectedIndex: index,
                  setIndex: setIndex,
                ),
              ],
            ),
          ),
        ),
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
                    width: widget.size.width - 80,
                    child: CustomTextField(
                        controller: rideController.pickupLocationController,
                        title: "From: Your pickup location"),
                  ),
                  SizedBox(
                    width: widget.size.width - 80,
                    child: CustomTextField(
                        controller: rideController.dropOffLocationController,
                        title: "To: Your drop off location"),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black)),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/cash.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Cash",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      rideController.requestRiderCall(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const FindingRiderScreen(
                      //               isDriver: false,
                      //             )));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0077B6),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    child: const Text(
                      "Confirm Ride",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
