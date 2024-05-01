enum Gender {
  male,
  female,
  other,
}

extension GenderExtension on Gender {
  static Gender fromString(String genderString) {
    return Gender.values.firstWhere(
      (g) => g.toString().split('.').last == genderString,
      orElse: () => throw ArgumentError('No such gender'),
    );
  }

  String get name => toString().split('.').last;

  String get turkishName => switch (this) {
        // TODO: Handle this case.
        Gender.male => "Erkek",
        // TODO: Handle this case.
        Gender.female => "Kadın",
        // TODO: Handle this case.
        Gender.other => "Diğer",
      };
}
