import 'dart:io';

import 'package:albina/models/expenseModel.dart';
import 'package:albina/navigation.dart';
import 'package:albina/widgets/qrAddExpense.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:albina/constants.dart';
import 'package:albina/modules/notesList.dart';
import 'package:albina/widgets/CreateQr.dart';
import 'package:albina/templates/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScanScreen extends StatefulWidget {
  QrScanScreen({Key key}) : super(key: key);

  @override
  _QrScanScreenState createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  int selectedIndex = 0;

  bool isFlashOn = false;
  bool isQrUrl = false;

  QRViewController controller;
  Barcode result;

  final qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller.pauseCamera(); //controller!.pauseCamera()
    }
    controller.resumeCamera(); //controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroungMainWhiteColor,
      extendBodyBehindAppBar: false,
      appBar: topBackBtn(context),
      body: _getBody(),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          selectedItemColor: indigo,
          unselectedItemColor: mainShadowColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_rounded),
              label: "Сканер",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_rounded),
              label: "Мой код",
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _getBody() {
    if (selectedIndex == 0) {
      return _scanQrCode();
    } else if (selectedIndex == 1) {
      return CreateQrCode();
    }
  }

  Widget _scanQrCode() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(
            bottom: 25,
            child: buildResult(),
          ),
          Positioned(
            top: 25,
            child: builControlButtons(),
          )
        ],
      ),
    );
  }

  Widget builControlButtons() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              await controller.toggleFlash();
              setState(() {
                isFlashOn = !isFlashOn;
              });
            },
            icon: Icon(
              (isFlashOn) ? Icons.flash_on_rounded : Icons.flash_off_rounded,
              color: whiteColor,
            ),
          ),
        ],
      );

  Widget buildResult() => Container(
        constraints: BoxConstraints(
            minHeight: 30, maxWidth: MediaQuery.of(context).size.width - 50),
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
            color: mainShadowColor,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: (!isQrUrl) ? shopCheck() : qrUrl(),
      );

  Widget shopCheck() {
    print(isQrUrl);
    return Text(
      (result != null) ? _shopListCheck() : 'Сканируйте код',
      maxLines: 6,
      style: TextStyle(color: whiteColor),
    );
  }

  Widget qrUrl() {
    print(isQrUrl);
    return new InkWell(
        child: new Text(
          _shopListCheck(),
          maxLines: 6,
          style: TextStyle(color: whiteGrey),
        ),
        onTap: () => launch(result.code));
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.70,
          borderWidth: 10,
          borderLength: 40,
          borderRadius: 25,
          borderColor: whiteColor,
        ),
      );
  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  _shopListCheck() {
    String data;
    isQrUrl = false;

    (result.code != null) ? data = result.code : data = 'Сканируйте';

    if (result.code.contains('t=') && result.code.contains('s=')) {
      isQrUrl = false;
      List<String> datalist = data.split('&');
      print(datalist);

      if (datalist[1] != null &&
          datalist[1].contains('s=') &&
          datalist[0].contains('t=')) {
        controller.pauseCamera();
        var summ = datalist[1];
        summ = summ.substring(2);
        var st = datalist[0];
        st = st.substring(2);
        var day = st.substring(6, 8);
        var month = st.substring(4, 6);
        var year = st.substring(2, 4);
        var hour = st.substring(9, 11);
        var min = st.substring(11, 13);

        var expenseModel = new ExpenseModel(summ, day, month, year, hour, min);

        controller.pauseCamera();
        data = null;
        toQrAddExpense(context, expenseModel);
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: AddQrExpense(
                  expenseModel:expenseModel
                )));
      } else {
        data = result.code;
      }
    } else {
      data = result.code;
    }

    if (result.code.startsWith('http://') ||
        result.code.startsWith('https://')) {
      isQrUrl = true;
      data = 'Открыть ${result.code}';
    }

    return data;
  }
}
