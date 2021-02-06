// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Stream<FirebaseUser> onAuthChanged() {
//     return _firebaseAuth.onAuthStateChanged;
//   }

//   Future<String> signInWithEmailAndPassword(
//       String email, String password) async {
//     AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password);
//     return result.user.uid;
//   }

//   Future<bool> isSignedIn() async {
//     final currentUser = await _firebaseAuth.currentUser();
//     return currentUser != null;
//   }

//   Future<String> signUp(
//     String email,
//     String password, {
//     String username,
//   }) async {
//     AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return result.user.uid;
//   }

//   Future<FirebaseUser> getCurrentUser() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     return user;
//   }

//   Future<String> getAccessToken() async {
//     FirebaseUser user = await getCurrentUser();
//     IdTokenResult tokenResult = await user.getIdToken();
//     return tokenResult.token;
//   }

//   Future<String> getRefreshToken() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     IdTokenResult tokenResult = await user.getIdToken(refresh: true);
//     return tokenResult.token;
//   }

//   Future<void> signOut() async {
//     _firebaseAuth.signOut();
//   }

//   Future<void> sendEmailVerification() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     user.sendEmailVerification();
//   }

//   Future<bool> isEmailVerified() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     return user.isEmailVerified;
//   }

//   @override
//   Future<void> changeEmail(String email) async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     return user.updateEmail(email);
//   }

//   @override
//   Future<void> changePassword(String password) async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     user.updatePassword(password).then((_) {
//       print("Succesfull changed password");
//     }).catchError((error) {
//       print("Password can't be changed" + error.toString());
//     });
//     return null;
//   }

//   @override
//   Future<void> deleteUser() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     user.delete().then((_) {
//       print("Succesfull user deleted");
//     }).catchError((error) {
//       print("user can't be delete" + error.toString());
//     });
//     return null;
//   }

//   @override
//   Future<void> sendPasswordResetMail(String email) async {
//     await _firebaseAuth.sendPasswordResetEmail(email: email);
//     return null;
//   }
// }
