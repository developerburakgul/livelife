import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadProfileImage(
      String userId, String userName, File imageFile) async {
    try {
      // Referansı profileImages/userId/userName.jpg olarak belirle
      Reference ref = _storage
          .ref()
          .child('profileImages')
          .child(userId)
          .child('$userName.jpg');

      // Dosyayı yükle
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      // Yüklenen dosyanın URL'sini al
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print("Error uploading profile image: $e");
      return null;
    }
  }
}
