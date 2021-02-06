// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fleming_expense_tracker/model/user_model.dart';

// class UserDatabase {
//   final Firestore _firestore = Firestore.instance;

//   Future<bool> createUser(User user) async {
//     try {
//       await _firestore
//           .collection("users")
//           .document(user.uid)
//           .setData({"name": user.name, "email": user.email});
//       return true;
//     } catch (err) {
//       rethrow;
//     }
//   }

//   Future<User> getUser(String uid) async {
//     try {
//       DocumentSnapshot _doc =
//           await _firestore.collection("users").document(uid).get();

//       return User.fromDocumentSnapshot(documentSnapshot: _doc);
//     } catch (err) {
//       rethrow;
//     }
//   }
// }
