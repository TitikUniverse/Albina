import 'package:albina/constants.dart';
import 'package:albina/templates/NavBar.dart';
import 'package:albina/templates/taskStepperTemplate.dart';
import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
// временно?

class TaskManager extends StatefulWidget {
  TaskManager({Key key, this.isSmart, this.smartId}) : super(key: key);

  bool isSmart;
  int smartId;

  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  int currentId = 0;

  bool isSmartTask;
  int smartTaskId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isSmartTask = widget.isSmart;
    smartTaskId = widget.smartId;
    return Scaffold(
      backgroundColor: backgroungMainWhiteColor,
      extendBodyBehindAppBar: false,
      appBar: noAppBar(),
      body: returnContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add_rounded),
        backgroundColor: lightBlue,
      ),
      bottomNavigationBar: bottomNavBar(context, tabId: 3),
    );
  }

  returnContent() {
    if (isSmartTask == false && smartTaskId == null) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            children: [
              Text(
                'Мои задачи',
                style: TextStyle(
                  color: textColor,
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 10.0,
                ),
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.start,
                  spacing: 5,
                  children: [
                    SphereBtn('Личное', 0),
                    SphereBtn('Работа', 1),
                    SphereBtn('FlatPlanet', 2),
                    Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.only(right: 25),
                      child: Ink(
                        height: 40,
                        width: 40,
                        decoration: const ShapeDecoration(
                          color: whiteGrey,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          splashRadius: 25,
                          icon: const Icon(
                            Icons.add_rounded,
                            size: 25,
                          ),
                          color: mainShadowColor,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AddSphereDialog();
                                });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TaskItem(
                    taskId: 1,
                  ),
                  TaskItem(
                    taskId: 2,
                  ),
                  TaskItem(
                    taskId: 3,
                  ),
                  TaskItem(
                    taskId: 4,
                  ),
                  TaskItem(
                    taskId: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else if (isSmartTask != false && smartTaskId != null) {
      return SingleChildScrollView(
        child: Text('Task'),
      );
    }
  }

  Widget SphereBtn(String label, int sphereId) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          minimumSize: Size(50, 29),
          primary: (currentId == sphereId) ? lightBlue : whiteGrey,
          onPrimary: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          elevation: 0,
        ),
        onPressed: () {
          setState(() {
            currentId = sphereId;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            label,
            style: TextStyle(
              color: (currentId == sphereId) ? whiteColor : mainShadowColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class AddSphereDialog extends StatefulWidget {
  AddSphereDialog({Key key}) : super(key: key);

  @override
  _AddSphereDialogState createState() => _AddSphereDialogState();
}

class _AddSphereDialogState extends State<AddSphereDialog> {
  TextEditingController addExpense = new TextEditingController();
  TextEditingController expenseTarget = new TextEditingController();
  DateTime expenseDate;

  void _selectDateExpence() async {
    DateTime expense = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().subtract(new Duration(days: 30)),
      lastDate: new DateTime.now().add(new Duration(days: 30)),
    );

    setState(() {
      expenseDate = expense;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      backgroundColor: backgroungMainWhiteColor,
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 180,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            TextField(
              controller: addExpense,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Название категории",
                hintStyle: TextStyle(
                  color: mainShadowColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),
            IconButton(
                color: indigo,
                splashRadius: 30,
                icon: Icon(
                  Icons.done_rounded,
                  color: mainShadowColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
