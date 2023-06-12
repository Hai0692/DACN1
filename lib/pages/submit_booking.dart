import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:project/common/color.dart';
import 'package:project/pages/myappoinment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/bottom_bar.dart';
import '../common/custom_appbar.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/authentication.dart';
import '../controllers/booking.dart';

class BookingRequest extends StatefulWidget {
  final data;
  final time;
  final date;

  const BookingRequest({Key? key, this.data, this.time, this.date})
      : super(key: key);
  @override
  State<BookingRequest> createState() => _BookingRequestState();
}

class _BookingRequestState extends State<BookingRequest> {
  TextEditingController addressController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController medicalHistoryExpController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  final BookingController _bookingController = Get.put(BookingController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  File? image;
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  late String tokenUser;
  var user;
  var userId;

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    tokenUser = token;
    final responseUser = await AuthenticationController().getUser(token);
    if (responseUser != null) {
      setState(() {
        user = json.decode(responseUser);
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
    } else {
      userId = user["user_id"];
    }

    String date = DateFormat("yyyy-MM-dd").format(widget.date);
    TimeOfDay time = widget.time;
    dateController.text = date;
    timeController.text = "${time.hour}:${time.minute}";
    return Scaffold(
      appBar: const CustomAppBar(title: "Booking Request"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            imageProfile(),
            Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: FaIcon(
                            FontAwesomeIcons.pen,
                            color: ColorApp().color_grey,
                            size: 18,
                          ),
                        ),
                        labelText: "Address",
                        labelStyle: GoogleFonts.poppins(
                          color: ColorApp().color_green,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        hintText: "",
                        hintStyle: GoogleFonts.poppins(
                          color: ColorApp().color_black,
                          fontSize: 16,
                        ),
                      ),
                      keyboardType: TextInputType.text),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TextFormField(
                      controller: birthdayController,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: FaIcon(
                            FontAwesomeIcons.pen,
                            color: ColorApp().color_grey,
                            size: 18,
                          ),
                        ),
                        labelText: "Birthday",
                        labelStyle: GoogleFonts.poppins(
                          color: ColorApp().color_green,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        hintText: "",
                        hintStyle: GoogleFonts.poppins(
                          color: ColorApp().color_black,
                          fontSize: 16,
                        ),
                      ),
                      keyboardType: TextInputType.text),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TextFormField(
                      controller: genderController,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: FaIcon(
                            FontAwesomeIcons.pen,
                            color: ColorApp().color_grey,
                            size: 18,
                          ),
                        ),
                        labelText: "Gender",
                        labelStyle: GoogleFonts.poppins(
                          color: ColorApp().color_green,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        hintText: "",
                        hintStyle: GoogleFonts.poppins(
                          color: ColorApp().color_black,
                          fontSize: 16,
                        ),
                      ),
                      keyboardType: TextInputType.text),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TextFormField(
                      controller: medicalHistoryExpController,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: FaIcon(
                            FontAwesomeIcons.pen,
                            color: ColorApp().color_grey,
                            size: 18,
                          ),
                        ),
                        labelText: "Medical History",
                        labelStyle: GoogleFonts.poppins(
                          color: ColorApp().color_green,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        hintText: "",
                        hintStyle: GoogleFonts.poppins(
                          color: ColorApp().color_black,
                          fontSize: 16,
                        ),
                      ),
                      keyboardType: TextInputType.text),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: FaIcon(
                          FontAwesomeIcons.pen,
                          color: ColorApp().color_grey,
                          size: 18,
                        ),
                      ),
                      labelText: "Date",
                      labelStyle: GoogleFonts.poppins(
                        color: ColorApp().color_green,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      hintText: "",
                      hintStyle: GoogleFonts.poppins(
                        color: ColorApp().color_black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TextFormField(
                    controller: timeController,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: FaIcon(
                          FontAwesomeIcons.pen,
                          color: ColorApp().color_grey,
                          size: 18,
                        ),
                      ),
                      labelText: "Time",
                      labelStyle: GoogleFonts.poppins(
                        color: ColorApp().color_green,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      hintText: "",
                      hintStyle: GoogleFonts.poppins(
                        color: ColorApp().color_black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      print(tokenUser);
                      print(widget.data["info"]["id"]);
                      print(image);
                      print(addressController.text);
                      print(birthdayController.text);
                      print(genderController.text);
                      print(medicalHistoryExpController.text);
                      print(dateController.text);
                      print(timeController.text);
                      await _bookingController.booking(
                          token: tokenUser,
                          id: widget.data["info"]["id"],
                          image: image,
                          user_id: userId,
                          address: addressController.text,
                          birthday: birthdayController.text,
                          gender: genderController.text,
                          medicalHistory:
                              medicalHistoryExpController.text.trim(),
                          // bookingDate: dateController.text,
                          bookingTime: timeController.text.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                         /// builder: (context) => ResultBooking(),
                             builder: (context) => MyAppoinment(data: widget.data),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: HexColor("#0EBE7F")),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Submit",
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
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 70.0,
          backgroundImage: _imageFile == null
              ? const AssetImage("assets/images/doctor.png") as ImageProvider
              : FileImage(File(_imageFile!.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: ColorApp().color_grey,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera, size: 20, color: ColorApp().color_grey),
              onPressed: () {
                takePhoto(
                  ImageSource.camera,
                );
              },
              label: Text("Camera",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: ColorApp().color_green,
                      fontWeight: FontWeight.w500)),
            ),
            TextButton.icon(
              icon: Icon(Icons.image, size: 20, color: ColorApp().color_grey),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: ColorApp().color_green,
                      fontWeight: FontWeight.w500)),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
      image = File(pickedFile!.path);
    });
  }
}

class AddInfor extends StatelessWidget {
  const AddInfor({
    super.key,
    required this.label,
    required this.hint,
  });

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 13),
              child: FaIcon(
                FontAwesomeIcons.pen,
                color: ColorApp().color_grey,
                size: 18,
              ),
            ),
            labelText: label,
            labelStyle: GoogleFonts.poppins(
              color: ColorApp().color_green,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: ColorApp().color_black,
              fontSize: 16,
            ),
          ),
          keyboardType: TextInputType.text),
    );
  }
}
