import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../data/user/user.dart';

// ignore: must_be_immutable
class DriverTab extends StatefulWidget {
  final Size size;
  bool isPassenger;
  bool isDriverRegister;
  final UserController userController;
  final Function(bool) setPassenger;
  DriverTab(
      {super.key,
      required this.size,
      required this.isPassenger,
      required this.userController,
      required this.isDriverRegister,
      required this.setPassenger});

  @override
  State<DriverTab> createState() => _DriverTabState();
}

class _DriverTabState extends State<DriverTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.size.height * 0.03),
      child: Container(
        width: widget.size.width,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
            // ignore: use_full_hex_values_for_flutter_colors
            border: Border.all(color: const Color(0xff969696b2)),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: [
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () {
                widget.setPassenger(true);
              },
              child: Container(
                height: 40,
                width: widget.isPassenger
                    ? widget.size.width / 2 - 40
                    : widget.size.width / 2 - 50,
                decoration: BoxDecoration(
                  color: (widget.isPassenger == true)
                      ? Colors.grey.shade700
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'Passenger',
                    style: TextStyle(
                        color: (widget.isPassenger == true)
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (widget.isDriverRegister == false) {
                  if (widget.userController.user.roleId == 1) {
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.error(
                        message: "You have to register as a driver first",
                      ),
                    );
                  } else {
                    widget.setPassenger(false);
                  }
                }else {
                  widget.setPassenger(false);
                }
              },
              child: Container(
                height: 40,
                width: widget.isPassenger
                    ? widget.size.width / 2 - 50
                    : widget.size.width / 2 - 40,
                decoration: BoxDecoration(
                    color: (widget.isPassenger == true)
                        ? Colors.white
                        : Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    'Driver',
                    style: TextStyle(
                        color: widget.isPassenger == true
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
