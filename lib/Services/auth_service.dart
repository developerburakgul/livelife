import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livelife/Models/gender.dart';
import 'package:livelife/Models/user_model.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection('users');
  final firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> signUp(
      {required String userName,
      required String email,
      required String password,
      Gender? gender,
      int? age}) async {
    print("signUP fonksiyonuna girdi");
    // Kullanıcı adının benzersizliğini kontrol et

    var existingUser = await userCollection
        .where('userName', isEqualTo: userName)
        .limit(1)
        .get();

    if (existingUser.docs.isNotEmpty) {
      Fluttertoast.showToast(
          msg:
              "Bu kullanıcı adı zaten kullanımda, lütfen başka bir ad deneyin.");
      return null;
    }

    // E-posta ve şifre ile kullanıcı kaydı
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        print("kullanıcı var");
        var userModel = UserModel(
            userName: userName,
            email: email,
            gender: gender,
            age: age,
            uid: userCredential.user!.uid);
        await _registerUser(userModel, userCredential);
        // UserModel ile Firebase User ID'yi döndür
        print("register fonksiyonundan çıktı");
        return userModel;
      }
      print("kullanıcı yok");
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
    }
    return null;
  }



  Future<void> _registerUser(
      UserModel user, UserCredential userCredential) async {
    print("register fonksiyonuna girdi");
    // Kullanıcı bilgilerini ve görevlerini Firestore'a kaydet
    await userCollection.doc(user.uid).set(user.toFirestore());
    print("register fonksiyonunda kayıt başarılı");
    Fluttertoast.showToast(msg: "Kullanıcı başarıyla kaydedildi.");
  }



  // Future<UserModel?> signInWithEmailAndPassword({
  //     required String email, required String password}) async {
  //   try {
  //     UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //         if (userCredential.user != null) {
  //       print("kullanıcı var");
  //       var userModel = UserModel(
  //           email: email,
  //           uid: userCredential.user!.uid);
  //       return userModel;
  //     }
      
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found' || e.code == 'wrong-password') {
  //       showToast(message: 'Invalid email or password. Please try again.');
  //     } else {
  //       showToast(message: 'An error occurred: ${e.code}');
  //     }
  //   }
  //   return null;
  // }


  Future<UserModel?> signIn(
      {required String email, required String password}) async {
    try {
      // Attempt to sign in the user with email and password
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        // If the sign in was successful, retrieve the user details from Firestore
        var docSnapshot =
            await userCollection.doc(userCredential.user!.uid).get();
        if (docSnapshot.exists) {
          print("Kullanıcı başarıyla giriş yaptı.");
          // Convert the document to the UserModel
          return UserModel.fromFirestore(docSnapshot.data()!);
        } else {
          // User data is not available in Firestore
          Fluttertoast.showToast(msg: "Kullanıcı bilgileri bulunamadı.");
          return null;
        }
      } else {
        // No user returned
        print("Giriş başarısız, kullanıcı verisi yok.");
        return null;
      }
    } on FirebaseAuthException catch (e) {
      // Handle errors from Firebase Authentication
      Fluttertoast.showToast(msg: "Giriş başarısız: ${e.message}");
      return null;
    }
  }

}
