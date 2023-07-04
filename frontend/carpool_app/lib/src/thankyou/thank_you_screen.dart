import 'package:carpool_app/src/navbar/navbar.dart';
import 'package:flutter/material.dart';

class ThankyouScreen extends StatelessWidget {
  const ThankyouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Center(
                child: Text(
              "Thank You",
              style: TextStyle(color: Colors.blue, fontSize: 40),
            )),
            const Center(
                child: Text(
              "for trusting Quick",
              style: TextStyle(fontSize: 30),
            )),
            const Center(
                child: Text(
              "How was your experience",
              style: TextStyle(fontSize: 20),
            )),
            SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("assets/images/thankyou.png")),
            const Center(
                child: Text(
              "Rate a driver",
              style: TextStyle(fontSize: 16),
            )),
            Center(
              child: Container(
                  height: 40,
                  width: size.width / 2,
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, snapshot) => SizedBox(
                          width: 30,
                          child: Image.asset("assets/images/star.png")),
                      itemCount: 5)),
            ),
            const Center(
                child: Text(
              "Leave a feedback",
              style: TextStyle(fontSize: 16),
            )),
            SizedBox(
                height: size.height / 3.5,
                width: size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 80,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffBCBCBC),
                            )),
                        child: const Center(child: Text("Arrived on time")),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffBCBCBC),
                            )),
                        child: const Center(
                            child: Text("Unprofessional Behavior")),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffBCBCBC),
                            )),
                        child: const Center(child: Text("Cleanliness")),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffBCBCBC),
                            )),
                        child: const Center(child: Text("Rash Driving")),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 50,
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
                  "Submit Feedback",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
