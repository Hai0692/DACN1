import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/common/color.dart';
import 'package:project/common/custom_appbar.dart';
import 'package:project/pages/set_appoinment.dart';

import '../common/bottom_bar.dart';

class DoctorProfile extends StatefulWidget {
  final data;
  const DoctorProfile({Key? key, this.data}) : super(key: key);
  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Doctor Profile"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    "https://4yourp.000webhostapp.com/images/${widget.data["info"]["avatar"]}",
                    fit: BoxFit.cover,
                    width: 130,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 28,
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
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Chardiologist",
                        style: GoogleFonts.poppins(
                            color: ColorApp().color_grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "7 year Expericence",
                        style: GoogleFonts.poppins(
                            color: ColorApp().color_grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 28,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "1km away",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: ColorApp().color_grey),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.locationDot,
                                color: Colors.green,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 28,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "28\$/hour",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: ColorApp().color_grey),
                              ),
                              FaIcon(
                                FontAwesomeIcons.dollarSign,
                                color: Colors.green,
                                size: 18,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
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
                Text(
                  "Assoc. Prof. Dr. BS Tran Quang Binh - Professional Director of Tam Anh General Hospital in Ho Chi Minh City is one of the leading experts in the field of Internal Medicine in Vietnam. ",
                  style: GoogleFonts.poppins(
                      fontSize: 14, color: ColorApp().color_grey),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                //margin: const EdgeInsets.only(top: 10),

                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 20),
                        blurRadius: 30,
                        color: ColorApp().color_green.withOpacity(0.3))
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    "assets/images/CV.png",
                    fit: BoxFit.cover,
                    width: 180,
                    height: 220,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetAppoinment(data: widget.data),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: HexColor("#0EBE7F")),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Book now",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
