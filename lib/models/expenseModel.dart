class ExpenseModel {
  String summ;
  String year;
  String day;
  String month;
  String hour;
  String min;

  ExpenseModel(summ, day, month, year, hour, min) {
    this.summ = summ;
    this.day = day;
    this.month = month;
    this.year = year;
    this.hour = hour;
    this.min = min;
  }
}