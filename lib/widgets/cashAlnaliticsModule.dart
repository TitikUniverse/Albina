import 'package:albina/constants.dart';
import 'package:flutter/material.dart';

class CashAnalitics extends StatefulWidget {
  CashAnalitics({Key key}) : super(key: key);

  @override
  _CashAnaliticsState createState() => _CashAnaliticsState();
}

class _CashAnaliticsState extends State<CashAnalitics> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Прогноз на месяц",
              style: TextStyle(
                color: textColor,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width / 2 - 30,
                height: 140,
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
                      "Доходы",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: marginCardContent,
                    ),
                    Icon(
                      Icons.account_balance_wallet_rounded,
                      color: Colors.white,
                      size: 31,
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
                height: 140,
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
                      "Расходы",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: marginCardContent,
                    ),
                    Icon(
                      Icons.payments_rounded,
                      color: Colors.white,
                      size: 31,
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
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 140,
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
                  "Сбережения",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: marginCardContent,
                ),
                Icon(
                  Icons.payment_rounded, //savings_rounded
                  color: Colors.white,
                  size: 31,
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
          Spacer(),
        ],
      ),
    );
  }
}
