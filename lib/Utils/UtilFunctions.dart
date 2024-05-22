import 'package:flutter/material.dart';
import 'package:livelife/Views/CustomViews/CustomPopupView.dart';
import 'package:livelife/Controller/CustomPopupViewController.dart'; // Gerekli import

void showCustomPopup({
  required BuildContext context,
  required String title,
  required String message,
  int durationInSeconds = 2,
  bool showCheckMark = false, // Bu parametreyi ekleyin
  VoidCallback? onPopupClose,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustomPopupViewController(
        title: title,
        message: message,
        durationInSeconds: durationInSeconds,
        onPopupClose: () {
          Navigator.of(context).pop(); // Popup'ı kapat
          if (onPopupClose != null) {
            onPopupClose();
          }
        },
        showCheckMark:
            showCheckMark, // CustomPopupViewController'a parametreyi geçirin
      );
    },
  );
}
