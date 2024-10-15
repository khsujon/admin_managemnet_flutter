import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  final Icon prefixIcon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscure,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure; // Initialize with the passed obscure value
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(width * 0.03),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(width * 0.03),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: Color(0xffBDC1C6),
              fontSize: 16,
              fontWeight: FontWeight.w400),

          // Eye icon here
          suffixIcon: widget.obscure
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xffBDC1C6),
                  ),
                  onPressed: () {
                    // Toggle password visibility
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,

          //prefix Icon
          prefixIcon: Icon(
            widget.prefixIcon.icon, // Get the icon from the passed Icon widget
            color: Color(0xffBDC1C6), // Set the desired color
            size: 24, // Set the desired size
          ),
        ),
      ),
    );
  }
}
