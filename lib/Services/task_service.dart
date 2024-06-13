// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:livelife/Models/user_model.dart';
// import 'package:livelife/Models/task.dart';
// import 'package:livelife/Services/Exceptions/TaskException.dart';

// class TaskService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;


//   // Görev tamamlama durumunu güncellemek için bir method
//   Future<void> updateTaskCompletionStatus(
//       String userId, Task task, DateTime day, bool isCompleted) async {
//     var userDoc = _firestore.collection('users').doc(userId);

//     try {
//       var snapshot = await userDoc.get();
//       var userData = snapshot.data();
//       if (userData != null) {
//         var user = UserModel.fromFirestore(userData);

//         // Görevi benzersiz tanımlayıcıya göre bul
//         for (var t in user.tasks) {
//           if (t.name == task.name &&
//               t.startDate == task.startDate &&
//               t.endDate == task.endDate) {
//             // dayIndex hesaplaması
//             int dayIndex = day.difference(task.startDate).inDays;
//             // Eğer dayIndex negatifse 0 olarak ayarla
//             if (dayIndex >= 0 && dayIndex < t.completionStatus.length) {
//               t.completionStatus[dayIndex] = isCompleted;
//             } else if (dayIndex < 0) {
//               // Eğer dayIndex negatifse, task başlangıç tarihinden önce olamaz
//               throw TaskException.firestoreError;
//             }
//             break;
//           }
//         }

//         // Güncellenmiş kullanıcıyı Firestore'a kaydet
//         await userDoc.update(user.toFirestore());
//       } else {
//         throw TaskException.userNotFound;
//       }
//     } on FirebaseException catch (e) {
//       switch (e.code) {
//         case 'permission-denied':
//           throw TaskException.permissionDenied;
//         case 'not-found':
//           throw TaskException.userNotFound;
//         default:
//           throw TaskException.firestoreError;
//       }
//     } catch (e) {
//       throw TaskException.unknownError;
//     }
//   }


//   // Kullanıcıya Task eklemek için bir method
//   Future<void> addTaskToUser(String userId, Task newTask) async {
//     var userDoc = _firestore.collection('users').doc(userId);

//     try {
//       // Firestore'dan kullanıcıyı çek
//       var snapshot = await userDoc.get();
//       var userData = snapshot.data();
//       if (userData != null) {
//         var user = UserModel.fromFirestore(userData);

//         // Yeni task'ı listeye ekle
//         user.tasks.add(newTask);

//         // Güncellenmiş kullanıcıyı Firestore'a kaydet
//         await userDoc.update(user.toFirestore());
//       } else {
//         throw TaskException.userNotFound;
//       }
//     } on FirebaseException catch (e) {
//       switch (e.code) {
//         case 'permission-denied':
//           throw TaskException.permissionDenied;
//         case 'not-found':
//           throw TaskException.userNotFound;
//         default:
//           throw TaskException.firestoreError;
//       }
//     } catch (e) {
//       throw TaskException.unknownError;
//     }
//   }

//   // Task silmek için bir method
//   Future<void> deleteTask(Task task, String userId) async {
//     var userDoc = _firestore.collection('users').doc(userId);

//     try {
//       var snapshot = await userDoc.get();
//       var userData = snapshot.data();
//       if (userData != null) {
//         var user = UserModel.fromFirestore(userData);

//         // Görevi benzersiz tanımlayıcıya göre listeden çıkar
//         user.tasks.removeWhere((t) =>
//             t.name == task.name &&
//             t.startDate == task.startDate &&
//             t.endDate == task.endDate);

//         // Güncellenmiş kullanıcıyı Firestore'a kaydet
//         await userDoc.update(user.toFirestore());
//       } else {
//         throw TaskException.userNotFound;
//       }
//     } on FirebaseException catch (e) {
//       switch (e.code) {
//         case 'permission-denied':
//           throw TaskException.permissionDenied;
//         case 'not-found':
//           throw TaskException.userNotFound;
//         default:
//           throw TaskException.firestoreError;
//       }
//     } catch (e) {
//       throw TaskException.unknownError;
//     }
//   }


//   // Belirli bir tarihte kullanıcının görevlerini çekmek için bir method
//   Future<List<Task>> getTasksForUserOnDate(String userId, DateTime date) async {
//     var userDoc = _firestore.collection('users').doc(userId);
//     List<Task> tasksOnDate = [];

//     try {
//       var snapshot = await userDoc.get();
//       var userData = snapshot.data();
//       if (userData != null) {
//         var user = UserModel.fromFirestore(userData);

//         // Tarihe uygun task'ları filtrele
//         tasksOnDate = user.tasks.where((task) {
//           // Tarihlerin saat, dakika ve saniyelerini sıfırlayarak karşılaştırma yap
//           DateTime taskStartDate = DateTime(
//               task.startDate.year, task.startDate.month, task.startDate.day);
//           DateTime taskEndDate =
//               DateTime(task.endDate.year, task.endDate.month, task.endDate.day)
//                   .add(Duration(days: 1))
//                   .subtract(Duration(seconds: 1));
//           DateTime selectedDate = DateTime(date.year, date.month, date.day);

//           return selectedDate
//                   .isAfter(taskStartDate.subtract(Duration(seconds: 1))) &&
//               selectedDate.isBefore(taskEndDate.add(Duration(seconds: 1)));
//         }).toList();

//         print("Belirli tarihte ${tasksOnDate.length} adet task bulundu.");
//       } else {
//         throw TaskException.userNotFound;
//       }
//     } on FirebaseException catch (e) {
//       switch (e.code) {
//         case 'permission-denied':
//           throw TaskException.permissionDenied;
//         case 'not-found':
//           throw TaskException.userNotFound;
//         default:
//           throw TaskException.firestoreError;
//       }
//     } catch (e) {
//       throw TaskException.unknownError;
//     }

//     return tasksOnDate;
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livelife/Models/user_model.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Services/Exceptions/TaskException.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Eski ve yeni task'ı alarak eski task'ı yeni task ile güncellemek için method
  Future<void> updateTask(String userId, Task oldTask, Task newTask) async {
    var userDoc = _firestore.collection('users').doc(userId);

    try {
      var snapshot = await userDoc.get();
      var userData = snapshot.data();
      if (userData != null) {
        var user = UserModel.fromFirestore(userData);

        // Eski görevi listede bul ve güncelle
        for (var i = 0; i < user.tasks.length; i++) {
          var t = user.tasks[i];
          if (t.name == oldTask.name &&
              t.startDate == oldTask.startDate &&
              t.endDate == oldTask.endDate) {
            // Eski görevi yeni görev ile değiştir
            user.tasks[i] = newTask;
            break;
          }
        }

        // Güncellenmiş kullanıcıyı Firestore'a kaydet
        await userDoc.update(user.toFirestore());
      } else {
        throw TaskException.userNotFound;
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw TaskException.permissionDenied;
        case 'not-found':
          throw TaskException.userNotFound;
        default:
          throw TaskException.firestoreError;
      }
    } catch (e) {
      throw TaskException.unknownError;
    }
  }

  // Görev tamamlama durumunu güncellemek için bir method
  // Future<void> updateTaskCompletionStatus(
  //     String userId, Task task, DateTime day, bool isCompleted) async {
  //   var userDoc = _firestore.collection('users').doc(userId);

  //   try {
  //     var snapshot = await userDoc.get();
  //     var userData = snapshot.data();
  //     if (userData != null) {
  //       var user = UserModel.fromFirestore(userData);

  //       // Görevi benzersiz tanımlayıcıya göre bul
  //       for (var t in user.tasks) {
  //         if (t.name == task.name &&
  //             t.startDate == task.startDate &&
  //             t.endDate == task.endDate) {
  //           // dayIndex hesaplaması
  //           int dayIndex = day.difference(task.startDate).inDays;
  //           // Eğer dayIndex negatifse 0 olarak ayarla
  //           if (dayIndex >= 0 && dayIndex < t.completionStatus.length) {
  //             t.completionStatus[dayIndex] = isCompleted;
  //           } else if (dayIndex < 0) {
  //             // Eğer dayIndex negatifse, task başlangıç tarihinden önce olamaz
  //             throw TaskException.firestoreError;
  //           }
  //           break;
  //         }
  //       }

  //       // Güncellenmiş kullanıcıyı Firestore'a kaydet
  //       await userDoc.update(user.toFirestore());
  //     } else {
  //       throw TaskException.userNotFound;
  //     }
  //   } on FirebaseException catch (e) {
  //     switch (e.code) {
  //       case 'permission-denied':
  //         throw TaskException.permissionDenied;
  //       case 'not-found':
  //         throw TaskException.userNotFound;
  //       default:
  //         throw TaskException.firestoreError;
  //     }
  //   } catch (e) {
  //     throw TaskException.unknownError;
  //   }
  // }

  Future<void> updateTaskCompletionStatus(
      String userId, Task task, DateTime day, bool isCompleted) async {
    var userDoc = _firestore.collection('users').doc(userId);

    try {
      var snapshot = await userDoc.get();
      var userData = snapshot.data();
      if (userData != null) {
        var user = UserModel.fromFirestore(userData);

        // Görevi benzersiz tanımlayıcıya göre bul
        for (var t in user.tasks) {
          if (t.name == task.name &&
              t.startDate == task.startDate &&
              t.endDate == task.endDate) {
            // dayIndex hesaplaması için sadece gün, ay ve yıl farkını kullan
            DateTime normalizedStartDate = DateTime(
              task.startDate.year,
              task.startDate.month,
              task.startDate.day,
            );
            DateTime normalizedDay = DateTime(
              day.year,
              day.month,
              day.day,
            );

            int dayIndex = normalizedDay.difference(normalizedStartDate).inDays;

            // Eğer dayIndex negatifse veya dayIndex task'ın süresi dışında ise
            if (dayIndex >= 0 && dayIndex < t.completionStatus.length) {
              t.completionStatus[dayIndex] = isCompleted;
            } else {
              // Geçersiz bir tarih aralığı, task başlangıç tarihinden önce
              throw TaskException.firestoreError;
            }
            break;
          }
        }

        // Güncellenmiş kullanıcıyı Firestore'a kaydet
        await userDoc.update(user.toFirestore());
      } else {
        throw TaskException.userNotFound;
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw TaskException.permissionDenied;
        case 'not-found':
          throw TaskException.userNotFound;
        default:
          throw TaskException.firestoreError;
      }
    } catch (e) {
      throw TaskException.unknownError;
    }
  }


  // Kullanıcıya Task eklemek için bir method
  Future<void> addTaskToUser(String userId, Task newTask) async {
    var userDoc = _firestore.collection('users').doc(userId);

    try {
      // Firestore'dan kullanıcıyı çek
      var snapshot = await userDoc.get();
      var userData = snapshot.data();
      if (userData != null) {
        var user = UserModel.fromFirestore(userData);

        // Yeni task'ı listeye ekle
        user.tasks.add(newTask);

        // Güncellenmiş kullanıcıyı Firestore'a kaydet
        await userDoc.update(user.toFirestore());
      } else {
        throw TaskException.userNotFound;
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw TaskException.permissionDenied;
        case 'not-found':
          throw TaskException.userNotFound;
        default:
          throw TaskException.firestoreError;
      }
    } catch (e) {
      throw TaskException.unknownError;
    }
  }

  // Task silmek için bir method
  Future<void> deleteTask(Task task, String userId) async {
    var userDoc = _firestore.collection('users').doc(userId);

    try {
      var snapshot = await userDoc.get();
      var userData = snapshot.data();
      if (userData != null) {
        var user = UserModel.fromFirestore(userData);

        // Görevi benzersiz tanımlayıcıya göre listeden çıkar
        user.tasks.removeWhere((t) =>
            t.name == task.name &&
            t.startDate == task.startDate &&
            t.endDate == task.endDate);

        // Güncellenmiş kullanıcıyı Firestore'a kaydet
        await userDoc.update(user.toFirestore());
      } else {
        throw TaskException.userNotFound;
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw TaskException.permissionDenied;
        case 'not-found':
          throw TaskException.userNotFound;
        default:
          throw TaskException.firestoreError;
      }
    } catch (e) {
      throw TaskException.unknownError;
    }
  }

  // Belirli bir tarihte kullanıcının görevlerini çekmek için bir method
  Future<List<Task>> getTasksForUserOnDate(String userId, DateTime date) async {
    var userDoc = _firestore.collection('users').doc(userId);
    List<Task> tasksOnDate = [];

    try {
      var snapshot = await userDoc.get();
      var userData = snapshot.data();
      if (userData != null) {
        var user = UserModel.fromFirestore(userData);

        // Tarihe uygun task'ları filtrele
        tasksOnDate = user.tasks.where((task) {
          // Tarihlerin saat, dakika ve saniyelerini sıfırlayarak karşılaştırma yap
          DateTime taskStartDate = DateTime(
              task.startDate.year, task.startDate.month, task.startDate.day);
          DateTime taskEndDate =
              DateTime(task.endDate.year, task.endDate.month, task.endDate.day)
                  .add(Duration(days: 1))
                  .subtract(Duration(seconds: 1));
          DateTime selectedDate = DateTime(date.year, date.month, date.day);

          return selectedDate
                  .isAfter(taskStartDate.subtract(Duration(seconds: 1))) &&
              selectedDate.isBefore(taskEndDate.add(Duration(seconds: 1)));
        }).toList();

        print("Belirli tarihte ${tasksOnDate.length} adet task bulundu.");
      } else {
        throw TaskException.userNotFound;
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw TaskException.permissionDenied;
        case 'not-found':
          throw TaskException.userNotFound;
        default:
          throw TaskException.firestoreError;
      }
    } catch (e) {
      throw TaskException.unknownError;
    }

    return tasksOnDate;
  }
}

