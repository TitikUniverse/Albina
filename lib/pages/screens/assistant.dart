import 'package:albina/constants.dart';
import 'package:albina/pages/chat/messageTemplate.dart';
import 'package:albina/services/dialogService.dart';
import 'package:albina/services/voiceService.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AssistantChat extends StatefulWidget {
  AssistantChat({Key key}) : super(key: key);

  @override
  _AssistantChatState createState() => _AssistantChatState();
}

class _AssistantChatState extends State<AssistantChat>
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
                    text: "Привет! Я Альбина - твой личный помощник", //
                    isUserMessage: true,
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
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                      (states) => const EdgeInsets.all(0)),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent),
                  shadowColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent),
                ),
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
        onStatus: (val) => {_isListeningCheck(val), print('onStatus: $val')},
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
      ..addListener(
        () {
          setState(
            () {
              if (_isListening) {
                _listenBlurBg = _animation.value;
              } else {
                _listenAnimateInvisible();
              }
            },
          );
        },
      );
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
