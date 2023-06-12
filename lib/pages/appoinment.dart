import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/common/color.dart';
import 'package:project/common/custom_appbar.dart';
import 'package:project/pages/set_appoinment.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/bottom_bar.dart';
import '../controllers/authentication.dart';
import '../controllers/doctor.dart';
import 'doctor_profile.dart';

class Appoinment extends StatefulWidget {
  final data;
  const Appoinment({Key? key, this.data}) : super(key: key);

  @override
  State<Appoinment> createState() => _AppoinmentState();
}

class _AppoinmentState extends State<Appoinment> {
  final DoctorController _doctorController = Get.put(DoctorController());
  static const LatLng source = LatLng(45.521563, -122.677433);
  static const _initialCameraPosition =
      CameraPosition(target: source, zoom: 14.5);

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
      appBar: const CustomAppBar(title: "Appoinment"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorApp().color_white,
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      "https://4yourp.000webhostapp.com/images/${widget.data["info"]["avatar"]}",
                      fit: BoxFit.cover,
                      width: 120,
                      height: 130,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              Text(
                                "${widget.data["info"]["user"]["name"]}",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: ColorApp().color_black),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.solidHeart,
                                  color: Colors.red,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${widget.data["info"]["specialty"]}",
                          style: GoogleFonts.poppins(
                              color: ColorApp().color_grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const <Widget>[
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.orange,
                                size: 14,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.orange,
                                size: 14,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.orange,
                                size: 14,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.orange,
                                size: 14,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.grey,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(children: [
                            Text(
                              "20\$/hour",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: ColorApp().color_grey),
                            ),
                            FaIcon(
                              FontAwesomeIcons.dollarSign,
                              color: Colors.green,
                              size: 14,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoctorProfile(data: widget.data),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: HexColor("#0EBE7F")),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Profile",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SetAppoinment(data: widget.data),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: HexColor("#0EBE7F")),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Book now",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorApp().color_green),
                ),
                Container(
                  width: 350,
                  padding: const EdgeInsets.only(bottom: 5, top: 10, left: 5),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: ColorApp().color_grey),
                  )),
                  child: Text(
                    "Education: ${widget.data["info"]["education"]}\nAddress: ${widget.data["info"]["address"]}\nWork Experience: ${widget.data["info"]["work_experience"]}\n",
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: ColorApp().color_grey),
                  ),
                ),
                Container(
                  height: 200,
                  // width: 500,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  decoration: BoxDecoration(
                    color: ColorApp().color_white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  child: GoogleMap(
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    initialCameraPosition: _initialCameraPosition,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
