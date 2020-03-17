extension DateTimeFormatter on DateTime {
  String toReadableString() {
    var resultString = '${this.hour}:${this.minute} ${this.day}.${this.month}.${this.year}';
    return resultString;
  }
}