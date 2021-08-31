
import 'package:albina/widgets/cashAlnaliticsModule.dart';
import 'package:albina/widgets/expenseModule.dart';
import 'package:albina/widgets/incomeModule.dart';
import 'package:flutter/material.dart';

class CashView extends StatefulWidget {
  CashView({Key key}) : super(key: key);

  @override
  _CashViewState createState() => _CashViewState();
}

class _CashViewState extends State<CashView> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: [
            Expense(),
            Income(),
            // CashAnalitics(),
          ],
        ),
    );
  }
}
