import 'package:albina/constants.dart';
import 'package:albina/navigation.dart';
import 'package:albina/templates/NavBar.dart';
import 'package:flutter/material.dart';
// временно?

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget taskListItem({String title, bool isDone}) {
    return Row(
      children: [
        Icon(
          (isDone)
              ? Icons.check_circle_outline_rounded
              : Icons.highlight_off_rounded,
          color: lightBlue,
          size: 27,
        ),
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  // static const historyLenght = 5;

  // List<String> _searchHistory = [
  //   'Kniw',
  //   'EA Sports',
  //   'Hell',
  // ];

  // List<String> filteredSearchHistory;

  // String selectedTerm;

  // List<String> filterSearchTerms({
  //   @required String filter,
  // }) {
  //   if (filter != null && filter.isNotEmpty) {
  //     return _searchHistory.reversed
  //         .where((term) => term.startsWith(filter))
  //         .toList();
  //   } else {
  //     return _searchHistory.reversed.toList();
  //   }
  // }

  // void addSearchTerm(String term) {
  //   if (_searchHistory.contains(term)) {
  //     putSearchTermFirst(term);
  //     return;
  //   }

  //   _searchHistory.add(term);
  //   if (_searchHistory.length > historyLenght) {
  //     _searchHistory.removeRange(0, _searchHistory.length - historyLenght);
  //   }

  //   filteredSearchHistory = filterSearchTerms(filter: null);
  // }

  // void deleteSearchTerm(String term) {
  //   _searchHistory.removeWhere((t) => t == term);
  //   filteredSearchHistory = filterSearchTerms(filter: null);
  // }

  // void putSearchTermFirst(String term) {
  //   deleteSearchTerm(term);
  //   addSearchTerm(term);
  // }

  // FloatingSearchBarController controller;

  // TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // controller = FloatingSearchBarController();
    // filteredSearchHistory = filterSearchTerms(filter: null);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroungMainWhiteColor,
      extendBodyBehindAppBar: false,
      appBar: noAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
          child: Column(
            children: [
              SearchAppBar(),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 25,
                          child: Column(
                            children: [
                              Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: InkWell(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0)),
                                  onTap: () {
                                    toModulesPage(context, 0);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18.0)),
                                      color: whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: mainShadowColor,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 6.0,
                                            spreadRadius: 0.07)
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Сегодня",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(
                                          height: marginCardContent,
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons
                                                  .account_balance_wallet_rounded,
                                              color: lightBlue,
                                              size: 31,
                                            ),
                                            SizedBox(
                                              height: 60,
                                              width: 60,
                                              child: CircularProgressIndicator(
                                                value: 0.82,
                                                strokeWidth: 4.5,
                                                backgroundColor: whiteGrey,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(lightBlue),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: marginCardContent,
                                        ),
                                        Text(
                                          "850₽",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                child: InkWell(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0)),
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    toModulesPage(context, 2);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18.0)),
                                      color: whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: mainShadowColor,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 6.0,
                                            spreadRadius: 0.07)
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Цели",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(
                                          height: marginCardContent,
                                        ),
                                        Icon(
                                          Icons.gps_fixed_rounded,
                                          color: lightBlue,
                                          size: 50,
                                        ),
                                        SizedBox(
                                          height: marginCardContent,
                                        ),
                                        Text(
                                          "SMART",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 25,
                          child: Column(
                            children: [
                              Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                child: InkWell(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0)),
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18.0)),
                                      color: whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: mainShadowColor,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 6.0,
                                            spreadRadius: 0.07)
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Cпорт",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(
                                          height: marginCardContent,
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.fitness_center_rounded,
                                              color: lightBlue,
                                              size: 38,
                                            ),
                                            SizedBox(
                                              height: 60,
                                              width: 60,
                                              child: CircularProgressIndicator(
                                                value: 0.7,
                                                strokeWidth: 4.5,
                                                backgroundColor: whiteGrey,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(lightBlue),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                child: InkWell(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0)),
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    toTaskManagerPage(context, false, null);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18.0)),
                                      color: whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: mainShadowColor,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 6.0,
                                            spreadRadius: 0.07)
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Задачи",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(
                                          height: marginCardContent,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              taskListItem(
                                                  title: "Тренировка",
                                                  isDone: true),
                                              Container(
                                                height: 7,
                                                width: 3,
                                                color: lightBlue,
                                                margin:
                                                    EdgeInsets.only(left: 12),
                                              ),
                                              taskListItem(
                                                  title: "Обед", isDone: false),
                                              Container(
                                                height: 7,
                                                width: 3,
                                                color: lightBlue,
                                                margin:
                                                    EdgeInsets.only(left: 12),
                                              ),
                                              taskListItem(
                                                  title: "Кино", isDone: false),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: marginCardContent,
                                        ),
                                        Container(
                                          height: 29,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.transparent,
                                              minimumSize: Size(50, 29),
                                              padding: EdgeInsets.all(1),
                                              primary: whiteColor,
                                              onPrimary: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(18))),
                                              elevation: 0,
                                            ),
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .add_circle_outline_rounded,
                                                  color: lightBlue,
                                                  size: 27,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                  height: 5,
                                                ),
                                                const Text(
                                                  'Добавить',
                                                  style: TextStyle(
                                                    color: lightBlue,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            toModulesPage(context, 3);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            height: 210,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0)),
                              color: whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: mainShadowColor,
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.1,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Жизненный баланс",
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: marginCardContent,
                                ),
                                new Image.asset(
                                  "assets/img/LifeBalancePreview.png",
                                  height: 130,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar(context, tabId: 1),
    );
  }
}
