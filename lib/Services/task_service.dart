import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livelife/Models/user_model.dart';
import 'package:livelife/Models/task.dart';

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
        print("Task başarıyla kullanıcıya eklendi.");
      } else {
        print("Kullanıcı bulunamadı.");
      }
    } catch (e) {
      print("Bir hata oluştu: $e");
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
          return date.isAfter(task.startDate) &&
              date.isBefore(task.endDate.add(Duration(days: 1)));
        }).toList();

        print("Belirli tarihte ${tasksOnDate.length} adet task bulundu.");
        
      } else {
        print("Kullanıcı bulunamadı.");
      }
    } catch (e) {
      print("Bir hata oluştu: $e");
    }

    return tasksOnDate;
  }
}
