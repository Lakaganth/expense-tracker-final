import 'package:fleming_expense_tracker/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRaisedButtton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color buttonTextColor;
  final String buttonText;

  CustomRaisedButtton({
    @required this.onPressed,
    this.buttonColor = Colors.black,
    @required this.buttonText,
    this.buttonTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 151.0,
      height: 60.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            offset: Offset(2, 5),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: RaisedButton(
          onPressed: onPressed,
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            buttonText,
            style: GoogleFonts.roboto(
              color: buttonTextColor,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
