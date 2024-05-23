import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livelife/Models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUserProfileImage(String userId, String imageUrl) async {
    var userDoc = _firestore.collection('users').doc(userId);
    await userDoc.update({'profileImageUrl': imageUrl});
  }

  Future<UserModel?> loadUserData(String userId) async {
    var userDoc = _firestore.collection('users').doc(userId);
    var snapshot = await userDoc.get();
    var userData = snapshot.data();
    if (userData != null) {
      return UserModel.fromFirestore(userData);
    }
    return null;
  }
}
