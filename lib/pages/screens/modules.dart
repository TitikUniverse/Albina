import 'package:albina/constants.dart';
import 'package:albina/modules/SmartModule.dart';
import 'package:albina/modules/cash.dart';
import 'package:albina/modules/notesList.dart';
import 'package:albina/modules/lifeBalance.dart';
import 'package:albina/templates/NavBar.dart';
import 'package:flutter/material.dart';

class ModulesScreen extends StatefulWidget {
  ModulesScreen({Key key, this.pageNum}) : super(key: key);

  final int pageNum;
  @override
  _ModulesScreenState createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: widget.pageNum);
    return Scaffold(
      backgroundColor: backgroungMainWhiteColor,
      extendBodyBehindAppBar: false,
      appBar: topMenuBtn(backgroungMainWhiteColor),
      body: Container(
        child: PageView(
          physics: BouncingScrollPhysics(),
          controller: controller,
          scrollDirection: Axis.vertical,
          children: [
            CashView(),
            NotesList(),
            SmartTarget(),
            LifeBalanceScreen(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(context,tabId: 2),
    );
  }
}


