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
                  margin: const EdgeInsets.only(bottom: 18),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  ),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0))
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              runAlignment: WrapAlignment.center,
                              spacing: 5.0,
                              children: [
                                Chip(
                                  label: Text('Мак-дак'),
                                ),
                                Chip(
                                  label: Text('Мак-дакович'),
                                ),
                                Chip(
                                  label: Text('Мак-дак'),
                                ),
                                Chip(
                                  label: Text('Мак-дак'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      border: Border.all(
                                        color: Colors.blueAccent,
                                        width: 2
                                      )
                                    ),
                                    child: SizedBox(
                                      height: 35,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          onPrimary: lightBlue50,
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Изменить",
                                          style: TextStyle(
                                            color: lightBlue
                                          )
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0
                                  ),
                                  Container(
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      border: Border.all(
                                        color: Colors.blueAccent,
                                        width: 2
                                      )
                                    ),
                                    child: SizedBox(
                                      height: 35,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          onPrimary: darkBlue,
                                          primary: lightBlue,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Добавить",
                                          style: TextStyle(
                                            color: whiteColor
                                          )
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ),
                            )
                          ],
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
