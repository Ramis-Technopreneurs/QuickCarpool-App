import 'package:flutter/material.dart';
import '../../data/user/user.dart';
import '../utils/utils.dart';

class DriverContainerWidget extends StatefulWidget {
  final Size size;
  final UserController userController;
  const DriverContainerWidget(
      {super.key, required this.size, required this.userController});

  @override
  State<DriverContainerWidget> createState() => _DriverContainerWidgetState();
}

class _DriverContainerWidgetState extends State<DriverContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Full Name',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: widget.userController.fullNameController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "full name",
                  labelText: "full name",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Phone Number',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: widget.userController.phoneNumberController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "number",
                  labelText: "number",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Gender',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: widget.userController.genderController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "gender",
                  labelText: "gender",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Country',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: widget.userController.countryController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "country",
                  labelText: "country",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Email',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: widget.userController.emailController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Date of Birth',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: widget.userController.dobController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "Date of Birth",
                  labelText: "Date of Birth",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Car Number',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: widget.userController.carNumberController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "Car  Number",
                  labelText: "Car Number",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Car Model',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: widget.userController.carModelController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "Car Model",
                  labelText: "Car Model",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Driving License',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: widget.userController.drivingLicenseController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "Driving License",
                  labelText: "Driving License",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Car Color',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: widget.userController.carColorController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "Car Color",
                  labelText: "Car Color",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Car Seats',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: SizedBox(
              height: 40,
              width: widget.size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        widget.userController.carSeats = index + 1;
                        setState(() {});
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
                          color: (widget.userController.carSeats! >= index + 1)
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    );
                  }),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              'Driver Preference',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width * 0.04),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextField(
              controller: widget.userController.driverPrefernceController,
              style: const TextStyle(height: 0.5),
              decoration: InputDecoration(
                  hintText: "Driver Preferences",
                  labelText: "Driver Preferences",
                  focusColor: primaryColor,
                  suffixIcon: const Icon(Icons.edit),
                  border: const OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  widget.userController.registerDriverCall(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0077B6),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: const Text(
                  "Save",
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
