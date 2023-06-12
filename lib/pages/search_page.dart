import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/pages/search_detail.dart';
import '../common/bottom_bar.dart';
import '../common/card_find_doctor.dart';
import '../common/color.dart';
import '../common/custom_appbar.dart';
import 'home_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchPage> {
  static const LatLng source = LatLng(45.521563, -122.677433);
  static const _initialCameraPosition =
      CameraPosition(target: source, zoom: 14.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Find Doctor"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                  color: ColorApp().color_white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: ColorApp().color_grey.withOpacity(0.3),
                      spreadRadius: 7,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Row(
                children: [
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: ColorApp().color_grey,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(
                            color: ColorApp().color_grey.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/action_x.svg"),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ItemSelected(
                  text: "All",
                  colorText: "#FFFFFF",
                  background: "#0EBE7E",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchDetail(),
                      ),
                    );
                  },
                ),
                ItemSelected(
                  text: "Eyes",
                  colorText: "#0EBE7E",
                  background: "#DADADA",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchDetail(),
                      ),
                    );
                  },
                ),
                ItemSelected(
                    text: "Skin",
                    colorText: "#0EBE7E",
                    background: "#DADADA",
                    press: () {}),
                ItemSelected(
                    text: "Heart",
                    colorText: "#0EBE7E",
                    background: "#DADADA",
                    press: () {}),
                ItemSelected(
                    text: "Eyes",
                    colorText: "#0EBE7E",
                    background: "#DADADA",
                    press: () {}),
                ItemSelected(
                    text: "Body",
                    colorText: "#0EBE7E",
                    background: "#DADADA",
                    press: () {}),
                ItemSelected(
                    text: "Dental",
                    colorText: "#0EBE7E",
                    background: "#DADADA",
                    press: () {})
              ],
            ),
            Container(
              height: 200,
              width: 400,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                color: ColorApp().color_white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
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
            Column(
              children:  <Widget>[
                CardFindDoctor(
                  image: "assets/images/doctor.png",
                  nameDoctor: "Dr.Skutie",
                  specialized: "Tooths Dentics",
                  experience: 7,     press: () {
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
                    experience: 8),
                CardFindDoctor(
                    image: "assets/images/doctor.png",
                    nameDoctor: "Dr.Skutie",
                    specialized: "Tooths Dentics",
                    experience: 7),
                CardFindDoctor(
                    image: "assets/images/doctor.png",
                    nameDoctor: "Dr.Skutie",
                    specialized: "Tooths Dentics",
                    experience: 7),
                CardFindDoctor(
                    image: "assets/images/doctor.png",
                    nameDoctor: "Dr.Skutie",
                    specialized: "Tooths Dentics",
                    experience: 7),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}

class ItemSelected extends StatelessWidget {
  ItemSelected({
    super.key,
    required this.text,
    required this.colorText,
    required this.background,
    required this.press,
  });
  final String text;
  final String colorText;
  final String background;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 85,
      height: 40,
      decoration: BoxDecoration(
        color: HexColor(background),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: GestureDetector(
        onTap: press,
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.poppins(
              color: HexColor(colorText),
              fontWeight: FontWeight.w500,
              fontSize: 16),
        )),
      ),
    );
  }
}
