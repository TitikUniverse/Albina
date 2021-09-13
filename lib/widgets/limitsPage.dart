import 'package:albina/constants.dart';
import 'package:albina/templates/NavBar.dart';
import 'package:flutter/material.dart';

class LimitsPage extends StatefulWidget {
  LimitsPage({Key key}) : super(key: key);

  @override
  _LimitsPageState createState() => _LimitsPageState();
}

class _LimitsPageState extends State<LimitsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
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
            onPressed: () {},
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
      backgroundColor: backgroungMainWhiteColor,
      appBar: topBackBtn(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.only(bottom: 18),
                  alignment: Alignment.center,
                  child: Text(
                    'Лимиты',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: mainShadowColor,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 6.0,
                        spreadRadius: 0.07,
                      )
                    ],
                  ),
                  child: Container()
                )
              ],
            )
          )
        )
      ),
    );
  }
}