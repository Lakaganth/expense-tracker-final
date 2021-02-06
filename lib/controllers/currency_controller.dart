import 'package:fleming_expense_tracker/model/currency_model.dart';
import 'package:fleming_expense_tracker/services/currency_services.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CurrencyController extends GetxController {
  RxString homeCurrency = "CAD".obs;
  RxString destCurrency = "USD".obs;
  RxDouble amount = 0.0.obs;
  RxDouble currentRate = 0.0.obs;
  RxDouble convertedAmount = 0.0.obs;
  RxSet currencyModel = <CurrencyModel>{}.obs;

  setHomeCurrencyValue(val) => homeCurrency.value = val;
  setdestCurrency(val) => destCurrency.value = val;

  TextEditingController amountController = TextEditingController();

  void getConvertedRates() async {
    amount.value = double.parse(amountController.text);
    CurrencyModel currency = await CurrencyServices.fetchConvertedRates(
        homeCurrency.value, destCurrency.value, amount.value);
    currentRate.value = currency.info.rate;
    convertedAmount.value = currency.result;
    print(currency);
  }

  void checkCurrentRates(home, dest) async {
    CurrencyModel result =
        await CurrencyServices.fetchConvertedRates(home, dest, 1.0);
    currentRate.value = result.info.rate;
  }
}
