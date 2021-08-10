import 'package:albina/navigation.dart';
import 'package:albina/templates/NavBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:albina/constants.dart';

class AddTargetPage extends StatefulWidget {
  AddTargetPage({Key key}) : super(key: key);

  @override
  _AddTargetPageState createState() => _AddTargetPageState();
}

class _AddTargetPageState extends State<AddTargetPage> {
  CarouselController carouselController = new CarouselController();
  int correntCarouselPage = 0;

  int _currentIndex = 0;

  Widget _stepCard({@required String title, @required String subTitle, @required String description}) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.all(35.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        color: backgroungMainWhiteColor,
        boxShadow: [
          BoxShadow(
            color: mainShadowColor,
            offset: const Offset(0.0, 0.0),
            blurRadius: 10.0,
            spreadRadius: 0.1,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: textColor
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: textColor
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor
            ),
          )
        ],
      ),
    );
  }

  Widget button(String text, Color color) {
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
        if (text == "Далее") carouselController.nextPage();
        else if (text == "Назад") carouselController.previousPage();
        else if (text == "Добавить") toModulesPage(context, 2);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroungMainWhiteColor,
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  onPageChanged: (index, carouselPageChangedReason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  initialPage: correntCarouselPage,
                  height: size.height * 0.5,
                  viewportFraction: 1,
                  enableInfiniteScroll: false
                ),
                items: <Widget>[
                  _stepCard(title: "S - Specific", subTitle: "Что конкретно нужно сделать?", description: "Описание"),
                  _stepCard(title: "M - Measurable", subTitle: "Второй", description: "Описание"),
                  _stepCard(title: "A - Achievable", subTitle: "Второй", description: "Описание"),
                  _stepCard(title: "R - Relevant", subTitle: "Второй", description: "Описание"),
                  _stepCard(title: "T - Time-bound", subTitle: "Второй", description: "Описание"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 6,
                  maxLines: 6, //null
                  maxLength: 250,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if(_currentIndex != 0) button("Назад", whiteGrey),
                  if (_currentIndex != 4) button("Далее", lightBlue),
                  if (_currentIndex == 4) button("Добавить", grassGreen)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}