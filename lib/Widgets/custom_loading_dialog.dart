import 'package:flutter/material.dart';

class CustomLoadingDialog extends StatelessWidget {
  final double width;
  final String loadingText;
  const CustomLoadingDialog(
      {super.key, required this.width, required this.loadingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Set custom width
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 50, // Desired width
            height: 50, // Desired height
            child: CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 4,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            loadingText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff1A1A1A),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Please wait a second!',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff6A6A6A),
            ),
          ),
        ],
      ),
    );
  }
}
