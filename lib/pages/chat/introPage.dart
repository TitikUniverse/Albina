import 'package:albina/constants.dart';
import 'package:albina/pages/chat/messageTemplate.dart';
import 'package:albina/services/dialogService.dart';
import 'package:albina/services/voiceService.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class IntroPage extends StatefulWidget {
  IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  double _listenBlurBg = 15;

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Нажмите кнопку и начните говорить';
  String _albinaAnswer = '';
  double _confidence = 1.0;
  List<stt.LocaleName> _localeNames = [];
  String _currentLocaleId = '';

  Widget noteInChat(Size size, {String text}) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: size.width,
          constraints: BoxConstraints(
            minHeight: 30,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                lightBlue50,
                seaWave50,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.info_outlined),
              SizedBox(width: 20),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColorDark,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: marginMessage,
        )
      ],
    );
  }

  Widget inputFieldFromGame({IconData icon, String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon),
              SizedBox(
                width: 20.0,
              ),
              Text(title)
            ],
          ),
          TextField(),
          TextField(),
          TextField()
        ],
      ),
    );
  }

  Widget buttonInChat({Size size, String text}) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            debugPrint("работает");
          },
          child: Container(
            width: 100.0,
            constraints: BoxConstraints(
              maxWidth: size.width * 0.5,
              minHeight: 30,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  lightBlue,
                  seaWave,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: mainShadowColor,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.1,
                )
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: marginMessage,
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _animationController.repeat(reverse: true);
    _listenAnimateInvisible();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroungMainWhiteColor,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: backgroungMainWhiteColor,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
          width: size.width,
          // height: size.height,
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MessageTemplate(
                    text: "Привет! Я Альбина - твой личный помощник", //
                    isUserMessage: false,
                  ),

                  MessageTemplate(
                    text:
                        "Я научу тебя жить подругому!\r\n Вместе мы будем решать проблемы, искать мотивацию, правильно строить свой путь личностного развития. Я запомню каждый нюанс, чтобы в дальнейшем у тебя была возможность проанализировать свои ошибки, для предотвращения их в будущем",
                    isUserMessage: false,
                  ),
                  MessageTemplate(
                    text:
                        "Чтобы начать мне нужно знать о твоих целях. Для этого сыграем в игру",
                    isUserMessage: false,
                  ),
                  buttonInChat(size: size, text: "Сыграть"),

                  MessageTemplate(
                    text:
                        "Это игра “Я хочу / я не хочу”. Распредели свои мысли на две группы: в первую отнеси то, чего ты желаешь добиться, а во второй укажи те вещи, которых тебе хотелось бы избежать.Выбери по 5 самых важных для тебя идей. Пополнить и отредактировать список ты сможешь позже", //ривет! Я Альбина - твой личный помощник
                    isUserMessage: false,
                  ),
                  noteInChat(size,
                      text:
                          "Мысли нужно формулировать кратко и ёмко\r\nОдна мысль - одна строка\r\nСтарайся уложиться в несколко слов"),

                  inputFieldFromGame(
                      icon: Icons.check_circle_outline, title: "Я хочу"),
                  inputFieldFromGame(
                      icon: Icons.cancel_outlined, title: "Я не хочу"),
                  SizedBox(
                    height: 20.0,
                  ),
                  // Text(_text)

                  MessageTemplate(
                    text: _text, // + '\r\n \r\n Recording:' + _isListening.toString()
                    isUserMessage: true,
                  ),

                  MessageTemplate(
                    text: _albinaAnswer, // + '\r\n \r\n Recording:' + _isListening.toString()
                    isUserMessage: false,
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 76,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  // color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [ 
                    BoxShadow(
                      color: seaWave,
                      blurRadius: 15,
                      spreadRadius: _listenBlurBg,
                    )
                  ]),
              child: ElevatedButton(
                // ElevatedButton.styleFrom(
                //     primary: Colors.transparent,
                //     shadowColor: Colors.transparent,
                //     onSurface: Colors.transparent,),
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(0)),
                  overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                  foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                  shadowColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                ) ,
                onPressed: () {
                  stopSpeak();
                  _listen();
                },
                child: Image.asset(
                  "assets/img/IconMainCircle.png",
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) =>
            {_isListeningCheck(val), print('onStatus: $val')},
        onError: (val) => {_listenAnimateInvisible(), print('onError: $val')},
      );
      if (available) {
        _localeNames = await _speech.locales();

        var systemLocale = await _speech.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? '';

        setState(() => _isListening = true);
        _speech.listen(
          localeId: _currentLocaleId,
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
            _albinaAnswer = addMessage(_text, true);
          }), 
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _listenAnimate() {
    _animation = Tween(begin: -5.0, end: 2.0).animate(_animationController)
      ..addListener(() {
        setState(() {
          if (_isListening) {
            _listenBlurBg = _animation.value;
          } else {
            _listenAnimateInvisible();
          }
        });
      });
  }

  void _listenAnimateInvisible() {
    setState(() => _isListening = false);
    _listenBlurBg = -5;
  }

  void _isListeningCheck(value) {
    if (value == "notListening") {
      setState(() => _isListening = false);
      _listenAnimateInvisible();
    } else {
       _listenAnimate();
    }
  }

}