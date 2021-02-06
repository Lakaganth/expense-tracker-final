import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingContent extends StatelessWidget {
  final String image, content;
  OnboardingContent({@required this.content, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          content,
          style: GoogleFonts.righteous(
            color: Colors.black54,
            fontSize: 25.0,
          ),
        ),
        Spacer(flex: 1),
        Image.asset(
          image,
        )
      ],
    );
  }
}
