import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF1F3F4),
        body: Column(
          children: [
            // Profile image part
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
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: height * 0.11,
                                width: width * 0.25,
                                decoration: BoxDecoration(
                                  color: Color(0xffB8DFF2),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.2),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.08),
                                  child: Image.asset(
                                    "assets/images/Profile Picture.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: height * 0.07,
                                left: width * 0.18,
                                child: InkWell(
                                  onTap: () {
                                    //Add profile picture select functionality
                                  },
                                  child: Container(
                                      height: height * 0.039,
                                      width: width * 0.08,
                                      decoration: BoxDecoration(
                                          color: Color(0xffFFEBEA),
                                          borderRadius: BorderRadius.circular(
                                              width * 0.1)),
                                      child: Image.asset(
                                          'assets/images/Camera.png')),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),

                          //Employee name
                          Text('Mike Cooper',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),

                          SizedBox(
                            height: height * 0.01,
                          ),

                          //Employee Designation and address
                          Text('Marketing Officer . DE3824-MO4',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)),

                          SizedBox(
                            height: height * 0.01,
                          ),

                          //Employee Designation and address
                          Text('At Tricks. since 2021',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
