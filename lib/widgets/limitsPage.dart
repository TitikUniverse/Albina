<<<<<<< Updated upstream
=======
import 'dart:io';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                primary: whiteColor,
                onPrimary: whiteGrey,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
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
                        // padding: EdgeInsets.all(8.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(18.0),
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
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text('Общепит'), Text('300/430')],
                              ),
                            ),
                            LinearProgressIndicator(
                              value: 0.8,
                              minHeight: 11,
                              backgroundColor: seaWave50,
                              color: lightBlue,
                              semanticsLabel: 'Linear progress indicator',
                            ),
                          ],
                        ),
                      )
                    ],
                  )))),
    );
  }
}
>>>>>>> Stashed changes
