import 'package:flutter/material.dart';
import '../../common/driver/ride_accept_dialoge.dart';
import '../ride/ride_screen.dart';

class FindingRiderScreen extends StatelessWidget {
  final bool isDriver;
  const FindingRiderScreen({
    super.key,
    required this.isDriver,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        GestureDetector(
          onTap: () async {
            if (isDriver) {
              await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return RideAcceptDialoge(isDriver: isDriver);
                  });
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RiderScreen(isDriver: false,)));
            }
          },
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset("assets/images/map.png", fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
              height: 100,
              width: size.width / 2,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: const Center(child: CircularProgressIndicator())),
        ),
      ]),
    );
  }
}
