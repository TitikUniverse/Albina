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
            child: (bgColor != Colors.transparent)
                ? setDarkIcon()
                : setLightIcon(),
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
      size: 36,
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

// @override
// class SearchAppBar extends StatefulWidget {
//   SearchAppBar({Key key}) : super(key: key);

//   @override
//   _SearchAppBarState createState() => _SearchAppBarState();
// }

// TextEditingController editingController = TextEditingController();

// class _SearchAppBarState extends State<SearchAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           height: 52,
//           width: 52,
//           child: Ink(
//             decoration: const ShapeDecoration(
//               color: Colors.transparent,
//               shape: CircleBorder(),
//             ),
//             child: IconButton(
//               splashRadius: 30,
//               splashColor: IcoSplashColor50,
//               highlightColor: IcoSplashColor50,
//               icon: const Icon(
//                 Icons.qr_code_rounded,
//                 size: 31,
//                 color: lightBlue,
//               ),
//               color: lightBlue,
//               onPressed: () {
//                 toQrScanScreen(context);
//               },
//             ),
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(50.0)),
//             border: GradientBorder.uniform(
//               width: 3.0,
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: <Color>[lightBlue, backgroungMainWhiteColor],
//                   stops: [0.0, 0.8]),
//             ),
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           height: 52,
//           margin: EdgeInsets.only(left: 10),
//           width: MediaQuery.of(context).size.width - 112,
//           padding: EdgeInsets.only(left: 14, right: 5),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(50.0),
//                 bottomRight: Radius.circular(50.0)),
//             border: GradientBorder.uniform(
//               width: 3.0,
//               gradient: LinearGradient(
//                   colors: <Color>[backgroungMainWhiteColor, lightBlue],
//                   stops: [0.1, 1.0]),
//             ),
//           ),
//           child: SizedBox(
//             height: 45,
//             child: TextField(
//               textAlign: TextAlign.start,
//               onChanged: (value) {},
//               controller: editingController,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: indigo,
//                 fontWeight: FontWeight.w500,
//               ),
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: "Искать",
//                 hintStyle: TextStyle(
//                   color: lightBlue,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 suffixIcon: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.search_rounded,
//                     size: 31,
//                     color: lightBlue,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

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
          height: 52,
          width: 52,
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
                color: lightBlue,
              ),
              color: lightBlue,
              onPressed: () {
                toQrScanScreen(context);
              },
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                  color: mainShadowColor,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 6.0,
                spreadRadius: 0.07)
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 52,
          margin: EdgeInsets.only(left: 10),
          width: MediaQuery.of(context).size.width - 112,
          padding: EdgeInsets.only(left: 14, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
                topLeft: Radius.circular(18.0),
                bottomLeft: Radius.circular(18.0)),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                  color: mainShadowColor,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 6.0,
                spreadRadius: 0.07)
            ],
          ),
          child: SizedBox(
            height: 45,
            child: TextField(
              textAlign: TextAlign.start,
              onChanged: (value) {},
              controller: editingController,
              style: TextStyle(
                fontSize: 16,
                color: indigo,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Искать",
                hintStyle: TextStyle(
                  color: lightBlue,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_rounded,
                    size: 31,
                    color: lightBlue,
                  ),
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
    elevation: 0,
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
                padding: const EdgeInsets.only(right: 1),
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: IconButton(
                    splashRadius: 30,
                    splashColor: IcoSplashColor50,
                    highlightColor: IcoSplashColor50,
                    icon: MenuGradientMask(
                      child: Icon(
                        (tabId == 1) ? Icons.home_rounded : Icons.home_outlined,
                        size: 37,
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
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: IconButton(
                    splashRadius: 30,
                    splashColor: IcoSplashColor50,
                    highlightColor: IcoSplashColor50,
                    icon: MenuGradientMask(
                      child: Icon(
                        (tabId == 2)
                            ? Icons.widgets_rounded
                            : Icons.widgets_outlined,
                        size: 35,
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
                padding: const EdgeInsets.only(left: 1),
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: IconButton(
                    splashRadius: 30,
                    splashColor: IcoSplashColor50,
                    highlightColor: IcoSplashColor50,
                    icon: MenuGradientMask(
                      child: Icon(
                        (tabId == 3)
                            ? Icons.fact_check_rounded
                            : Icons.fact_check_outlined,
                        size: 35,
                        color: (tabId == 3) ? Colors.white : Colors.white54,
                      ),
                    ),
                    onPressed: () {
                      toTaskManagerPage(context, false, null);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: IconButton(
                    splashRadius: 30,
                    splashColor: IcoSplashColor50,
                    highlightColor: IcoSplashColor50,
                    icon: MenuGradientMask(
                      child: Icon(
                        (tabId == 4)
                            ? Icons.person_rounded
                            : Icons.person_outline_rounded,
                        size: 35,
                        color: (tabId == 4) ? Colors.white : Colors.white54,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 55.0,
            width: 55.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                primary: Colors.transparent,
                onPrimary: lightBlue50,
                elevation: 0,
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                toAssistantChat(context);
              },
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: assistantShadow,
                    blurRadius: 10,
                    spreadRadius: -6,
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
