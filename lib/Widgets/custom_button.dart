import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const CustomButton(
      {super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        margin: EdgeInsets.symmetric(horizontal: width * 0.06),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.08),
          color: const Color(0xff0E1013),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
