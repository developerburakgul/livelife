// import 'package:livelife/Models/gender.dart';
// import 'package:livelife/Models/task.dart';

// class UserModel {
//   String userName;
//   String email;
//   List<Task> tasks;
//   Gender? gender;
//   int? age;
//   String? uid; // Firebase Authentication'dan gelen kullanıcı ID'si

//   UserModel({
//     required this.userName,
//     required this.email,
//     this.tasks = const [],
//     this.gender,
//     this.age,
//     this.uid,
//   });

//   // Firestore'dan UserModel nesnesi oluşturmak için bir factory constructor
//   factory UserModel.fromFirestore(Map<String, dynamic> data) {
//     return UserModel(
//       userName: data['userName'],
//       email: data['email'],
//       tasks: (data['tasks'] as List? ?? [])
//           .map((taskData) => Task.fromMap(taskData))
//           .toList(),
//       gender: data['gender'] != null
//           ? GenderExtension.fromString(data['gender'])
//           : null,
//       age: data['age'],
//       uid: data['uid'],
//     );
//   }

//   // UserModel nesnesini Map'e çevirir. Firestore'a kaydetmek için kullanılabilir.
//   Map<String, dynamic> toFirestore() {
//     return {
//       'userName': userName,
//       'email': email,
//       'tasks': tasks.map((task) => task.toMap()).toList(),
//       'gender': gender?.name,
//       'age': age,
//       'uid':
//           uid, // Opsiyonel: Firestore'a kullanıcı ID'sini de kaydetmek isterseniz.
//     };
//   }
// }

import 'package:livelife/Models/gender.dart';
import 'package:livelife/Models/task.dart';

class UserModel {
  String userName;
  String email;
  List<Task> tasks;
  Gender? gender;
  int? age;
  String? uid; // Firebase Authentication'dan gelen kullanıcı ID'si
  String? profileImageUrl; // Kullanıcı profil fotoğrafının URL'si

  UserModel({
    required this.userName,
    required this.email,
    this.tasks = const [],
    this.gender,
    this.age,
    this.uid,
    this.profileImageUrl,
  });

  // Firestore'dan UserModel nesnesi oluşturmak için bir factory constructor
  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      userName: data['userName'],
      email: data['email'],
      tasks: (data['tasks'] as List? ?? [])
          .map((taskData) => Task.fromMap(taskData))
          .toList(),
      gender: data['gender'] != null
          ? GenderExtension.fromString(data['gender'])
          : null,
      age: data['age'],
      uid: data['uid'],
      profileImageUrl: data['profileImageUrl'],
    );
  }

  // UserModel nesnesini Map'e çevirir. Firestore'a kaydetmek için kullanılabilir.
  Map<String, dynamic> toFirestore() {
    return {
      'userName': userName,
      'email': email,
      'tasks': tasks.map((task) => task.toMap()).toList(),
      'gender': gender?.name,
      'age': age,
      'uid': uid,
      'profileImageUrl': profileImageUrl,
    };
  }
}

