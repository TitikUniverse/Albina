import 'package:albina/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../constants.dart';

class LifeBalanceScreen extends StatefulWidget {
  LifeBalanceScreen({Key key}) : super(key: key);

  @override
  _LifeBalanceScreenState createState() => _LifeBalanceScreenState();
}

class _LifeBalanceScreenState extends State<LifeBalanceScreen> {
  PageController controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
  }

  Widget lifeBalanceSection(Color color, String text, bool isRow) {
    return Container(
      width: (isRow)
          ? MediaQuery.of(context).size.width / 2 - 30
          : MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 21,
            width: 21,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [darkBlue, lightBlue],
        ),
      ),
      child: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.topCenter,
              child: Text(
                "Колесо жизенного баланса",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w800),
              )),
          Container(
            margin: EdgeInsets.only(top: 45),
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: AssetImage("assets/img/LifeBalanceBackground.png"),
                  width: MediaQuery.of(context).size.width - 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RadarChart(
                    outlineColor: Colors.white,
                    axisColor: Colors.white,
                    graphColors: [Color(0xFF0fd15d)],
                    ticksTextStyle: TextStyle(
                        color: Colors.white, fontSize: 12, letterSpacing: 5),
                    ticks: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                    features: ["", "", "", "", "", "", "", ""],
                    data: [
                      [8, 7, 4, 2, 5, 6, 9, 10],
                    ],
                  ),
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 0.25,
            maxHeight: MediaQuery.of(context).size.height * 0.60,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            color: backgroungMainWhiteColor,
            panel: Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 25),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 70,
                    decoration: BoxDecoration(
                      color: whiteGrey,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      lifeBalanceSection(Color(0xFF715DF1), 'Здоровье', true),
                      lifeBalanceSection(Color(0xFFff0066), 'Отношения', true),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      lifeBalanceSection(Color(0xFFFF6F61), 'Финансы', true),
                      lifeBalanceSection(Color(0xFFF6C9C9), 'Окружение', true),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  lifeBalanceSection(Color(0xFFfbae3c), 'Карьера', false),
                  SizedBox(
                    height: 8,
                  ),
                  lifeBalanceSection(Color(0xFFf6770f), 'Духовный рост', false),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      lifeBalanceSection(Color(0xFF009373), 'Увлечения', true),
                      lifeBalanceSection(Color(0xFF0066ff), 'Семья', true),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
