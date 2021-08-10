import 'package:albina/constants.dart';
import 'package:albina/navigation.dart';
import 'package:albina/templates/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddQrExpense extends StatefulWidget {
  AddQrExpense({
    Key key,
    this.summ,
    this.day,
    this.month,
    this.year,
    this.hour,
    this.min,
  }) : super(key: key);

  final String summ;
  final String year;
  final String day;
  final String month;
  final String hour;
  final String min;
  @override
  _AddQrExpenseState createState() => _AddQrExpenseState();
}

class _AddQrExpenseState extends State<AddQrExpense> {
  int selectedPurpose = 0;
  TextEditingController expenseTarget = new TextEditingController();
  DateTime expenseDate;

  @override
  Widget build(BuildContext context) {
    expenseDate = DateFormat('dd.MM.yyyy HH:mm').parse(
        '${widget.day}.${widget.month}.${widget.year} ${widget.hour}:${widget.min}');
    return Scaffold(
      backgroundColor: backgroungMainWhiteColor,
      extendBodyBehindAppBar: false,
      appBar: noAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            Text(
              'Добавить чек',
              style: TextStyle(
                color: textColor,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Сумма: ' + widget.summ,
                style: TextStyle(
                  color: mainShadowColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: marginCardContent,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Дата: ${expenseDate.day}.${expenseDate.month}.${expenseDate.year}",
                style: TextStyle(
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
              height: marginCardContent,
            ),
            Spacer(),
            IconButton(
                splashRadius: 30,
                icon: Icon(
                  Icons.done_rounded,
                  color: mainShadowColor,
                ),
                onPressed: () {
                  toMainPage(context);
                })
          ],
        ),
      ),
    );
  }
}




///
