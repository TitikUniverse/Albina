import 'package:albina/constants.dart';
import 'package:flutter/material.dart';

class NotesList extends StatefulWidget {
  NotesList({Key key}) : super(key: key);

  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  bool isOn = false;

  Widget infoCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [lightBlue, seaWave]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget actionsToolBar() {
    return Container(
      width: 55,
      // color: Colors.blue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [lightBlue, indigo, assistantShadow],
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.fitness_center_rounded,
                color: Colors.white,
                size: 40,
              )),
          SizedBox(
            height: marginCardContent,
          ),
          SizedBox(
            height: 55,
            width: 55,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isOn = !isOn;
                  print(isOn);
                });
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
                    (isOn)
                        ? Icons.notifications_active_rounded
                        : Icons.notifications_off_rounded,
                    color: Colors.white,
                    size: 31,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(top: marginCardContent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[infoCard(), actionsToolBar()],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  throw UnimplementedError();
}
