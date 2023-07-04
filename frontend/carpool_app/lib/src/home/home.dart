
import 'package:carpool_app/common/home/driver_tab.dart';
import 'package:carpool_app/data/user/user.dart';
import 'package:flutter/material.dart';
import '../../common/home/custom_driver_widget.dart';
import '../../common/home/custom_passenger_widget.dart';

class HomeScreen extends StatefulWidget {
  final UserController userController;
  const HomeScreen({super.key, required this.userController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndexDriver = 0;

  void changeIndexDriver(int index) {
    setState(() {
      selectedTabIndexDriver = index;
    });
  }

  Future<void> getUserDetails() async {
    await widget.userController.getUser().then((value) {
      setState(() {});
    });
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.userController.user.roleId == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child:
                      Image.asset("assets/images/map.png", fit: BoxFit.cover),
                ),
                widget.userController.user.roleId == 1
                    ? const SizedBox.shrink()
                    : Positioned(
                        top: 80,
                        child: SizedBox(
                          height: 70,
                          width: size.width,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xff232323),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: DriverTab(
                                size: size,
                                selectedIndex: selectedTabIndexDriver,
                                changeIndexDriver: changeIndexDriver),
                          ),
                        ),
                      ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.height / 1.75,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          selectedTabIndexDriver == 0
                              ? "Choose your ride below"
                              : "Set your ride offer details",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: size.width,
                            color: Colors.white,
                            child: selectedTabIndexDriver == 0
                                ? CustomPassengerWidget(size: size)
                                : CustomDriverWidget(size: size),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
