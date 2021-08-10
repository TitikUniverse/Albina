import 'package:albina/constants.dart';
import 'package:flutter/material.dart';

class ExpenseListItem extends StatelessWidget {
  const ExpenseListItem({Key key, this.expense, this.purpose,this.date}) : super(key: key);

  final String expense;
  final String date;
  final String purpose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        border: Border.all(
          color: whiteGrey,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '- $expense₽',
            style: TextStyle(
              color: softRed,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          Spacer(),
          Text(
            '$purpose  ',
            style: TextStyle(
              color: mainShadowColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: whiteGrey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
