class CalculateX {
  CalculateX._();
  static final instance = CalculateX._();

  List<int> age({
    required String birthday,
    String? selectDate,
  }) {
    List<String> parts = birthday.split("-");
    DateTime birthdayDate = DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(
        parts[0],
      ),
    );

    late DateTime currentDate;
    late int buddhaYear;

    if (selectDate != null) {
      List<String> selectDateParts = selectDate.split("-");
      currentDate = DateTime(
        int.parse(selectDateParts[2]),
        int.parse(selectDateParts[1]),
        int.parse(selectDateParts[0]),
      );
      buddhaYear = currentDate.year;
    } else {
      currentDate = DateTime.now();
      buddhaYear = currentDate.year + 543;
    }

    int years = buddhaYear - birthdayDate.year;
    int months = currentDate.month - birthdayDate.month;
    int days = currentDate.day - birthdayDate.day;

    if (days < 0) {
      months--;
      days +=
          DateTime(currentDate.year, currentDate.month - 1, birthdayDate.day)
              .difference(currentDate)
              .inDays;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    if (years == 0 && months == 0) {
      months = 1;
    }

    return [years, months];
  }

  List<int> formatBirthday(String birthday) {
    List<String> parts = birthday.split("-");

    return [
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    ];
  }
}
