import 'package:albina/modules/lifeBalance.dart';
import 'package:albina/pages/screens/QrCode.dart';
import 'package:albina/pages/screens/assistant.dart';
import 'package:albina/pages/screens/mainScreen.dart';
import 'package:albina/pages/screens/modules.dart';
import 'package:albina/pages/screens/taskManager.dart';
import 'package:albina/widgets/addTargetPage.dart';
import 'package:albina/widgets/categoriesPage.dart';
import 'package:albina/widgets/limitsPage.dart';
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

void toQrAddExpense(context, expenseModel) {
  Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.fade,
          child: AddQrExpense(expenseModel: expenseModel)));
}

void toAddTargetPage(context) {
  Navigator.push(context,
      PageTransition(type: PageTransitionType.fade, child: AddTargetPage()));
}

void toTaskManagerPage(context, bool isSmart, int smartId) {
  Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.fade,
          child: TaskManager(isSmart: isSmart, smartId: smartId)));
}

void toAssistantChat(context) {
  // Navigator.push(context,
  //   PageTransition(type: PageTransitionType.fade, child: AssistantChat()));
}

void toCategoriesPage(context) {
  Navigator.push(context,
      PageTransition(type: PageTransitionType.fade, child: CategoriesPage()));
}

void toLimitsPage(context) {
  Navigator.push(context,
      PageTransition(type: PageTransitionType.fade, child: LimitsPage()));
}
