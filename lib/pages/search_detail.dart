import 'package:flutter/material.dart';
import 'package:project/common/color.dart';
import 'package:project/common/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/pages/home_page.dart';

import '../common/bottom_bar.dart';
import '../common/card_doctor.dart';
import '../common/card_find_doctor.dart';

class SearchDetail extends StatefulWidget {
  const SearchDetail({super.key});

  @override
  State<SearchDetail> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Eyes"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Top Doctor",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorApp().color_green),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(top: 10, right: 20, bottom: 20),
              child: Row(
                children: <Widget>[
                  CardDoctor(
                    image: "assets/images/doctor.png",
                    nameDoctor: "Dr.Graphn",
                    specialized: "Dental",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                  ),
                  CardDoctor(
                    image: "assets/images/doctor.png",
                    nameDoctor: "Dr.Graphn",
                    specialized: "Dental",
                    press: () {},
                  ),
                  CardDoctor(
                    image: "assets/images/doctor.png",
                    nameDoctor: "Dr.Graphn",
                    specialized: "Dental",
                    press: () {},
                  ),
                  CardDoctor(
                    image: "assets/images/doctor.png",
                    nameDoctor: "Dr.Graphn",
                    specialized: "Dental",
                    press: () {},
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Popular Doctor",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorApp().color_green),
            ),
          ),
          Column(
            children: <Widget>[
              CardFindDoctor(
                image: "assets/images/doctor.png",
                nameDoctor: "Dr.Skutie",
                specialized: "Tooths Dentics",
                experience: 7,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              CardFindDoctor(
                image: "assets/images/doctor.png",
                nameDoctor: "Dr.Skutie",
                specialized: "Tooths Dentics",
                experience: 8,
                press: () {},
              ),
              CardFindDoctor(
                image: "assets/images/doctor.png",
                nameDoctor: "Dr.Skutie",
                specialized: "Tooths Dentics",
                experience: 7,
                press: () {},
              ),
              CardFindDoctor(
                image: "assets/images/doctor.png",
                nameDoctor: "Dr.Skutie",
                specialized: "Tooths Dentics",
                experience: 7,
                press: () {},
              ),
              CardFindDoctor(
                image: "assets/images/doctor.png",
                nameDoctor: "Dr.Skutie",
                specialized: "Tooths Dentics",
                experience: 7,
                press: () {},
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
