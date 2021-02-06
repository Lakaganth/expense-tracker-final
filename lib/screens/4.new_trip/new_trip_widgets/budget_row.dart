import 'package:fleming_expense_tracker/controllers/newtrip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildBudgetRow extends StatelessWidget {
  final NewtripController trip;
  BuildBudgetRow({@required this.trip});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          BuildRow(
            budgetName: "Travel",
            budgetImagePath: 'assets/images/travel_budget.png',
            inputController: trip.travelBudgetController,
            trip: trip,
            onEditComplete: () => trip.setTravelBudget(
                double.parse(trip.travelBudgetController.text)),
          ),
          SizedBox(
            height: 30.0,
          ),
          BuildRow(
            trip: trip,
            budgetName: "Food",
            budgetImagePath: 'assets/images/food_budget.png',
            inputController: trip.foodBudgetController,
            onEditComplete: () => trip
                .setFoodBudget(double.parse(trip.foodBudgetController.text)),
          ),
          SizedBox(
            height: 30.0,
          ),
          BuildRow(
            trip: trip,
            budgetName: "Project",
            budgetImagePath: 'assets/images/project_budget.png',
            inputController: trip.projBudgetController,
            onEditComplete: () => trip
                .setProjectBudget(double.parse(trip.projBudgetController.text)),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset('assets/images/total_budget.png'),
              Text(
                "Total",
                style: GoogleFonts.quicksand(
                  color: Color(0xFFD2CAE2),
                  fontSize: 25.0,
                ),
              ),
              Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: Obx(() => Center(
                        child: Text(
                          trip.totalBudget.toString(),
                          style: GoogleFonts.quicksand(
                            color: Color(0xFFD2CAE2),
                            fontSize: 25.0,
                          ),
                        ),
                      ))),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
        ]);
  }
}

class BuildRow extends StatelessWidget {
  const BuildRow({
    Key key,
    @required this.trip,
    @required this.budgetName,
    @required this.budgetImagePath,
    this.onEditComplete,
    this.inputController,
  }) : super(key: key);
  final NewtripController trip;
  final String budgetName;
  final String budgetImagePath;
  final TextEditingController inputController;
  final onEditComplete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Image.asset(budgetImagePath),
        Text(
          budgetName,
          style: GoogleFonts.quicksand(
            color: Color(0xFFD2CAE2),
            fontSize: 25.0,
          ),
        ),
        Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
            ),
            child: Center(
              child: TextField(
                controller: inputController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  disabledBorder: InputBorder.none,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                  enabledBorder: InputBorder.none,
                ),
                style: GoogleFonts.quicksand(),
                textAlign: TextAlign.center,
                onChanged: (val) => onEditComplete(),
              ),
            )),
      ],
    );
  }
}

class BuildFormHeader extends StatelessWidget {
  final String header;
  final Color headerColor;

  BuildFormHeader({@required this.header, @required this.headerColor});
  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: GoogleFonts.quicksand(
        color: headerColor,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
