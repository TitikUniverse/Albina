import 'package:albina/constants.dart';
import 'package:albina/navigation.dart';
import 'package:albina/services/gradientIconMask.dart';
import 'package:albina/templates/NavBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  int currentId = 0;
  int delSphereId = null;

  Widget smartCard(text, date, int typeId) {
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
              'Цель до ' + date,
              style: TextStyle(
                  color: whiteGrey, fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: marginCardContent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                    primary: indigo,
                    shadowColor: Colors.transparent,
                    fixedSize: Size(40, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {},
                  child: Icon(Icons.delete_rounded),
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  boxShadow: [
                    BoxShadow(
                      color: seaWave,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 7.0,
                      spreadRadius: 0.1,
                    )
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: indigo,
                    shadowColor: Colors.transparent,
                    fixedSize: Size(40, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {},
                  child: Icon(Icons.done_rounded),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _getBtnColor(sphereId) {
    var color;
    if (delSphereId == sphereId) {
      color = softRed;
    }
    if (currentId == sphereId && delSphereId == null) {
      color = lightBlue;
    } else if (currentId != sphereId) {
      color = mainGrey;
    }

    return color;
  }

  Widget smartSphereBtn(String label, int sphereId) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          minimumSize: Size(50, 29),
          primary: _getBtnColor(sphereId),
          onPrimary: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          elevation: 0,
        ),
        onPressed: () {
          setState(() {
            if (delSphereId != sphereId) {
              currentId = sphereId;
              delSphereId = null;
            }
          });
        },
        onLongPress: () {
          setState(() {
            if (currentId == sphereId) delSphereId = sphereId;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            label,
            style: TextStyle(
              color: whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          delSphereId = null;
        });
      },
      child: Padding(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => FullScreenDialog(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      65 -
                      marginCardContent,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 17.0,
                        ),
                        smartSphereBtn('Личное', 0),
                        smartSphereBtn('Работа', 1),
                        smartSphereBtn('FlatPlanet', 2),
                      ],
                    ),
                  ),
                ),
                Container(
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
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AddSphereDialog();
                            });
                      },
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
              ],
            ),
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
                    '01.01.2026',
                    1),
                smartCard(
                    'Купить квартиру не дороже 3 млн.руб. в районе своего вуза к концу 4 курса, чтобы переехать от родителей.',
                    '25.05.2023',
                    2),
                smartCard(
                    'Внедрить CRM-систему “Мегаплан” в отдел продаж к 10 сентября 2022 г. для автоматизации процессов и контроля.',
                    '10.09.2022',
                    3),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 55,
              width: 55,
              child: ElevatedButton(
                onPressed: () {
                  toAddTargetPage(context);
                },
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
      ),
    );
  }
}

class FullScreenDialog extends StatelessWidget {
  Widget smartInfoItem(
      BuildContext context, Color color, String label, String translation) {
    return Container(
      margin: EdgeInsets.only(top: marginCardContent),
      width: MediaQuery.of(context).size.width * 0.80,
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 1, // Space between underline and text
            ),
            padding: EdgeInsets.only(
              bottom: 1, // Space between underline and text
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: whiteColor,
              width: 2.0, // Underline thickness
            ))),
            child: Text(
              label,
              style: TextStyle(
                color: whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Text(
            translation,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: noAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                "Технология SMART",
                style: TextStyle(
                  color: textColor,
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "это современный подход к постановке работающих целей.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: marginMessage,
              ),
              Text(
                "    Достижение цели состоит из двух этапов: первый - формулирование и осознание требуемой задачи, второй - стремление к выполнению вашей цели. Технология SMART помогает выполнить первый этап, ведь без правильной постановки цели достичь её практически невозможно.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: marginCardContent,
              ),
              Text(
                "    Система постановки smart — целей позволяет на этапе целеполагания обобщить всю имеющуюся информацию, установить приемлемые сроки работы, определить достаточность ресурсов, предоставляя ясные, точные, конкретные задачи.\r\n\r\n\    SMART является аббревиатурой, расшифровка которой: Specific, Measurable, Achievable, Relevant, Time bound. Каждая буква аббревиатуры SMART означает критерий эффективности поставленных целей.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: marginCardContent,
              ),
              Column(
                children: [
                  smartInfoItem(
                      context, blueContrast, 'SPECIFIC', 'конкретика'),
                  smartInfoItem(
                      context, lightBlueContrast, 'MEASURABLE', 'измеримость'),
                  smartInfoItem(
                      context, greenContrast, 'ACHIEVABLE', 'достижимость'),
                  smartInfoItem(
                      context, yellowContrast, 'RELEVANT', 'актуальность'),
                  smartInfoItem(context, orangeContrast, 'TIME BOUND',
                      'ограничения во времени'),
                ],
              ),
              SizedBox(height: marginCardContent * 2),
              Text(
                "    Цель - законченное предложение. Каждое слово в нём разбирается на простые и понятные составляющие. Каждая буква наделена смыслом, и, вот секрет, пока не удастся проникнуться сутью каждого термина, система смарт для постановки цели работать не будет. Или плохо справится со своей функцией.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: backgroungMainWhiteColor,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            0, //notche margin between floating button and bottom appbar
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              button(context, "Назад", lightBlue),
              button(context, "Создать цель", grassGreen),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(BuildContext context, String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        minimumSize: Size(50, 29),
        primary: color,
        onPrimary: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        elevation: 0,
      ),
      onPressed: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        if (text == "Назад")
          Navigator.pop(context, null);
        else if (text == "Создать цель") toAddTargetPage(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(
          text,
          style: TextStyle(
            color: (color == whiteGrey) ? mainShadowColor : whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class AddSphereDialog extends StatefulWidget {
  AddSphereDialog({Key key}) : super(key: key);

  @override
  _AddSphereDialogState createState() => _AddSphereDialogState();
}

class _AddSphereDialogState extends State<AddSphereDialog> {
  TextEditingController addExpense = new TextEditingController();
  TextEditingController expenseTarget = new TextEditingController();
  DateTime expenseDate;

  void _selectDateExpence() async {
    DateTime expense = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().subtract(new Duration(days: 30)),
      lastDate: new DateTime.now().add(new Duration(days: 30)),
    );

    setState(() {
      expenseDate = expense;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      backgroundColor: backgroungMainWhiteColor,
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 180,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            TextField(
              controller: addExpense,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Название категории",
                hintStyle: TextStyle(
                  color: mainShadowColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),
            IconButton(
                color: indigo,
                splashRadius: 30,
                icon: Icon(
                  Icons.done_rounded,
                  color: mainShadowColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
