import 'package:flutter/material.dart';

class CustomPopupView extends StatelessWidget {
  final String title;
  final String message;
  final bool showCheckMark;

  CustomPopupView({
    Key? key,
    required this.title,
    required this.message,
    this.showCheckMark = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              if (showCheckMark) ...[
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 24,
                  child: Icon(Icons.check, size: 28, color: Colors.white),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
