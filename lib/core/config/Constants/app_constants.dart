enum Token {
  userToken("mytoken");

  final String value;

  const Token(this.value);
}

class HiveBoxKeys {
  static const String specialities = "specialities_box";
  static const String allDoctors = "all_doctors_box";
}

enum SortBySpecialization {
  all(0),
  cardiology(1),
  dermatology(2),
  neurology(3),
  orthopedics(4),
  pediatrics(5),
  gynecology(6),
  ophthalmology(7),
  urology(8),
  gastroenterology(9),
  psychiatry(10);

  final int value;

  const SortBySpecialization(this.value);
}

enum SortByDegree {
  all("All"),
  consultant("Consultant"),
  specialist("Specialist"),
  professor("Professor");

  final String value;

  const SortByDegree(this.value);
}
