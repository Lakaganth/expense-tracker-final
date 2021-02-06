//User Model
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleming_expense_tracker/model/trip_model.dart';

class UserModel {
  String uid;
  String email;
  String name;
  String photoUrl;
  String searchKey;
  List<dynamic> adminTripId;
  List<dynamic> tripId;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.photoUrl,
    this.searchKey,
    this.adminTripId,
    this.tripId,
  });

  factory UserModel.fromMap(data) {
    return UserModel(
      uid: data['uid'] ?? '',
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      searchKey: data['searchKey'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      adminTripId: data['adminTripId'] ?? [],
      tripId: data['tripId'] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "searchKey": searchKey,
        "photoUrl": photoUrl,
        "adminTripId": adminTripId,
        "tripId": tripId,
      };

  static List<UserModel> listFromJson(List<dynamic> list) {
    List<UserModel> rows = list.map((i) => UserModel.fromMap(i)).toList();
    return rows;
  }
}
