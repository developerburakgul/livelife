// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:livelife/Views/Screens/HabitCreateView.dart';

// // class HabitEditView extends StatelessWidget {
// //   final TextEditingController nameController;
// //   final TextEditingController descriptionController; // Description controller
// //   final DateTime startDate;
// //   final DateTime endDate;
// //   final TimeOfDay reminderTime;
// //   final Function(bool) selectDate;
// //   final Function() selectTime;
// //   final Function() selectBackground;
// //   final Function() onCancel;
// //   final Function() onSave;

// //   HabitEditView({
// //     Key? key,
// //     required this.nameController,
// //     required this.descriptionController, // Description controller
// //     required this.startDate,
// //     required this.endDate,
// //     required this.reminderTime,
// //     required this.selectDate,
// //     required this.selectTime,
// //     required this.selectBackground,
// //     required this.onCancel,
// //     required this.onSave,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back),
// //           onPressed: onCancel,
// //         ),
// //         title: Text('Yeni Alışkanlık Oluştur'),
// //       ),
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           child: Padding(
// //             padding: EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: <Widget>[
// //                 TextField(
// //                   controller: nameController,
// //                   decoration: InputDecoration(
// //                       labelText: '.Alışkanlık Adı..',
// //                       hintText: nameController.text),
// //                 ),
// //                 TextField(
// //                   controller: descriptionController, // Description TextField
// //                   decoration: InputDecoration(
// //                       labelText: 'Açıklama...',
// //                       hintText: descriptionController.text),
// //                   maxLines: 3,
// //                 ),
// //                 ListTile(
// //                   title: Text(
// //                       'Başlangıç tarihi: ${DateFormat('dd/MM/yy').format(startDate)}'),
// //                   trailing: Icon(Icons.calendar_today),
// //                   onTap: () => selectDate(true),
// //                 ),
// //                 ListTile(
// //                   title: Text(
// //                       'Bitiş tarihi: ${DateFormat('dd/MM/yy').format(endDate)}'),
// //                   trailing: Icon(Icons.calendar_today),
// //                   onTap: () => selectDate(false),
// //                 ),
// //                 ListTile(
// //                   title: Text('Anımsat: ${reminderTime.format(context)}'),
// //                   trailing: Icon(Icons.access_time),
// //                   onTap: selectTime,
// //                 ),
// //                 ListTile(
// //                   title: Text("Arkaplan Seç"),
// //                   trailing: Icon(Icons.color_lens),
// //                   onTap: selectBackground,
// //                 ),
// //                 SizedBox(height: 16.0),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: <Widget>[
// //                     ElevatedButton(
// //                       onPressed: onCancel,
// //                       child: Text('Vazgeç'),
// //                       style: ElevatedButton.styleFrom(
// //                           backgroundColor: Colors.white),
// //                     ),
// //                     ElevatedButton(
// //                       onPressed: onSave,
// //                       child: Text('Kaydet'),
// //                       style: ElevatedButton.styleFrom(
// //                           backgroundColor: Colors.white),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class HabitEditView extends StatelessWidget {
//   final TextEditingController nameController;
//   final TextEditingController descriptionController;
//   final DateTime startDate;
//   final DateTime endDate;
//   final TimeOfDay reminderTime;
//   final ValueChanged<bool> onSelectDate;
//   final VoidCallback onSelectTime;
//   final VoidCallback onSelectBackground;
//   final VoidCallback onCancel;
//   final VoidCallback onSave;

//   HabitEditView({
//     Key? key,
//     required this.nameController,
//     required this.descriptionController,
//     required this.startDate,
//     required this.endDate,
//     required this.reminderTime,
//     required this.onSelectDate,
//     required this.onSelectTime,
//     required this.onSelectBackground,
//     required this.onCancel,
//     required this.onSave,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: onCancel,
//         ),
//         title: Text('Yeni Alışkanlık Düzenle'),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Alışkanlık Adı',
//                     hintText: 'Alışkanlık Adı Girin',
//                   ),
//                 ),
//                 TextField(
//                   controller: descriptionController,
//                   decoration: InputDecoration(
//                     labelText: 'Açıklama',
//                     hintText: 'Açıklama Girin',
//                   ),
//                   maxLines: 3,
//                 ),
//                 ListTile(
//                   title: Text(
//                       'Başlangıç Tarihi: ${DateFormat('dd/MM/yy').format(startDate)}'),
//                   trailing: Icon(Icons.calendar_today),
//                   onTap: () => onSelectDate(true),
//                 ),
//                 ListTile(
//                   title: Text(
//                       'Bitiş Tarihi: ${DateFormat('dd/MM/yy').format(endDate)}'),
//                   trailing: Icon(Icons.calendar_today),
//                   onTap: () => onSelectDate(false),
//                 ),
//                 ListTile(
//                   title: Text('Anımsat: ${reminderTime.format(context)}'),
//                   trailing: Icon(Icons.access_time),
//                   onTap: onSelectTime,
//                 ),
//                 ListTile(
//                   title: Text('Arkaplan Seç'),
//                   trailing: Icon(Icons.color_lens),
//                   onTap: onSelectBackground,
//                 ),
//                 SizedBox(height: 16.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     ElevatedButton(
//                       onPressed: onCancel,
//                       child: Text('Vazgeç'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: onSave,
//                       child: Text('Kaydet'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HabitEditView extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final DateTime startDate;
  final DateTime endDate;
  final TimeOfDay reminderTime;
  final Function(bool) selectDate;
  final Function() selectTime;
  final Function() selectBackground;
  final Function() onCancel;
  final Function() onSave;

  HabitEditView({
    Key? key,
    required this.nameController,
    required this.descriptionController,
    required this.startDate,
    required this.endDate,
    required this.reminderTime,
    required this.selectDate,
    required this.selectTime,
    required this.selectBackground,
    required this.onCancel,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onCancel,
        ),
        title: Text('Alışkanlığı Düzenle'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Alışkanlık adı...'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Açıklama...'),
                maxLines: 3,
              ),
              ListTile(
                title: Text(
                    'Başlangıç tarihi: ${DateFormat('dd/MM/yy').format(startDate)}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () => selectDate(true),
              ),
              ListTile(
                title: Text(
                    'Bitiş tarihi: ${DateFormat('dd/MM/yy').format(endDate)}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () => selectDate(false),
              ),
              ListTile(
                title: Text('Anımsat: ${reminderTime.format(context)}'),
                trailing: Icon(Icons.access_time),
                onTap: selectTime,
              ),
              ListTile(
                title: Text("Arkaplan Seç"),
                trailing: Icon(Icons.color_lens),
                onTap: selectBackground,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: onCancel,
                    child: Text('Vazgeç'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: onSave,
                    child: Text('Güncelle'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


