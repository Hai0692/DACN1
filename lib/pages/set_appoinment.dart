import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/common/bottom_bar.dart';
import 'package:project/common/custom_appbar.dart';
import 'package:project/pages/submit_booking.dart';
import 'package:table_calendar/table_calendar.dart';

import '../common/color.dart';

class SetAppoinment extends StatefulWidget {
  final data;
  const SetAppoinment({Key? key, this.data}) : super(key: key);

  @override
  State<SetAppoinment> createState() => _SetAppoinmentState();
}

class _SetAppoinmentState extends State<SetAppoinment> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
    showDatePicker(
      context: context,
      firstDate: DateTime.now(), // đặt giới hạn chọn từ ngày hiện tại
      lastDate:
          DateTime(2024, 12, 31), // đặt giới hạn chọn tối đa là ngày 31/12/2022
      initialDate: DateTime.now(), // đặt giá trị mặc định là ngày hiện tại
    );
  }

  TimeOfDay time =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return Scaffold(
      appBar: const CustomAppBar(title: "Set Appoinment"),
      body: SingleChildScrollView(
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
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                          const FaIcon(
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
          ),
          //  Text("selected day = "+today.toString().split(" ")[0]),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              decoration: BoxDecoration(
                color: ColorApp().color_green.withAlpha(40),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TableCalendar(
                locale: "en_US",
                rowHeight: 43,
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2050, 3, 14),
                onDaySelected: _onDaySelected,
              )),

          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [
                Text(
                  "Select Time",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorApp().color_green),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: Text(
                    "$hour : $minute",
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? newTime = await showTimePicker(
                        context: context, initialTime: time);
                    if (newTime == null) return;
                    setState(() {
                      time = newTime;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: HexColor("#0EBE7F")),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Select Time",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingRequest(
                      data: widget.data,
                      time: time,
                      date: today,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: HexColor("#0EBE7F")),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Submit",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ]),
        ]),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
