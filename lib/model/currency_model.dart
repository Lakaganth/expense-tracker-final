// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) =>
    CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
  CurrencyModel({
    this.success,
    this.query,
    this.info,
    this.historical,
    this.date,
    this.result,
  });

  bool success;
  Query query;
  Info info;
  bool historical;
  DateTime date;
  double result;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        success: json["success"],
        query: Query.fromJson(json["query"]),
        info: Info.fromJson(json["info"]),
        historical: json["historical"],
        date: DateTime.parse(json["date"]),
        result: json["result"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "query": query.toJson(),
        "info": info.toJson(),
        "historical": historical,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "result": result,
      };
}

class Info {
  Info({
    this.rate,
  });

  double rate;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        rate: json["rate"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
      };
}

class Query {
  Query({
    this.from,
    this.to,
    this.amount,
  });

  String from;
  String to;
  int amount;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        from: json["from"],
        to: json["to"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "amount": amount,
      };
}
