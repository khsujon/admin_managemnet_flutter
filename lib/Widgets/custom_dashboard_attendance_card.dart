import 'package:flutter/material.dart';

class CustomDashboardAttendanceCard extends StatefulWidget {
  final String imageUrl;
  final String employeeName;
  final String employeePosition;
  final String timeText;
  final bool isCheckedIn;
  const CustomDashboardAttendanceCard(
      {super.key,
      required this.imageUrl,
      required this.employeeName,
      required this.timeText,
      required this.isCheckedIn,
      required this.employeePosition});

  @override
  State<CustomDashboardAttendanceCard> createState() =>
      _CustomDashboardAttendanceCardState();
}

class _CustomDashboardAttendanceCardState
    extends State<CustomDashboardAttendanceCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: height * 0.05,
                  width: width * 0.11,
                  decoration: BoxDecoration(
                    color: Color(0xffB8DFF2),
                    borderRadius: BorderRadius.circular(width * 0.08),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(width * 0.08),
                    child: Image.asset(
                      widget.imageUrl,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.025,
                  left: width * 0.06,
                  child: Container(
                    height: height * 0.03,
                    width: width * 0.065,
                    decoration: BoxDecoration(
                        color: widget.isCheckedIn
                            ? Color(0xffEBF9EE)
                            : Color(0xffFFEBEA),
                        borderRadius: BorderRadius.circular(width * 0.1)),
                    child: widget.isCheckedIn
                        ? Image.asset('assets/images/Login.png')
                        : Image.asset('assets/images/Logout.png'),
                  ),
                )
              ],
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.employeeName,
                  style: TextStyle(
                    color: Color(0xff0B0B0B),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.employeePosition,
                  style: TextStyle(
                    color: Color(0xffCBCBCD),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              height: height * 0.045,
              decoration: BoxDecoration(
                color:
                    widget.isCheckedIn ? Color(0xffFFEBEA) : Color(0xffEBF9EE),
                borderRadius: BorderRadius.circular(width * 0.02),
              ),
              child: Center(
                child: Text(
                  widget.timeText,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: widget.isCheckedIn
                          ? Color(0xffFF3B30)
                          : Color(0xff34C759)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          child: Divider(
            color: Color(0xffF4F4F4),
            height: 1,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
