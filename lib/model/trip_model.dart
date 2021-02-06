import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class TripModel {
  String tripId;
  String tripAdminId;
  String tripName;
  String destination;
  String origin;
  String homeCurrency;
  String destinationCurrency;
  double conversionRate;
  List<dynamic> teamMembers;
  double travelBudget;
  double foodBudget;
  double projBudget;
  bool tripCompleted;

  TripModel(
      {this.tripId,
      @required this.tripAdminId,
      @required this.tripName,
      @required this.destination,
      @required this.origin,
      @required this.homeCurrency,
      @required this.destinationCurrency,
      @required this.conversionRate,
      this.teamMembers,
      this.travelBudget,
      this.foodBudget,
      this.projBudget,
      this.tripCompleted});

  factory TripModel.fromMap(String id, DocumentSnapshot data) {
    return TripModel(
      tripId: id ?? '',
      tripAdminId: data['tripAdminId'] ?? '',
      tripName: data['tripName'] ?? '',
      destination: data['destination'] ?? '',
      origin: data['origin'] ?? '',
      homeCurrency: data['homeCurrency'] ?? '',
      destinationCurrency: data['destinationCurrency'] ?? '',
      conversionRate: data['conversionRate'] ?? '',
      teamMembers: data['teamMembers'] == null ? [] : data['teamMembers'],
      travelBudget: data['travelBudget'] ?? '',
      foodBudget: data['foodBudget'] ?? '',
      projBudget: data['projBudget'] ?? '',
      tripCompleted: data['tripCompleted'] ?? false,
    );
  }

  // static List<TripModel> listFromJson(List<dynamic> list) {
  //   List<TripModel> rows = list.map((i) => TripModel.fromMap(i)).toList();
  //   return rows;
  // }

  // static List<TripModel> listFromString(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<TripModel>((json) => TripModel.fromMap(json)).toList();
  // }

  Map<String, dynamic> toJson() => {
        'tripAdminId': tripAdminId,
        'tripName': tripName,
        'destination': destination,
        'origin': origin,
        'homeCurrency': homeCurrency,
        'destinationCurrency': destinationCurrency,
        'conversionRate': conversionRate,
        'teamMembers': teamMembers,
        'travelBudget': travelBudget,
        'foodBudget': foodBudget,
        'projBudget': projBudget,
        'tripCompleted': tripCompleted,
      };
}
