enum AuthError {
  userNotFound,
  passwordNotValid,
  genericError,
  emailAlreadyInUse,
  weakPassword,
  userNameAlreadyInUse,
  invalidCredential,
}

// Hata mesajlarını döndüren fonksiyon
String getErrorMessage(AuthError error) {
  switch (error) {
    case AuthError.userNotFound:
      return "Kullanıcı bulunamadı.";
    case AuthError.invalidCredential:
      return "Geçersiz e-posta veya şifre. Lütfen tekrar deneyin.";
    case AuthError.genericError:
      return "Giriş işlemi sırasında bir hata oluştu.";
    case AuthError.emailAlreadyInUse:
      return "Bu e-posta zaten kullanımda.";
    case AuthError.weakPassword:
      return "Şifre çok zayıf.";
    case AuthError.userNameAlreadyInUse:
      return "Bu kullanıcı adı zaten kullanımda, lütfen başka bir ad deneyin.";
  

    default:
      return "Bir hata oluştu.";
  }
}
