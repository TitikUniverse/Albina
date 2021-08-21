import 'package:albina/constants.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  TaskItem({Key key, this.taskId}) : super(key: key);

  final int taskId;
  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  int taskId;
  int _currentstep = 0;
  void _movetonext() {
    setState(() {
      if (_currentstep < steps.length - 1) _currentstep++;
    });
  }

  void _movetostart() {
    setState(() {
      if (_currentstep > 0) _currentstep--;
    });
  }

  void _showcontent(int s) {
    showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: steps[s].title,
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                steps[s].content,
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    taskId = widget.taskId;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ExpansionCard(
        margin: EdgeInsets.only(top: marginCardContent),
        borderRadius: 25.0,
        backgroundColor: whiteColor,
        title: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Заработать миллион",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Chip(
                backgroundColor: lightBlue50,
                label: (taskId <= 3) ? Text('Личное') : Text('Работа'),
                labelStyle: TextStyle(fontSize: 16, color: whiteColor),
              ),
            ],
          ),
        ),
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              child: Stepper(
                physics: NeverScrollableScrollPhysics(),
                steps: _getSteps(context),
                type: StepperType.vertical,
                currentStep: _currentstep,
                onStepContinue: _movetonext,
                onStepCancel: _movetostart,
                onStepTapped: _showcontent,
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue,
                    VoidCallback onStepCancel}) {
                  return Padding(
                    padding: const EdgeInsets.only(top: marginMessage),
                    child: Row(
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                          ),
                          onPressed: onStepContinue,
                          child: (_currentstep < steps.length - 1)
                              ? Text('Далее')
                              : Text('Завершить'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                          ),
                          onPressed: onStepCancel,
                          child: const Text('Назад'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Step> steps = <Step>[];
  List<Step> _getSteps(BuildContext context) {
    steps = <Step>[
      Step(
          title: const Text('Рынок'),
          subtitle: Text('Занять 20% рынка'),
          content:
              const Text('Нужно занять 20% рынка г.Краснодар до 2022 года'),
          state: _getState(1),
          isActive: true),
      Step(
          title: const Text('Товарооборот'),
          subtitle: Text('Увеличить на 80%'),
          content: const Text(
              'К первому кварталу 2022 необходимо увеличить товарооборот на 80%'),
          state: _getState(2),
          isActive: true),
      Step(
          title: const Text('Дочерние компании'),
          subtitle: Text('Создать две дочерние компании'),
          content: const Text(
              'Создать 2 дочернии компании: 1 - логистическая компания, 2 - чайное производство'),
          state: _getState(3),
          isActive: true),
      Step(
          title: const Text('Международный рынок'),
          subtitle: Text('Торговля с ЕС и КНР'),
          content: const Text(
              'Начать товарооборот с Евросоюзом и Китаем, наладить транспортные артерии'),
          state: _getState(4),
          isActive: true),
    ];
    return steps;
  }

  StepState _getState(int i) {
    if (_currentstep >= i)
      return StepState.complete;
    else
      return StepState.indexed;
  }
}
