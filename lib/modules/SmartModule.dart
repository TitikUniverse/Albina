import 'package:albina/constants.dart';
import 'package:albina/navigation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SmartTarget extends StatefulWidget {
  SmartTarget({Key key}) : super(key: key);

  @override
  _SmartTargetState createState() => _SmartTargetState();
}

class _SmartTargetState extends State<SmartTarget> {
  int _currentIndex = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget smartCard(text, date) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 35),
      padding: EdgeInsets.only(
          top: 25, left: 25, right: 25, bottom: marginCardContent),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [lightBlue, seaWave]),
      ),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                color: whiteColor, fontSize: 21, fontWeight: FontWeight.w800),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(top: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              'Цель до ${date}',
              style: TextStyle(
                  color: whiteGrey, fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: marginCardContent,
          ),
          Container(
            height: 29,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              boxShadow: [
                BoxShadow(
                  color: seaWave50,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 7.0,
                  spreadRadius: 0.1,
                )
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                minimumSize: Size(50, 29),
                primary: lightBlue,
                onPrimary: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Text(
                'Пометить выполненым',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                'Мои цели SMART',
                style: TextStyle(
                  color: textColor,
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  splashRadius: 18,
                  splashColor: whiteGrey,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.info_rounded,
                    size: 25,
                    color: whiteGrey,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Spacer(),
          Spacer(),
          CarouselSlider(
            options: CarouselOptions(
              height: 370,
              viewportFraction: 0.8,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 8),
              autoPlayAnimationDuration: Duration(milliseconds: 1200),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: [
              smartCard(
                  'По истечении 5 лет занимать 40% доли рынка г. Новосибирск по продаже чая.',
                  '01.01.2026'),
              smartCard(
                  'Купить квартиру не дороже 3 млн.руб. в районе своего вуза к концу 4 курса, чтобы переехать от родителей.',
                  '25.05.2023'),
              smartCard(
                  'Внедрить CRM-систему “Мегаплан” в отдел продаж к 10 сентября 2022 г. для автоматизации процессов и контроля.',
                  '10.09.2022'),
            ],
          ),
          Spacer(),
          SizedBox(
            height: 55,
            width: 55,
            child: ElevatedButton(
              onPressed: () { toAddTargetPage(context); },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.blue,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [lightBlue, seaWave],
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  width: 55,
                  height: 55,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 31,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
