class DateFormates {
  static String currentDate() {
    var dateTime = DateTime.now();
    String currentDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    return currentDate;
  }

  static String currentTime() {
    var dateTime = DateTime.now();
    String currentTime = "${dateTime.hour}:${dateTime.minute}";
    return currentTime;
  }
}
