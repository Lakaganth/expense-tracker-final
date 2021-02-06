import 'package:fleming_expense_tracker/model/currency_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyServices {
  static http.Client client = http.Client();
  // //BaseURL
  // String _baseUrl({String endPoint}) =>
  //     "https://api.exchangerate.host/$endPoint";

  static fetchConvertedRates(from, to, amount) async {
    String _baseUrl({String endPoint}) =>
        "https://api.exchangerate.host/$endPoint";

    final rowUrl =
        _baseUrl(endPoint: "convert?from=$from&to=$to&amount=$amount");
    final encodedUrl = Uri.encodeFull(rowUrl);

    final response = await client.get(encodedUrl);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return CurrencyModel.fromJson(json.decode(response.body));
    } else {
      Get.snackbar("Error in conversion",
          json.decode(response.body)['error']['message']);
    }
  }
}
