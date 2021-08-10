import 'package:albina/constants.dart';
import 'package:albina/services/voiceService.dart';
import 'package:flutter/material.dart';

class MessageTemplate extends StatelessWidget {
  const MessageTemplate({Key key, this.text, this.isUserMessage})
      : super(key: key);

  final String text;
  final bool isUserMessage;

  @override
  Widget build(BuildContext context) {
    if (!isUserMessage) addTextToSpeak(text);
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment:
            (isUserMessage) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(minHeight: 30, maxWidth: size.width * 0.65),
            // width: size.width * 0.65,
            decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: mainShadowColor,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.1,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                textAlign: (isUserMessage) ? TextAlign.end : TextAlign.start,
              ),
            ),
          ),
          SizedBox(
            height: marginMessage,
          )
        ],
      ),
    );
  }
}
