import 'package:albina/constants.dart';
import 'package:albina/widgets/IncomeListItem.dart';
import 'package:flutter/material.dart';

class Income extends StatefulWidget {
  Income({Key key}) : super(key: key);

  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  Widget actionsToolBar() {
    return Container(
      child: SizedBox(
        height: 55,
        width: 55,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AddIncomeDialog();
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            width: MediaQuery.of(context).size.width,
            height: 200,
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
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Мой кошелёк',
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      Icon(
                        Icons.credit_card_rounded,
                        color: Colors.white,
                        size: 31,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  '****  ****  ****  ****',
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w800),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '21 000 ₽',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
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
                    "Последние доходы",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(minHeight: 176, maxHeight: 176),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        IncomeListItem(
                            income: '3000',
                            purpose: 'Перевод',
                            date: '03.08.21'),
                        IncomeListItem(
                            income: '35000',
                            purpose: 'Зарплата',
                            date: '03.08.21'),
                        IncomeListItem(
                            income: '120',
                            purpose: 'Прочее',
                            date: '02.08.21'),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 12),
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
          Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            child: actionsToolBar(),
          ),
        ],
      ),
    );
  }
}

class AddIncomeDialog extends StatefulWidget {
  AddIncomeDialog({Key key}) : super(key: key);

  @override
  _AddIncomeDialogState createState() => _AddIncomeDialogState();
}

class _AddIncomeDialogState extends State<AddIncomeDialog> {
  int selectedPurpose = 0;
  TextEditingController addExpense = new TextEditingController();
  TextEditingController expenseTarget = new TextEditingController();
  DateTime expenseDate;

  void _selectDateExpence() async {
    DateTime expense = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().subtract(new Duration(days: 30)),
      lastDate: new DateTime.now().add(new Duration(days: 30)),
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
        height: 400,
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
                hintText: "Сумма дохода",
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
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Источник дохода:',
                style: TextStyle(
                  color: mainShadowColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.start,
              spacing: 5,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    minimumSize: Size(50, 29),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                    primary: (selectedPurpose == 1) ? seaWave50 : whiteGrey,
                    onPrimary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedPurpose = 1;
                    });
                  },
                  child: const Text(
                    'Зарплата',
                    style: TextStyle(
                      color: mainShadowColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    minimumSize: Size(50, 29),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                    primary: (selectedPurpose == 2) ? seaWave50 : whiteGrey,
                    onPrimary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedPurpose = 2;
                    });
                  },
                  child: const Text(
                    'Перевод',
                    style: TextStyle(
                      color: mainShadowColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    minimumSize: Size(50, 29),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                    primary: (selectedPurpose == 3) ? seaWave50 : whiteGrey,
                    onPrimary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedPurpose = 3;
                    });
                  },
                  child: const Text(
                    'Прочее',
                    style: TextStyle(
                      color: mainShadowColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    minimumSize: Size(29, 29),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                    primary: (selectedPurpose == 4) ? seaWave50 : whiteGrey,
                    onPrimary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedPurpose = 4;
                    });
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(
                      color: mainShadowColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            (selectedPurpose == 4) ? _addOwnPurpose() : Container(),
            SizedBox(
              height: marginCardContent,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                minimumSize: Size(50, 29),
                padding: EdgeInsets.all(5),
                primary: (expenseDate == null) ? whiteGrey : seaWave50,
                onPrimary: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
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
                    expenseDate == null
                        ? 'Выбор даты'
                        : "${expenseDate.day}.${expenseDate.month}.${expenseDate.year}",
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

  Widget _addOwnPurpose() {
    return TextField(
      controller: expenseTarget,
      style: TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: "Другое",
        hintStyle: TextStyle(
          color: mainShadowColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
