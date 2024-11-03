import 'time.dart';

class VariableX {
  VariableX._();
  static final instance = VariableX._();

  static List<String> generateDays() {
    return List.generate(
      31,
      (index) => (index + 1).toString(),
    );
  }

  static List<String> generateYears() {
    int currentYear = DateTimeX.instance.getCurrentYear;
    int startYear = currentYear;
    int endYear = (currentYear - 120);

    List<String> years = List.generate(
      startYear - endYear + 1,
      (index) => (startYear - index).toString(),
    );
    return years;
  }

  static List<String> generateBuddhaYears() {
    int currentYear = DateTimeX.instance.getCurrentBuddhaYear;
    int startYear = currentYear;
    int endYear = (currentYear - 120);

    List<String> years = List.generate(
      startYear - endYear + 1,
      (index) => (startYear - index).toString(),
    );
    return years;
  }

  List<String> days = generateDays();

  List<String> thaiShortMonths = [
    'ม.ค.',
    'ก.พ.',
    'มี.ค.',
    'เม.ย.',
    'พ.ค.',
    'มิ.ย.',
    'ก.ค.',
    'ส.ค.',
    'ก.ย.',
    'ต.ค.',
    'พ.ย.',
    'ธ.ค.',
  ];

  List<String> thaiFullMonths = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม',
  ];

  List<String> buddhaYear = generateBuddhaYears();
  List<String> christYear = generateYears();
}
