import '../helper/variable.dart';
import 'calculate.dart';

class DateTimeX {
  DateTimeX._();
  static final instance = DateTimeX._();

  int get getCurrentYear => DateTime.now().year;
  int get getCurrentBuddhaYear => (getCurrentYear + 543);

  int thaiShortMonthToIndex(String shortMonth) {
    int index = VariableX.instance.thaiShortMonths.indexOf(shortMonth);
    if (index != -1) {
      return index + 1;
    } else {
      return -1;
    }
  }

  String thaiFormat({
    required String day,
    required String month,
    required String year,
  }) {
    int monthIndex = thaiShortMonthToIndex(month);
    String textDay = day.toString().padLeft(2, '0');
    String textMonth =
        monthIndex != -1 ? monthIndex.toString().padLeft(2, '0') : '00';
    String textYear = year.toString();
    String formattedDate = '$textDay-$textMonth-$textYear';
    return formattedDate;
  }

  String formatThai({
    required String birthday,
  }) {
    var list = CalculateX.instance.formatBirthday(birthday);
    String day = list[0].toString().padLeft(2, '0');
    String month = VariableX.instance.thaiFullMonths[int.parse(
      (list[1] - 1).toString().padLeft(2, '0'),
    )];
    String year = list[2].toString().padLeft(4, '0');
    return '$day $month $year';
  }

  DateTime parseCustomDate(String input) {
    List<String> parts = input.split('-');
    if (parts.length == 3) {
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);
      return DateTime(year, month, day);
    } else {
      throw const FormatException('Invalid date format');
    }
  }

  List<int> parseListInt(String input) {
    List<String> parts = input.split('-');
    int day = 0;
    int month = 0;
    int year = 0;
    if (parts.length == 3) {
      day = int.parse(parts[0]);
      month = int.parse(parts[1]);
      year = int.parse(parts[2]);
    }
    return [day, month, year];
  }

  bool isDateBeforeSelectedDate({
    required String date,
    required String selectedDate,
  }) {
    DateTime parsedDate = parseCustomDate(date);
    DateTime parsedSelectedDate = parseCustomDate(selectedDate);
    return parsedDate.isBefore(parsedSelectedDate);
  }
}
