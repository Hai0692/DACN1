import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/bottom_bar.dart';
import '../common/color.dart';
import '../common/custom_appbar.dart';

class MyAppoinment extends StatefulWidget {
  final data;
  const MyAppoinment({super.key, this.data});

  @override
  State<MyAppoinment> createState() => _MyAppoinmentState();
}

class _MyAppoinmentState extends State<MyAppoinment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: " My Appoinment "),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Container(
            height: 130,
            padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
            margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
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
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                // child: Image.network(
                // "",
                //   fit: BoxFit.contain,
                //   width: 150,
                //   height: 120,
                // ),

                child: Image.asset(
                  "assets/images/doctor.png",
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      " Dr. Thanh xuan",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorApp().color_black),
                    ),
                    Text(
                      " void call -accept",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorApp().color_green),
                    ),
                    Text(
                      " 10h 30 ngay 29 thang 5",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorApp().color_black),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ]),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
