import 'package:fleming_expense_tracker/controllers/auth_controller.dart';
import 'package:fleming_expense_tracker/controllers/newtrip_controller.dart';
import 'package:fleming_expense_tracker/controllers/user_controller.dart';
// import 'package:fleming_expense_tracker/screens/4.new_trip/add_team_member.dart';
import 'package:fleming_expense_tracker/screens/4.new_trip/new_trip_widgets/add_team_member.dart';
import 'package:fleming_expense_tracker/screens/4.new_trip/new_trip_widgets/budget_row.dart';
import 'package:fleming_expense_tracker/screens/4.new_trip/new_trip_widgets/meta_info_row.dart';
import 'package:fleming_expense_tracker/screens/4.new_trip/new_trip_widgets/set_trip_currency.dart';
import 'package:fleming_expense_tracker/widgets/custom_raised_button.dart';
import 'package:fleming_expense_tracker/widgets/horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewTrip extends StatelessWidget {
  final NewtripController tripController = Get.put(NewtripController());
  final UserController user = Get.put(UserController());
  final AuthController auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    // print(auth.firestoreUser.value.uid);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            color: Colors.black,
            height: Get.height * 2.5,
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MetaInfoRow(trip: tripController),
                  HorizontalDivider(),
                  SetTripCurrency(trip: tripController),
                  HorizontalDivider(),
                  BuildNewTeamMemberButton(trip: tripController),
                  HorizontalDivider(),
                  BuildBudgetRow(trip: tripController),
                  Center(
                    child: CustomRaisedButtton(
                      onPressed: () => tripController
                          .addNewTrip(auth.firestoreUser.value.uid),
                      buttonText: "Create",
                      buttonColor: Colors.pink[50],
                      buttonTextColor: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
