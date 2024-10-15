import 'package:flutter/material.dart';

class CustomDashboardOptionCard extends StatelessWidget {
  final String imagePath;
  final String cardText;
  const CustomDashboardOptionCard(
      {super.key, required this.imagePath, required this.cardText});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: height * 0.055,
          width: width * 0.12,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(width * 0.03),
          ),
          child: Center(
            child: Image.asset(imagePath),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          cardText,
          style: TextStyle(
              color: Color(0xff0B0B0B),
              fontWeight: FontWeight.w700,
              fontSize: 14),
        )
      ],
    );
  }
}
