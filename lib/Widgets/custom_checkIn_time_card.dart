import 'package:flutter/material.dart';

class CustomCheckinTimeCard extends StatelessWidget {
  String? checkinTime;
  String? checkinStatus;
  String? checkoutTime;
  String? checkoutTimeStatus;

  CustomCheckinTimeCard({
    super.key,
    required this.checkinTime,
    required this.checkinStatus,
    required this.checkoutTime,
    required this.checkoutTimeStatus,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      width: width,
      decoration: BoxDecoration(
          color: Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(width * 0.05)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //check in time
          Column(
            children: [
              const Text(
                'Check In',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff101010)),
              ),
              Text(
                checkinTime ?? "",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff101010)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: height * 0.035,
                width: width * 0.35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(width * 0.05)),
                child: Center(
                  child: Text(
                    checkinStatus ?? "",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff34C759)),
                  ),
                ),
              ),
            ],
          ),

          // checkout time
          Column(
            children: [
              const Text(
                'Check Out',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff101010)),
              ),
              Text(
                checkoutTime ?? "",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff101010)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: height * 0.035,
                width: width * 0.35,
                decoration: BoxDecoration(
                    color: Color(0xff101010),
                    borderRadius: BorderRadius.circular(width * 0.05)),
                child: Center(
                  child: Text(
                    checkoutTimeStatus ?? "",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
