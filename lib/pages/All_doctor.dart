import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/pages/set_appoinment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/bottom_bar.dart';
import '../common/color.dart';
import '../common/custom_appbar.dart';
import '../controllers/authentication.dart';
import '../controllers/doctor.dart';
import 'appoinment.dart';
import 'doctor_profile.dart';

class AllDoctor extends StatefulWidget {
  final data;
  const AllDoctor({super.key, this.data});

  @override
  State<AllDoctor> createState() => _AllDoctorState();
}

class _AllDoctorState extends State<AllDoctor> {
  final DoctorController _doctorController = Get.put(DoctorController());
  var user;
  var doctorData;
  String? tokenUser;

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    tokenUser = token;
    if (token.isNotEmpty && token != '') {
      final responseUser = await AuthenticationController().getUser(token);
      final responseDoctor = await DoctorController().getDoctor(token);
      if (responseUser != null) {
        setState(() {
          user = json.decode(responseUser);
          doctorData = json.decode(responseDoctor);
        });
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "All Doctor "),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(children: [
            for (int i = 0; i < 3; i++) ...[
              if (doctorData == null) ...{
                // handle null object
              } else ...{
                Container(
                  width: 330,
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorApp().color_white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            "https://4yourp.000webhostapp.com/images/${doctorData[i]["avatar"]}",
                            fit: BoxFit.contain,
                            width: 150,
                            height: 120,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                                child: Row(
                                  children: [
                                    Text(
                                      //  "${widget.data["info"]["user"]["name"]}",
                                      doctorData[i]["name"].toString(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ColorApp().color_black),
                                    ),
                                    // IconButton(
                                    //   onPressed: () {},
                                    //   icon: const FaIcon(
                                    //     FontAwesomeIcons.solidHeart,
                                    //     color: Colors.red,
                                    //     size: 16,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Text(
                                //   "${widget.data["info"]["specialty"]}",
                                doctorData[i]["specialty"].toString(),
                                style: GoogleFonts.poppins(
                                    color: ColorApp().color_grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: const <Widget>[
                                    FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color: Colors.orange,
                                      size: 12,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color: Colors.orange,
                                      size: 12,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color: Colors.orange,
                                      size: 12,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color: Colors.orange,
                                      size: 12,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color: Colors.grey,
                                      size: 12,
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: ColorApp().color_grey),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.dollarSign,
                                    color: Colors.green,
                                    size: 12,
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
                            onPressed: () async {
                              final doctorDetailResponse =
                                  await _doctorController.getDoctorDetail(
                                      tokenUser!,
                                      doctorData[i]["id"].toString());
                              var doctorDetail =
                                  jsonDecode(doctorDetailResponse);
                              // print(doctorDetail);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DoctorProfile(data: doctorDetail),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: HexColor("#0EBE7F")),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Profile",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              final doctorDetailResponse =
                                  await _doctorController.getDoctorDetail(
                                      tokenUser!,
                                      doctorData[i]["id"].toString());
                              var doctorDetail =
                                  jsonDecode(doctorDetailResponse);
                              // print(doctorDetail);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SetAppoinment(data: doctorDetail),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: HexColor("#0EBE7F")),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Book now",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              }
            ]
          ]),
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
