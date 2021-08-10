

import 'package:albina/constants.dart';
import 'package:albina/services/gradientIconMask.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreateQrCode extends StatefulWidget {
  CreateQrCode({Key key}) : super(key: key);

  @override
  _CreateQrCodeState createState() => _CreateQrCodeState();
}

  final editingController = TextEditingController();
  String codeContent = '';

class _CreateQrCodeState extends State<CreateQrCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height * 0.70,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 55),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MenuGradientMask(
                child: QrImage(
                  data: codeContent,
                  size: MediaQuery.of(context).size.width * 0.65,
                  foregroundColor: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 55),
                child: TextField(
                  onChanged: (value) {
                    codeContent = editingController.text;
                  },
                  controller: editingController,
                  style: TextStyle(
                    fontSize: 18,
                    color: indigo,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Текст",
                    hintStyle: TextStyle(
                      color: indigo,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: IconButton(
                      splashColor: IcoSplashColor50,
                      splashRadius: 20,
                      highlightColor: Colors.transparent,
                      icon: Icon(
                        Icons.done_rounded,
                        size: 31,
                        color: indigo,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}