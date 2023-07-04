import 'package:carpool_app/common/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../common/custom_blue_header.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
              child: ListView.builder(
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 20),
                    width: size.width,
                    decoration:
                        BoxDecoration(border: Border.all(color: const Color(0xffD1D1D1))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/yellow_vertical_lines.png',
                              height: 80,
                              width: 50,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: const [
                                    Text(
                                        'From: St Eagle Lake, Minnes(MN) 56024\n2:00 pm'),
                                    SizedBox(
                                      width: 250,
                                      child: Divider(
                                        color: Colors.grey,
                                        thickness: 2,
                                      ),
                                    ),
                                    Text(
                                        'To: Kennedy Rd, Cranes(MN) 72490 2:30\n pm'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/cash.png"),
                            const Text('\$3.78'),
                            const Icon(Icons.calendar_month),
                            const Text('25/5/2023'),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'See ride details >',
                                  style: TextStyle(color: primaryColor),
                                ))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // sab se top wala portion

          CustomBlueHeader(
              fromleft: 80,
              size: size,
              callback: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back,
              title: 'Your ride history')
        ]),
      ),
    );
  }
}
