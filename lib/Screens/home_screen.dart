import 'package:flutter/material.dart';
import 'package:hrm/Screens/activity_screen.dart';
import 'package:hrm/Screens/analytic_screen.dart';
import 'package:hrm/Screens/dashboard_screen.dart';
import 'package:hrm/Screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;

  final List<Widget> screens = [
    DashboardScreen(),
    AnalyticScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashboardScreen();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF1F3F4),
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.black,
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(
          Icons.qr_code_scanner,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = DashboardScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab == 0
                              ? Icons.home_filled
                              : Icons.home_outlined,
                          color: currentTab == 0
                              ? Colors.black
                              : Color(0xffBDC1C6),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? Colors.black
                                  : Color(0xffBDC1C6),
                              fontWeight: currentTab == 0
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = AnalyticScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            currentTab == 1
                                ? Icons.pie_chart
                                : Icons.pie_chart_outline,
                            color: currentTab == 1
                                ? Colors.black
                                : Color(0xffBDC1C6)),
                        Text(
                          'Analytic',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Colors.black
                                  : Color(0xffBDC1C6),
                              fontWeight: currentTab == 1
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              fontSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Text(
                  'Attend',
                  style: TextStyle(
                      color: Color(
                        0xffA5A5A9,
                      ),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ActivityScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            currentTab == 2
                                ? Icons.hourglass_full
                                : Icons.hourglass_empty,
                            color: currentTab == 2
                                ? Colors.black
                                : Color(0xffBDC1C6)),
                        Text(
                          'Activity',
                          style: TextStyle(
                              color: currentTab == 2
                                  ? Colors.black
                                  : Color(0xffBDC1C6),
                              fontWeight: currentTab == 2
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfileScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            currentTab == 3
                                ? Icons.person
                                : Icons.person_outline,
                            color: currentTab == 3
                                ? Colors.black
                                : Color(0xffBDC1C6)),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: currentTab == 3
                                  ? Colors.black
                                  : Color(0xffBDC1C6),
                              fontWeight: currentTab == 3
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              fontSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
