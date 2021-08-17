import 'package:albina/navigation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:albina/constants.dart';

class AddTargetPage extends StatefulWidget {
  AddTargetPage({Key key}) : super(key: key);

  @override
  _AddTargetPageState createState() => _AddTargetPageState();
}

class _AddTargetPageState extends State<AddTargetPage> {
  DateTime targetDate;
  CarouselController carouselController = new CarouselController();
  int correntCarouselPage = 0;

  int _currentIndex = 0;

  Widget _stepCard(
      {@required String title,
      @required String subTitle,
      @required String description}) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.all(25.0),
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
                fontSize: 21, fontWeight: FontWeight.w800, color: textColor),
          ),
          SizedBox(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subTitle,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: textColor),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  child: Text(
                    description,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColor),
                  ),
                ),
              ],
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
        FocusScope.of(context).requestFocus(new FocusNode());
        if (text == "Отмена")
          toModulesPage(context, 2);
        else if (text == "Далее")
          carouselController.nextPage();
        else if (text == "Назад")
          carouselController.previousPage();
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroungMainWhiteColor,
        extendBodyBehindAppBar: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
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
                      height: size.height * 0.6,
                      viewportFraction: 1,
                      enableInfiniteScroll: false),
                  items: <Widget>[
                    _stepCard(
                        title: "S - Specific",
                        subTitle: "Что конкретно нужно сделать?",
                        description:
                            "    «Specific» – конкретный.\r\n   Каждая цель должна иметь предельно конкретную формулировку, исключающую вариативность в её понимании.\r\n\r\n\    Необходимо ответить на вопрос: «Что я должен сделать?» Используйте глагол действия (быть, стать, заработать, выиграть)."),
                    _stepCard(
                        title: "M - Measurable",
                        subTitle: "Как понять, что цель достигнута?",
                        description:
                            "    «Measurable» – измеримый.\r\n    Это такое свойство формулировки, которое позволит вам при подведении итогов точно ответить на вопрос: «Достигнута ли желаемая Цель?»\r\n\r\n\    Показателем является точная сумма просмотров, заработанных денег, пройденных километров, проценты или различные победы в конкурсах, получение сертефикатов"),
                    _stepCard(
                        title: "A - Achievable",
                        subTitle: "Цель достижима?",
                        description:
                            "    «Achievable» – достижимый.\r\n    Имеются ли необходимые ресурсы: время, деньги, силы (физические и моральные), умения и т.д.?\r\n\r\n\    Несоблюдение этого критерия становится причиной того, что поставленные цели не мотивируют и даже вгоняют в невроз."),
                    _stepCard(
                        title: "R - Relevant",
                        subTitle: "Какие выгоды принесет выполнение цели?",
                        description:
                            "«Relevant» – значимый.\r\n    Актуальна ли цель? Согласуется ли она с другими целями и стоит ли она того, чтобы потратить ваше время.\r\n\r\n\    Если от достижения цели нет выгод, то действительно ли ее выполнение необходимо?"),
                    _stepCard(
                        title: "T - Time-bound",
                        subTitle: "За какое время нужно достичь цель?",
                        description:
                            "«Time-bound» – временные рамки.\r\n    Установите разумные сроки для завершения вашей цели, так что это держит вас в фокусе."),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: (_currentIndex != 4) ? 6 : 2,
                    maxLines: 6,
                    maxLength: 250,
                    cursorColor: lightBlue,
                    decoration: InputDecoration(
                      labelText: _getLebel(),
                      labelStyle: TextStyle(color: lightBlue, fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: lightBlue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: lightBlue, width: 1.0),
                      ),
                    ),
                  ),
                ),
                (_currentIndex == 4)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            minimumSize: Size(50, 29),
                            padding: EdgeInsets.all(5),
                            primary:
                                (targetDate == null) ? whiteGrey : seaWave50,
                            onPrimary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.date_range_rounded,
                                color: mainShadowColor,
                                size: 27,
                              ),
                              SizedBox(
                                width: 3,
                                height: 5,
                              ),
                              Text(
                                targetDate == null
                                    ? 'Выбор даты'
                                    : "${targetDate.day}.${targetDate.month}.${targetDate.year}",
                                style: TextStyle(
                                  color: mainShadowColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            _selectTargetDate();
                          },
                        ),
                      )
                    : Container(),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (_currentIndex == 0) button("Отмена", whiteGrey),
                    if (_currentIndex != 0) button("Назад", whiteGrey),
                    if (_currentIndex != 4) button("Далее", lightBlue),
                    if (_currentIndex == 4) button("Добавить", grassGreen)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getLebel() {
    if (_currentIndex == 0) return 'Что конкретно нужно сделать?';
    if (_currentIndex == 1) return 'Как понять, что цель достигнута?';
    if (_currentIndex == 2) return 'Можно ли достичь поставленную цель?';
    if (_currentIndex == 3) return 'Какие выгоды принесет выполнение цели?';
    if (_currentIndex == 4) return 'За какое время нужно достичь цель?';
  }

  void _selectTargetDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().subtract(new Duration(days: 30)),
      lastDate: new DateTime.now().add(new Duration(days: 30)),
    );

    setState(() {
      targetDate = date;
    });
  }
}
