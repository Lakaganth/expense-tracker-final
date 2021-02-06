import 'package:fleming_expense_tracker/constants/constants.dart';
import 'package:fleming_expense_tracker/controllers/auth_controller.dart';
import 'package:fleming_expense_tracker/model/sidebar_model.dart';
// import 'package:fleming_expense_tracker/screens/4.new_trip/add_new_trip.dart';
import 'package:fleming_expense_tracker/screens/4.new_trip/create_new_trip.dart';
import 'package:fleming_expense_tracker/screens/5.currency_converter/currency_converter_screen.dart';
import 'package:fleming_expense_tracker/widgets/custom_raised_button.dart';
import 'package:fleming_expense_tracker/widgets/sidebar_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarScreen extends StatelessWidget {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.0),
        ),
      ),
      height: Get.height,
      width: Get.width * .85,
      padding: EdgeInsets.symmetric(
        vertical: 35.0,
        horizontal: 20.0,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  //TODO : User Profile insert
                  backgroundImage:
                      AssetImage('assets/images/default_avatar.png'),
                  radius: 29.0,
                ),
                SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO : Insert User name
                    Text(
                      authController.firestoreUser.value.name.capitalizeFirst,
                      style: GoogleFonts.robotoMono(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    //TODO Insert Department
                    Text("Wireless program",
                        style: GoogleFonts.robotoMono(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ))
                  ],
                )
              ],
            ),
            SizedBox(
              height: Get.height * .08,
            ),
            SidebarRow(item: sidebarItem[0]),
            SizedBox(
              height: 32.0,
            ),
            FlatButton(
                onPressed: () {
                  Get.to(CreateNewTrip());
                },
                child: SidebarRow(item: sidebarItem[1])),
            SizedBox(
              height: 32.0,
            ),
            FlatButton(
                onPressed: () {
                  Get.to(CurrencyConverterScreen());
                },
                child: SidebarRow(item: sidebarItem[2])),
            SizedBox(
              height: 32.0,
            ),
            Spacer(),
            FlatButton(
              child: SidebarRow(item: sidebarItem[3]),
              onPressed: authController.signOut,
            ),
          ],
        ),
      ),
    );
  }
}
