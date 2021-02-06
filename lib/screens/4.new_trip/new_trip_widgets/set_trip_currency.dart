import 'package:currency_pickers/currency_pickers.dart';
import 'package:fleming_expense_tracker/controllers/currency_controller.dart';
import 'package:fleming_expense_tracker/controllers/newtrip_controller.dart';
import 'package:flutter/material.dart';
import 'package:fleming_expense_tracker/constants/constants.dart';
import 'package:get/get.dart';
import 'package:currency_pickers/country.dart';
import 'package:google_fonts/google_fonts.dart';

class SetTripCurrency extends StatelessWidget {
  final CurrencyController currency = Get.put(CurrencyController());

  final NewtripController trip;

  SetTripCurrency({@required this.trip});

  checkCurrentRate() {
    currency.checkCurrentRates(trip.homeCurrency, trip.destCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Home \nCurrency",
                  style: kNewTripFormLabelGreen,
                ),
                _buildHomeCurrencyPicker(context),
              ]),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Destination \nCurrency",
                style: kNewTripFormLabelGreen,
              ),
              _buildDestCurrencyPicker(context),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: FlatButton(
                onPressed: checkCurrentRate,
                child: Text(
                  "Check Current Rate",
                  style: GoogleFonts.quicksand(
                    color: Colors.blue,
                    fontSize: 24.0,
                  ),
                )),
          ),
          SizedBox(
            height: 30.0,
          ),
          Obx(() => currency.currentRate.value == 0.0
              ? Text("")
              : Text(
                  currency.currentRate.value.toString(),
                  style: GoogleFonts.quicksand(
                    color: Colors.blue,
                    fontSize: 24.0,
                  ),
                ))
        ]);
  }

  Padding _buildHomeCurrencyPicker(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width / 2.5,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: GestureDetector(
              onTap: () => _openCurrencyPickerDialog(context, "Home"),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(trip.homeCurrency.value),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildDestCurrencyPicker(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width / 2.5,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: GestureDetector(
              onTap: () => _openCurrencyPickerDialog(context, ""),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(trip.destCurrency.value),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  void _openCurrencyPickerDialog(BuildContext context, String selectcurrency) {
    showDialog(
        context: context,
        builder: (_) => CurrencyPickerDialog(
              itemBuilder: _buildDropDownItem,
              title: Text(selectcurrency == 'Home'
                  ? "Set Home Currency"
                  : "Set destination Currency"),
              isSearchable: true,
              onValuePicked: (Country country) {
                if (selectcurrency == 'Home') {
                  trip.setHomeCurrencyValue(country.currencyCode);
                } else {
                  trip.setdestCurrency(country.currencyCode);
                  // print(currency.destCurrency.value);
                }
              },
            ));
  }

  Widget _buildDropDownItem(Country country) {
    return Container(
        child: Row(
      children: <Widget>[
        CurrencyPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 10.0,
        ),
        Text("${country.currencyCode} (${country.isoCode})"),
      ],
    ));
  }
}
