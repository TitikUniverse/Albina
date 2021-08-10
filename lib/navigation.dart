import 'package:albina/pages/screens/QrCode.dart';
import 'package:albina/modules/lifeBalance.dart';
import 'package:albina/pages/screens/mainScreen.dart';
import 'package:albina/pages/screens/modules.dart';
import 'package:albina/widgets/addTargetPage.dart';
import 'package:albina/widgets/qrAddExpense.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


void toModulesPage(context, page) {
  Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.fade,
          child: ModulesScreen(
            pageNum: page,
          )));
}

void toLifeBalancePage(context) {
  Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.fade, child: LifeBalanceScreen()));
}

void toMainPage(context) {
  Navigator.push(context,
      PageTransition(type: PageTransitionType.fade, child: MainScreen()));
}

void toQrScanScreen(context) {
  Navigator.push(context,
      PageTransition(type: PageTransitionType.fade, child: QrScanScreen()));
}

void toQrAddExpense(context, summ, day, month, year, hour,min) {
  Navigator.push(context,
      PageTransition(type: PageTransitionType.fade, child: AddQrExpense(summ: summ, day: day, hour: hour, min: min, month: month,year: year,)));
}

void toAddTargetPage(context) {
    Navigator.push(context,
    PageTransition(type: PageTransitionType.fade, child: AddTargetPage()));
}
