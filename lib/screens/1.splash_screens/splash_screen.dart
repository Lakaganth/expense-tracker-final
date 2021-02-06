import 'package:fleming_expense_tracker/constants/constants.dart';
import 'package:fleming_expense_tracker/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kSplashScreenBG,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Center(
                child: Text(
                  'FLEMING \nCOLLEGE',
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Center(
                child: Text(
                  "Expense Tracker",
                  style: GoogleFonts.roboto(
                    color: Colors.white70,
                    fontSize: 35.0,
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Center(
                child: CustomRaisedButtton(
                  buttonText: 'OPEN',
                  onPressed: null,
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
