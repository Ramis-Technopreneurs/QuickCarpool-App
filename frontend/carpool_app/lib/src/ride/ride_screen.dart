import 'package:carpool_app/src/thankyou/thank_you_screen.dart';
import 'package:flutter/material.dart';
import '../../common/driver/bill_widget.dart';
import '../../common/driver/ride_start_widget.dart';
import '../../common/ride/passenger_ride_widget.dart';

class RiderScreen extends StatefulWidget {
  final bool isDriver;
  const RiderScreen({super.key, required this.isDriver});

  @override
  State<RiderScreen> createState() => _RiderScreenState();
}

class _RiderScreenState extends State<RiderScreen> {
  
  bool rideStop = false;

  void setRideStop(bool value) {
    setState(() {
      rideStop = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        GestureDetector(
          onTap: () {
            if (!widget.isDriver) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ThankyouScreen()));
            }
          },
          child: SizedBox(
            height: size.height,
            width: size.width,
            child:
                Image.asset("assets/images/MapsicleMap.png", fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: widget.isDriver ? size.height / 1.75 : size.height / 2,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                widget.isDriver
                    ? rideStop
                        ? const Text(
                            "Trip Summary for Kellie",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        : const Text(
                            "Your Current Ride Details",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Ride Fare",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "\$3.78",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: widget.isDriver
                          ? rideStop
                              ? BillWidget(size: size)
                              : RideStartWidget(
                                  size: size,
                                  setRideStop: setRideStop,
                                )
                          : PassengerRideStartWidget(
                              size: size,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
