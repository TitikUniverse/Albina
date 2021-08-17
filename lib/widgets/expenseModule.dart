import 'package:albina/constants.dart';
import 'package:albina/navigation.dart';
import 'package:albina/widgets/expenseListItem.dart';
import 'package:flutter/material.dart';


class Expense extends StatefulWidget {
  Expense({Key key}) : super(key: key);

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  int moneyPerDay = 0;
  int moneyPerMonth = 0;

  TextEditingController dayLimitTextController = new TextEditingController();
  TextEditingController monthLimitTextController = new TextEditingController();

  bool _saveNewLimits() {
    if (dayLimitTextController.text.length < 1 ||
        monthLimitTextController.text.length < 1) return false;
    setState(() {
      moneyPerDay = int.parse(dayLimitTextController.text);
      moneyPerMonth = int.parse(monthLimitTextController.text);
    });
    return true;
  }

  Widget limitCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(7),
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [lightBlue, seaWave]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  'Лимиты',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'День',
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        '${moneyPerDay.toString()}₽',
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Месяц',
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        '${moneyPerMonth.toString()}₽',
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  boxShadow: [
                    BoxShadow(
                      color: indigo,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 7.0,
                      spreadRadius: 1.0,
                    )
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    minimumSize: Size(50, 29),
                    // padding: EdgeInsets.all(1),
                    primary: lightBlue,
                    onPrimary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    elevation: 0,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            backgroundColor: backgroungMainWhiteColor,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 50,
                              height: 250,
                              padding: const EdgeInsets.all(25),
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    controller: dayLimitTextController,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: textColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Дневной лимит",
                                      hintStyle: TextStyle(
                                        color: mainShadowColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: marginMessage,
                                  ),
                                  TextField(
                                    controller: monthLimitTextController,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: textColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Месячный лимит",
                                      hintStyle: TextStyle(
                                        color: mainShadowColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      color: indigo,
                                      splashRadius: 30,
                                      icon: Icon(
                                        Icons.done_rounded,
                                        color: mainShadowColor,
                                      ),
                                      onPressed: () {
                                        bool result = _saveNewLimits();
                                        if (result == true)
                                          Navigator.pop(context);
                                      })
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text(
                    'Изменить',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionsToolBar() {
    return Container(
      width: 55,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 55,
            width: 55,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AddExpenceDialog();
                    });
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.blue,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [lightBlue, seaWave],
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  width: 55,
                  height: 55,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 31,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: marginCardContent,
          ),
          SizedBox(
            height: 55,
            width: 55,
            child: ElevatedButton(
              onPressed: () {
                toQrScanScreen(context);
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.blue,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [lightBlue, seaWave],
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  width: 55,
                  height: 55,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.qr_code_scanner_rounded,
                    color: Colors.white,
                    size: 31,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      height: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                            colors: [darkBlue, lightBlue]),
                        boxShadow: [
                          BoxShadow(
                            color: mainShadowColor,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.1,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Сегодня",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: marginCardContent,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.payments_rounded,
                                color: Colors.white,
                                size: 31,
                              ),
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  value: 0.82,
                                  strokeWidth: 4.5,
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      greenIndiator),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: marginCardContent,
                          ),
                          Text(
                            "850₽",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      height: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                            colors: [lightBlue, seaWave]),
                        boxShadow: [
                          BoxShadow(
                            color: mainShadowColor,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.1,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Этот месяц",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: marginCardContent,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.payments_rounded,
                                color: Colors.white,
                                size: 31,
                              ),
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  value: 0.68,
                                  strokeWidth: 4.5,
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      greenIndiator),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: marginCardContent,
                          ),
                          Text(
                            "13650₽",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: marginMessage,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Последние расходы",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        constraints:
                            BoxConstraints(minHeight: 176, maxHeight: 176),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ExpenseListItem(expense: '25', purpose: 'Проезд', date: '03.08.21'),
                              ExpenseListItem(expense: '324', purpose: 'Кофе', date: '03.08.21'),
                              ExpenseListItem(expense: '120', purpose: 'Прочее', date: '02.08.21'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            minimumSize: Size(50, 29),
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 12),
                            primary: whiteGrey,
                            onPrimary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Показать все',
                            style: TextStyle(
                              color: mainShadowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[limitCard(), actionsToolBar()],
          ),
        ],
      ),
    );
  }
}

class AddExpenceDialog extends StatefulWidget {
  AddExpenceDialog({Key key}) : super(key: key);

  @override
  _AddExpenceDialogState createState() => _AddExpenceDialogState();
}

class _AddExpenceDialogState extends State<AddExpenceDialog> {
  TextEditingController addExpense = new TextEditingController();
  TextEditingController expenseTarget = new TextEditingController();
  DateTime expenseDate;

  void _selectDateExpence() async {
    DateTime expense = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now()
          .subtract(new Duration(days: 30)),
      lastDate: new DateTime.now()
          .add(new Duration(days: 30)),
    );

    setState(() {
      expenseDate = expense;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      backgroundColor: backgroungMainWhiteColor,
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 320,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            TextField(
              controller: addExpense,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Сумма расхода",
                hintStyle: TextStyle(
                  color: mainShadowColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: marginMessage,
            ),
            TextField(
              controller: expenseTarget,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Предмет расхода",
                hintStyle: TextStyle(
                  color: mainShadowColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: marginMessage,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                minimumSize: Size(50, 29),
                padding: EdgeInsets.all(5),
                primary: (expenseDate == null) ? whiteGrey : seaWave50,
                onPrimary: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(25))),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.date_range_rounded,
                    color: mainShadowColor,
                    size: 27,
                  ),
                  SizedBox(
                    width: 3,
                    height: 5,
                  ),
                  Text(
                    expenseDate == null ? 'Выбор даты' : "${expenseDate.day}.${expenseDate.month}.${expenseDate.year}",
                    style: TextStyle(
                      color: mainShadowColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _selectDateExpence();
              },
            ),
            Spacer(),
            IconButton(
                color: indigo,
                splashRadius: 30,
                icon: Icon(
                  Icons.done_rounded,
                  color: mainShadowColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
