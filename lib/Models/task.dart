class Task {
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  List<bool>
      completionStatus; // Her gün için görevin tamamlanma durumunu tutan liste
  String backgroundColor; // Arka plan rengi için yeni özellik

  Task({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.backgroundColor = "#FFFFFF", // Varsayılan beyaz renk
    List<bool>? completionStatus,
  }) : completionStatus = completionStatus ??
            List.generate(
              endDate.difference(startDate).inDays + 1,
              (index) => false,
            );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'completionStatus': completionStatus,
      'backgroundColor': backgroundColor, // Yeni özellik ekleniyor
    };
  }

  // Map'ten Task nesnesi oluşturmak için bir factory constructor
  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      name: data['name'],
      description: data['description'],
      startDate: DateTime.parse(data['startDate']),
      endDate: DateTime.parse(data['endDate']),
      backgroundColor: data['backgroundColor'] ?? "#FFFFFF",
      completionStatus: List<bool>.from(data['completionStatus']),
    );
  }
}
