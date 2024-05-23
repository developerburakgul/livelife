import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livelife/Models/user_model.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Services/Exceptions/TaskException.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

