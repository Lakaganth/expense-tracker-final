import 'package:currency_pickers/country.dart';
import 'package:currency_pickers/currency_pickers.dart';
import 'package:fleming_expense_tracker/controllers/currency_controller.dart';
import 'package:fleming_expense_tracker/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencyConverterScreen extends StatelessWidget {
  CurrencyController currency = Get.put(CurrencyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                color: Colors.white,
              ),
              Container(
                height: Get.height / 2,
                width: Get.width,
                color: Color(0xFFEC5759),
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "Home Currency",
                        // textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildCurrencyAmountTextFeild(),
                      SizedBox(height: 30),
                      _buildCoutryPicker(context),
                      SizedBox(height: 80),
                      CustomRaisedButtton(
                          onPressed: currency.getConvertedRates,
                          buttonText: "Convert"),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: Get.height / 2,
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Converted Amount",
                      style: GoogleFonts.quicksand(
                        fontSize: 35.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 50.0,
                      width: Get.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color(0xFFEC5759),
                        border: Border.all(
                          color: Color(0xFFEC5759),
                        ),
                      ),
                      child: Obx(
                        () => Text(
                          currency.convertedAmount.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 35.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Converted Amount",
                      style: GoogleFonts.quicksand(
                        fontSize: 35.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 50.0,
                      width: Get.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color(0xFFEC5759),
                        border: Border.all(
                          color: Color(0xFFEC5759),
                        ),
                      ),
                      child: Obx(
                        () => Text(
                          currency.currentRate.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 35.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Obx(() => Text(currency.convertedAmount.toString())),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildCoutryPicker(BuildContext context) {
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
                    Text(currency.homeCurrency.value),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                );
              }),
            ),
          ),
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
                    Text(currency.destCurrency.value),
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

  Padding _buildCurrencyAmountTextFeild() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: TextField(
          controller: currency.amountController,
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Amount eg: 250",
            hintStyle: GoogleFonts.quicksand(
              color: Colors.white60,
              fontSize: 20,
            ),
          ),
        ),
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
                  currency.setHomeCurrencyValue(country.currencyCode);
                } else {
                  currency.setdestCurrency(country.currencyCode);
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
