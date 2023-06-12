import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/common/color.dart';

class CardFindDoctor extends StatelessWidget {
  const CardFindDoctor({
    super.key,
    required this.image,
    required this.nameDoctor,
    required this.specialized,
    required this.experience, 
    this.press,
  });
  final String image;
  final String nameDoctor;
  final String specialized;
  final int experience;
  final void Function()? press;


  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 110,
                    height: 120,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Next Available",
                  style: GoogleFonts.poppins(
                      color: ColorApp().color_green,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text.rich(
                  TextSpan(
                      text: '10:00 ',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <InlineSpan>[
                        TextSpan(
                            text: 'AM Tomorrow',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ))
                      ]),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      nameDoctor,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  specialized,
                  style: GoogleFonts.poppins(
                      color: ColorApp().color_green,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 3),
                Text(
                  "$experience year experience",
                  style: GoogleFonts.poppins(
                    color: ColorApp().color_grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorApp().color_green),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "69 partiens ",
                        style: GoogleFonts.poppins(
                          color: ColorApp().color_grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: HexColor("#0EBE7F")),
                    child: Text(
                      "Book Now",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
