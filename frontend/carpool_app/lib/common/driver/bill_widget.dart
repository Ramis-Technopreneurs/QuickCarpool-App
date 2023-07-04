import 'package:flutter/material.dart';

import '../../src/navbar/navbar.dart';

class BillWidget extends StatelessWidget {
  final Size size;
  const BillWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 40,
          width: size.width / 1.5,
          child: Row(
            children: const [
              Text(
                "Total Cash",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "\$3.78",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          width: size.width / 1.5,
          child: Row(
            children: const [
              Text(
                "Number of Seats:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "1",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          width: size.width / 1.5,
          child: Row(
            children: const [
              Text(
                "Pick-up Time:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "1:00 pm",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          width: size.width / 1.5,
          child: Row(
            children: const [
              Text(
                "Drop-off Time:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "1:30 pm",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            height: 50,
            width: size.width,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationBarScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0077B6),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              child: const Text(
                "Continue Trip",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
