import 'package:flutter/material.dart';
import 'package:livelife/Views/CustomViews/CustomPopupView.dart';

class CustomPopupViewController extends StatefulWidget {
  final String title;
  final String message;
  final int durationInSeconds;
  final VoidCallback? onPopupClose;
  final bool showCheckMark; // Bu parametreyi tanımlayın

  CustomPopupViewController({
    Key? key,
    required this.title,
    required this.message,
    required this.durationInSeconds,
    this.onPopupClose,
    this.showCheckMark = true, // Parametreyi başlatın
  }) : super(key: key);

  @override
  _CustomPopupViewControllerState createState() =>
      _CustomPopupViewControllerState();
}

class _CustomPopupViewControllerState extends State<CustomPopupViewController> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: widget.durationInSeconds), () {
      if (mounted) {
        // Navigator.of(context).pop();
        if (widget.onPopupClose != null) {
          widget.onPopupClose!();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopupView(
      title: widget.title,
      message: widget.message,
      showCheckMark:
          widget.showCheckMark, // Bu parametreyi CustomPopupView'a geçirin
    );
  }
}
