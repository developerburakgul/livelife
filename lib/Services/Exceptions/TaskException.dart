// TaskExceptions.dart
enum TaskException {
  userNotFound,
  firestoreError,
  unknownError,
  permissionDenied,
}

// Hata mesajlarını döndüren fonksiyon
String getTaskErrorMessage(TaskException error) {
  switch (error) {
    case TaskException.userNotFound:
      return "Kullanıcı bulunamadı.";
    case TaskException.firestoreError:
      return "Veritabanı hatası.";
    case TaskException.unknownError:
      return "Bilinmeyen bir hata oluştu.";
    case TaskException.permissionDenied:
      return "İzin reddedildi.";
    default:
      return "Bir hata oluştu.";
  }
}
