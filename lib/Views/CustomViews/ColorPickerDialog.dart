import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog extends StatelessWidget {
  final Function(Color) onColorSelected;

  ColorPickerDialog({required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    Color pickerColor = Colors.white; // Varsayılan renk

    return AlertDialog(
      title: Text('Renk Seçiniz'),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: pickerColor,
          onColorChanged: (Color color) {
            pickerColor = color;
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Seç'),
          onPressed: () {
            onColorSelected(pickerColor);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
