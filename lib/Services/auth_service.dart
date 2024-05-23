import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:livelife/Models/gender.dart';
import 'package:livelife/Models/user_model.dart';
import 'package:livelife/Services/Exceptions/AuthExceptions.dart';


class AuthService {
  final userCollection = FirebaseFirestore.instance.collection('users');
  final firebaseAuth = FirebaseAuth.instance;
  

  Future<UserModel?> signUp({
    required String userName,
    required String email,
    required String password,
    Gender? gender,
    int? age,
  }) async {
    var existingUser = await userCollection
        .where('userName', isEqualTo: userName)
        .limit(1)
        .get();

    if (existingUser.docs.isNotEmpty) {
      throw AuthError.userNameAlreadyInUse;
    }

    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        var userModel = UserModel(
            userName: userName,
            email: email,
            gender: gender,
            age: age,
            uid: userCredential.user!.uid);
        await _registerUser(userModel);
        return userModel;
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'auth/email-already-in-use':
          throw AuthError.emailAlreadyInUse;
        case 'auth/weak-password':
          throw AuthError.weakPassword;

        default:
          throw AuthError.genericError;
      }
    }
    return null;
  }

  Future<void> _registerUser(UserModel user) async {
    await userCollection.doc(user.uid).set(user.toFirestore());
  }

  Future<UserModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        var docSnapshot =
            await userCollection.doc(userCredential.user!.uid).get();
        if (docSnapshot.exists) {
          return UserModel.fromFirestore(docSnapshot.data()!);
        } else {
          throw AuthError.userNotFound;
        }
      }
    } on FirebaseAuthException catch (error) {
      print(
          "FirebaseAuthException Error Code: ${error.code}"); // Hata kodunu loglayın
      switch (error.code) {
        case "invalid-credential":
          throw AuthError.invalidCredential;
        default:
          throw AuthError.genericError;
      }
    }
    return null;
  }
}
