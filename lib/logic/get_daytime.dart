/// Always execute this function in the build block;
/// when the widgets are recreated, the current time gets updated

String getDaytime() {
  late String dayTime;
  DateTime currentTime = DateTime.now();
  int currentHour = currentTime.hour;

  if (currentHour < 12) {
    dayTime = "Morning";
  } else if (currentHour >= 12 && currentHour < 16) {
    dayTime = "Afternoon";
  } else if (currentHour >= 16 && currentHour < 21) {
    dayTime = "Evening";
  } else if (currentHour >= 21 && currentHour < 24) {
    dayTime = "Night";
  }

  return dayTime;
}
