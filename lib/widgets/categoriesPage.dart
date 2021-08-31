import 'package:albina/constants.dart';
import 'package:albina/templates/NavBar.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroungMainWhiteColor,
      appBar: topBackBtn(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: Text(
                    'Мои категории',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
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
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.start,
                            runAlignment: WrapAlignment.start,
                            spacing: 5.0,
                            children: [
                              Chip(
                                label: Text('Мак-дак'),
                              ),
                            ],
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
      ),
    );
  }
}
