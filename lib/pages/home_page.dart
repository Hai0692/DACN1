import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/common/bottom_bar.dart';
import 'package:project/common/color.dart';
import 'package:project/controllers/doctor.dart';
import 'package:project/pages/All_doctor.dart';
import 'package:project/pages/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/card_doctor.dart';
import '../controllers/authentication.dart';
import 'appoinment.dart';
import 'doctor_request.dart';
import 'dart:developer';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
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
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: ColorApp().color_green,
        //   leading: IconButton(
        //    onPressed: () {

        //   },
        //  icon: const Icon(Icons.menu),
        // color: Colors.white,
        // ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 7),
          child: Text.rich(
            TextSpan(
                text: 'Welcome\n ',
                style: GoogleFonts.lobster(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                children: <InlineSpan>[
                  if (user == null) ...{
                    // handle null object
                  } else ...{
                    // access object index
                    TextSpan(
                        text: user["user"]["name"].toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontStyle: FontStyle.normal))
                  }
                ]),
          ),
        ),
        actions: [
          Container(
              padding: const EdgeInsets.only(right: 15),
              child: Image.asset("assets/images/logo.png")),
        ],
      ),
      drawer: Drawer(
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 150,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorApp().color_green,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 10),
                  child: Row(
                    children: [
                      if (user == null) ...{
                        // handle null object
                      } else ...{
                        Text.rich(
                          TextSpan(
                              text: user["user"]["name"].toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: ColorApp().color_white),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '\n',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: user["user"]["phone"].toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ]),
                        ),
                      },
                      const Spacer(),
                      Image.asset("assets/images/logo.png"),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.solidUser, size: 18),
              title: Text("My doctor",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DoctorRequest()));
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.notesMedical, size: 18),
              title: Text("Medican records",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.creditCard, size: 18),
              title: Text("Payment",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.calendarDays, size: 18),
              title: Text("Booking",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.check, size: 18),
              title: Text("Tips Heathy",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: ListTile(
                leading:
                    const FaIcon(FontAwesomeIcons.rightFromBracket, size: 18),
                title: Text("Log out",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
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
                        builder: (context) => const SearchPage()));
                  },
                ),
                // SvgPicture.asset("assets/icons/search.svg"),
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
          TitleMore(title: "Category", press: () {}),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(top: 10, right: 20, bottom: 20),
              child: Row(
                children: [
                  CategoryCard(
                      image: "assets/icons/overview.svg",
                      title: "Overview",
                      color: "#BE0E62",
                      press: () {}),
                  CategoryCard(
                      image: "assets/icons/heart.svg",
                      title: "Heart",
                      color: "#2753F3",
                      press: () {}),
                  CategoryCard(
                      image: "assets/icons/dental.svg",
                      title: "dental",
                      color: "#0EBE7E",
                      press: () {}),
                  CategoryCard(
                      image: "assets/icons/body.svg",
                      title: "Body",
                      color: "#9B0EBE",
                      press: () {}),
                  CategoryCard(
                      image: "assets/icons/eyes.svg",
                      title: "Eyes",
                      color: "#FE8043",
                      press: () {}),
                  CategoryCard(
                      image: "assets/icons/sugeon.svg",
                      title: "Sugeon",
                      color: "#B19C32",
                      press: () {}),
                  CategoryCard(
                      image: "assets/icons/skin.svg",
                      title: "Skin",
                      color: "#FF4F50",
                      press: () {}),
                ],
              ),
            ),
          ),
          TitleMore(
              title: "Popular Doctor",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllDoctor(),
                  ),
                );
              }),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(top: 10, right: 20, bottom: 20),
              child: Row(children: <Widget>[
                for (int i = 0; i < 3; i++) ...[
                  if (doctorData == null) ...{
                    // handle null object
                  } else ...{
                    CardDoctor(
                      image:
                          "https://4yourp.000webhostapp.com/images/${doctorData[i]["avatar"]}",
                      nameDoctor: doctorData[i]["name"].toString(),
                      specialized: doctorData[i]["specialty"].toString(),
                      press: () async {
                        final doctorDetailResponse =
                            await _doctorController.getDoctorDetail(
                                tokenUser!, doctorData[i]["id"].toString());
                        var doctorDetail = jsonDecode(doctorDetailResponse);
                        // print(doctorDetail);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Appoinment(data: doctorDetail),
                          ),
                        );
                      },
                    ),
                  }
                ]
              ]),
            ),
          ),
          TitleMore(title: "Feature Doctor", press: () {}),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(top: 10, right: 20, bottom: 20),
              child: Row(
                children: <Widget>[
                  for (int i = 0; i < 3; i++) ...[
                    if (doctorData == null) ...{
                      // handle null object
                    } else ...{
                      CardFeature(
                        image:
                            "https://4yourp.000webhostapp.com/images/${doctorData[i]["avatar"]}",
                        price: "25/hour",
                        rating: "4",
                        nameDoctor: doctorData[i]["name"].toString(),
                        press: () async {
                          final doctorDetailResponse =
                              await _doctorController.getDoctorDetail(
                                  tokenUser!, doctorData[i]["id"].toString());
                          var doctorDetail = jsonDecode(doctorDetailResponse);
                          // print(doctorDetail);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Appoinment(data: doctorDetail),
                            ),
                          );
                        },
                      ),
                    }
                  ]

                  //     image:
                  //         "https://4yourp.000webhostapp.com/images/${doctorData[3]["avatar"]}",
                  //     price: "25/hour",
                  //     rating: "4,5",
                  //     nameDoctor: doctorData[3]["name"].toString(),
                  //     press: () async {
                  //       final doctorDetailResponse =
                  //           await _doctorController.getDoctorDetail(
                  //               tokenUser!, doctorData[3]["id"].toString());
                  //       var doctorDetail = jsonDecode(doctorDetailResponse);
                  //       // print(doctorDetail);
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => Appoinment(data: doctorDetail),
                  //         ),
                  //       );
                  //     },
                  //   ),
                ],
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}

class CardFeature extends StatelessWidget {
  const CardFeature({
    super.key,
    required this.image,
    required this.price,
    required this.nameDoctor,
    required this.rating,
    this.press,
  });

  final String image;
  final String price;
  final String nameDoctor;
  final String rating;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.all(5),
          width: 120,
          decoration: BoxDecoration(
              color: ColorApp().color_white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 20,
                  color: Colors.green.withOpacity(0.2),
                )
              ]),
          child: Column(children: [
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.heart,
                  size: 15,
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  size: 22,
                  color: Colors.red,
                ),
                Text(
                  rating,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 5),
            ClipOval(
              child: Image.network(
                image,
                width: 70,
                height: 70,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              nameDoctor,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              "\$$price",
              style:
                  GoogleFonts.poppins(fontSize: 14, color: HexColor("#677294")),
            ),
          ]),
        ));
  }
}

class TitleMore extends StatelessWidget {
  const TitleMore({
    super.key,
    required this.title,
    this.press,
  });

  final String title;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Expanded(
            child: Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        )),
        GestureDetector(onTap: press, child: const Text("see all")),
        const Icon(Icons.arrow_right)
      ]),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.press,
    required this.color,
  });

  final String image;
  final String title;
  final void Function()? press;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      // width: size.width * 0.2,
      // height: size.height * 0.4,
      child: GestureDetector(
        onTap: press,
        child: Column(
          children: [
            Container(
              width: 80,
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: HexColor(color),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 20,
                        color: Colors.green.withOpacity(0.2))
                  ]),
              child: Container(child: SvgPicture.asset(image)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
