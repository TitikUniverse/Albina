import 'package:albina/constants.dart';
import 'package:albina/navigation.dart';
import 'package:albina/widgets/expenseListItem.dart';
import 'package:expansion_card/expansion_card.dart';
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
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: mainShadowColor,
                offset: const Offset(0.0, 0.0),
                blurRadius: 6.0,
                spreadRadius: 0.07,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  onPrimary: lightBlue50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_bag_rounded,
                      color: lightBlue,
                      size: 31,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Лимиты',
                        style: TextStyle(
                          color: lightBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  onPrimary: lightBlue50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.today_rounded,
                      color: lightBlue,
                      size: 31,
                    ),
                    Text(
                      'Планирование',
                      style: TextStyle(
                        color: lightBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  onPrimary: lightBlue50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.view_list_rounded,
                      color: lightBlue,
                      size: 31,
                    ),
                    Text(
                      'Мои категории',
                      style: TextStyle(
                        color: lightBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: mainShadowColor,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 6.0,
                  spreadRadius: 0.07,
                )
              ],
            ),
            child: SizedBox(
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
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Ink(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    width: 55,
                    height: 55,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_rounded,
                      color: lightBlue,
                      size: 31,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: mainShadowColor,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 6.0,
                  spreadRadius: 0.07,
                )
              ],
            ),
            child: SizedBox(
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
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    width: 55,
                    height: 55,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.qr_code_scanner_rounded,
                      color: lightBlue,
                      size: 31,
                    ),
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
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: mainShadowColor,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 6.0,
                            spreadRadius: 0.07,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Сегодня",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: marginCardContent,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.account_balance_wallet_rounded,
                                color: lightBlue,
                                size: 31,
                              ),
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  value: 0.82,
                                  strokeWidth: 4.5,
                                  backgroundColor: whiteGrey,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(lightBlue),
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
                              color: textColor,
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
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                              color: mainShadowColor,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 7.0,
                              spreadRadius: 0.07)
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Сегодня",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
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
                                color: lightBlue,
                                size: 31,
                              ),
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  value: 0.52,
                                  strokeWidth: 4.5,
                                  backgroundColor: whiteGrey,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(lightBlue),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: marginCardContent,
                          ),
                          Text(
                            "13 650₽",
                            style: TextStyle(
                              color: textColor,
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
                        padding: EdgeInsets.only(bottom: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Последние расходы",
                          style: TextStyle(
                            color: mainGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxHeight: 176),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              ExpenseListItem(
                                  expense: '25',
                                  purpose: 'Проезд',
                                  date: '03.08.21'),
                              ExpenseListItem(
                                  expense: '324',
                                  purpose: 'Кофе',
                                  date: '03.08.21'),
                              ExpenseListItem(
                                  expense: '120',
                                  purpose: 'Прочее',
                                  date: '02.08.21'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 12.0, bottom: 5.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Показать все',
                            style: TextStyle(
                              color: mainGrey,
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
      firstDate: new DateTime.now().subtract(new Duration(days: 30)),
      lastDate: new DateTime.now().add(new Duration(days: 30)),
    );

    setState(() {
      expenseDate = expense;
    });
  }

  int selectedPurpose = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(18.0)),
      ),
      backgroundColor: backgroungMainWhiteColor,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 450,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            TextField(
              controller: addExpense,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Сумма расхода",
                hintStyle: TextStyle(
                  color: mainGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: marginMessage,
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 220.0),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ExpansionCard(
                        margin: EdgeInsets.zero,
                        borderRadius: 25.0,
                        backgroundColor: whiteColor,
                        title: Container(
                          child: Text(
                            "Общепит",
                            style: TextStyle(
                              fontSize: 16,
                              color: textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        children: <Widget>[
                          Container(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            1.2),
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runAlignment: WrapAlignment.start,
                                  spacing: 5.0,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 1)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
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
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 2)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 2;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 3)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 3;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 4)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 4;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 5)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 5;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ExpansionCard(
                        margin: EdgeInsets.zero,
                        borderRadius: 25.0,
                        backgroundColor: whiteColor,
                        title: Container(
                          child: Text(
                            "Общепит",
                            style: TextStyle(
                              fontSize: 16,
                              color: textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        children: <Widget>[
                          Container(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            1.2),
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runAlignment: WrapAlignment.start,
                                  spacing: 5.0,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 1)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
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
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 2)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 2;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 3)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 3;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ExpansionCard(
                        margin: EdgeInsets.zero,
                        borderRadius: 25.0,
                        backgroundColor: whiteColor,
                        title: Container(
                          child: Text(
                            "Общепит",
                            style: TextStyle(
                              fontSize: 16,
                              color: textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        children: <Widget>[
                          Container(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            1.2),
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runAlignment: WrapAlignment.start,
                                  spacing: 5.0,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 1)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
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
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 2)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 2;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 3)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 3;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 4)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 4;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 5)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 5;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 6)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 6;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size(50, 29),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        primary: (selectedPurpose == 7)
                                            ? lightBlue
                                            : mainGrey,
                                        onPrimary: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedPurpose = 7;
                                        });
                                      },
                                      child: const Text(
                                        'Зарплата',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
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
            ),
            SizedBox(
              height: marginMessage,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                minimumSize: Size(50, 29),
                padding: EdgeInsets.all(5),
                primary: Colors.transparent,
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
                    color: mainGrey,
                    size: 27,
                  ),
                  SizedBox(
                    width: 3,
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5.5),
                    child: Text(
                      expenseDate == null
                          ? 'Выбор даты'
                          : "${expenseDate.day}.${expenseDate.month}.${expenseDate.year}",
                      style: TextStyle(
                        color: mainGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
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
                  color: mainGrey,
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
