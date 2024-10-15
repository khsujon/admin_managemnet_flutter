import 'package:flutter/material.dart';

class CustomAdminLoginButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const CustomAdminLoginButton(
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
          color: const Color(0xffDADCE0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.link_outlined,
                size: 24,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                buttonText,
                style: const TextStyle(
                    color: Color(0xff0E1013),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
