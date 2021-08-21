import 'package:albina/constants.dart';
import 'package:albina/services/gradientBoxBorder.dart';
import 'package:albina/services/gradientIconMask.dart';
import 'package:albina/navigation.dart';
import 'package:flutter/material.dart';

@override
Widget noAppBar() {
  return AppBar(
    toolbarHeight: 0,
    backgroundColor: backgroungMainWhiteColor,
    shadowColor: Colors.transparent,
  );
}

@override
Widget topBackBtn(BuildContext context) {
  return AppBar(
    toolbarHeight: 50,
    backgroundColor: backgroungMainWhiteColor,
    shadowColor: Colors.transparent,
    leading: IconButton(
      splashRadius: 30,
      splashColor: IcoSplashColor50,
      highlightColor: Colors.transparent,
      icon: MenuGradientMask(
        child: Icon(
          Icons.arrow_back_rounded,
          size: 31,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        toMainPage(context);
      },
    ),
  );
}

@override
Widget topMenuBtn(Color bgColor) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 45,
    backgroundColor: bgColor, //backgroungMainWhiteColor
    shadowColor: Colors.transparent,
    actions: [
      Container(
        margin: EdgeInsets.only(right: 2, bottom: 1),
        height: 42,
        width: 70,
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.transparent,
              onPrimary: IcoSplashColor50,
              onSurface: IcoSplashColor50,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            child: (bgColor != Colors.transparent) ? setDarkIcon() : setLightIcon(),
            onPressed: () {},
          ),
        ),
      ),
    ],
  );
}

@override
Widget setDarkIcon() {
  return MenuGradientMask(
    child: Icon(
      Icons.more_horiz_rounded,
      size: 40,
      color: Colors.white,
    ),
  );
}

@override
Widget setLightIcon() {
  return LightMenuGradientMask(
    child: Icon(
      Icons.more_horiz_rounded,
      size: 40,
      color: Colors.white,
    ),
  );
}

@override
class SearchAppBar extends StatefulWidget {
  SearchAppBar({Key key}) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

TextEditingController editingController = TextEditingController();

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 62,
          width: 62,
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.transparent,
              shape: CircleBorder(),
            ),
            child: IconButton(
              splashRadius: 30,
              splashColor: IcoSplashColor50,
              highlightColor: IcoSplashColor50,
              icon: const Icon(
                Icons.qr_code_rounded,
                size: 31,
                color: indigo,
              ),
              color: indigo,
              onPressed: () {
                toQrScanScreen(context);
              },
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: GradientBorder.uniform(
              width: 4.0,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[indigo, backgroungMainWhiteColor],
                  stops: [0.0, 0.8]),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 62,
          margin: EdgeInsets.only(left: 10),
          width: MediaQuery.of(context).size.width - 122,
          padding: EdgeInsets.only(left: 14, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0)),
            border: GradientBorder.uniform(
              width: 4.0,
              gradient: LinearGradient(
                  colors: <Color>[backgroungMainWhiteColor, indigo],
                  stops: [0.1, 1.0]),
            ),
          ),
          child: TextField(
            onChanged: (value) {},
            controller: editingController,
            style: TextStyle(
              fontSize: 18,
              color: indigo,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Искать",
              hintStyle: TextStyle(
                color: indigo,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  size: 31,
                  color: indigo,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

@override
Widget bottomNavBar(context, {int tabId}) {
  return BottomAppBar(
    //bottom navigation bar on scaffold
    color: backgroungMainWhiteColor,
    shape: CircularNotchedRectangle(), //shape of notch
    notchMargin: 0, //notche margin between floating button and bottom appbar
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: IconButton(
                    splashRadius: 30,
                    splashColor: IcoSplashColor50,
                    highlightColor: IcoSplashColor50,
                    icon: MenuGradientMask(
                      child: Icon(
                        Icons.home_rounded,
                        size: 42,
                        color: (tabId == 1) ? Colors.white : Colors.white54,
                      ),
                    ),
                    onPressed: () {
                      toMainPage(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: IconButton(
                    splashRadius: 30,
                    splashColor: IcoSplashColor50,
                    highlightColor: IcoSplashColor50,
                    icon: MenuGradientMask(
                      child: Icon(
                        Icons.widgets_rounded,
                        size: 40,
                        color: (tabId == 2) ? Colors.white : Colors.white54,
                      ),
                    ),
                    onPressed: () {
                      toModulesPage(context, 0);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: IconButton(
                    splashRadius: 30,
                    splashColor: IcoSplashColor50,
                    highlightColor: IcoSplashColor50,
                    icon: MenuGradientMask(
                      child: Icon(
                        Icons.fact_check_rounded,
                        size: 40,
                        color: (tabId == 3) ? Colors.white : Colors.white54,
                      ),
                    ),
                    onPressed: () {
                      toTaskManagerPage(context, false, null);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60.0,
            width: 60.0,
            child: IconButton(
              splashRadius: 30,
              splashColor: IcoSplashColor50,
              highlightColor: IcoSplashColor50,
              onPressed: () {
                toAssistantChat(context);
              },
              icon: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: assistantShadow,
                    blurRadius: 15,
                    spreadRadius: -5,
                  )
                ]),
                child: Image.asset(
                  "assets/img/IconMainCircle.png",
                  width: 46,
                  height: 46,
                ),
              ), //icon inside button
            ),
          ),
        ],
      ),
    ),
  );
}
