import 'package:flutter/material.dart';
import 'package:hrm/Widgets/custom_checkIn_time_card.dart';
import 'package:hrm/Widgets/custom_dashboard_attendance_card.dart';
import 'package:hrm/Widgets/custom_dashboard_option_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF1F3F4),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: width,
                  height: height * 0.27,
                  decoration: BoxDecoration(
                      color: Color(0xff0E1013),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(width * 0.05),
                        bottomRight: Radius.circular(width * 0.05),
                      )),
                  child: Image.asset(
                    'assets/images/Patterns.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: height * 0.02,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: Row(
                      children: [
                        Container(
                          height: height * 0.04,
                          width: width * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.02),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(width * 0.02),
                            child: Image.asset(
                              'assets/images/Profile Picture.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Marketing Officer,',
                              style: TextStyle(
                                color: Color(0xffCBCBCD),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Mike Cooper',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: height * 0.04,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(width * 0.05),
                          ),
                          child: Image.asset(
                            'assets/images/notification.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Todays overview Card
                Positioned(
                  top: height * 0.11,
                  width: width,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                    alignment: Alignment(0, 0),
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: height * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width * 0.05)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Today’s Overview',
                                  style: TextStyle(
                                    color: Color(0xffA5A5A9),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '24 September 2023',
                                  style: TextStyle(
                                    color: Color(0xff0B0B0B),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.more_horiz,
                              size: 18,
                              color: Color(0xff101010),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),

                        //check in check out times
                        CustomCheckinTimeCard(
                            checkinTime: "08.00 AM",
                            checkinStatus: "Done at 07.58 AM",
                            checkoutTime: "05.00 PM",
                            checkoutTimeStatus: "Not yet")
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.13,
            ),

            // All options in dashboard
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomDashboardOptionCard(
                        imagePath: "assets/images/payrole_icon.png",
                        cardText: "Payrole"),
                    CustomDashboardOptionCard(
                        imagePath: "assets/images/payslip.png",
                        cardText: "Payslip"),
                    CustomDashboardOptionCard(
                        imagePath: "assets/images/counselling_icon.png",
                        cardText: "Counselling"),
                    CustomDashboardOptionCard(
                        imagePath: "assets/images/payrole_icon.png",
                        cardText: "Time Off"),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomDashboardOptionCard(
                        imagePath: "assets/images/Calendar.png",
                        cardText: "Calendar"),
                    CustomDashboardOptionCard(
                        imagePath: "assets/images/payrole_icon.png",
                        cardText: "Overtime"),
                    CustomDashboardOptionCard(
                        imagePath: "assets/images/resign_icon.png",
                        cardText: "Resign"),
                    CustomDashboardOptionCard(
                        imagePath: "assets/images/Menu Dots.png",
                        cardText: "Others"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),

            //Attendance Tracking cards
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.01),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.05),
                      topRight: Radius.circular(width * 0.05),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Attendance Tracking',
                          style: TextStyle(
                            color: Color(0xff0B0B0B),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'View all',
                          style: TextStyle(
                            color: Color(0xff0B0B0B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: height * 0.015,
                    ),

                    //Attendance Cards
                    Expanded(
                      child: ListView(
                        children: const [
                          //Attendance Cards
                          CustomDashboardAttendanceCard(
                              imageUrl: "assets/images/Profile1.png",
                              employeeName: "Brigette Whopper",
                              timeText: "05.13 PM",
                              isCheckedIn: false,
                              employeePosition: "Marketing Officer"),

                          CustomDashboardAttendanceCard(
                              imageUrl: "assets/images/Profile1.png",
                              employeeName: "Johnny Deep",
                              timeText: "08.23 AM",
                              isCheckedIn: true,
                              employeePosition: "Marketing Officer"),

                          CustomDashboardAttendanceCard(
                              imageUrl: "assets/images/Profile1.png",
                              employeeName: "Brigette Whopper",
                              timeText: "05.13 PM",
                              isCheckedIn: false,
                              employeePosition: "Marketing Officer"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            //bottom carved navbar
          ],
        ),
      ),
    );
  }
}
