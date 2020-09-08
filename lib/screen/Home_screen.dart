import 'package:flutter/material.dart';
import 'package:medicoo/dashboard/dashboard_pharmacy/controller_pharmacy.dart';
import 'package:medicoo/widget/constant.dart';
import 'package:medicoo/widget/custom_home.dart';
import 'package:medicoo/widget/navigation_drawer.dart';

// ignore: camel_case_types
class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

// ignore: camel_case_types
class _Home_PageState extends State<Home_Page> {
  @override
  int x = 0;
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: AppBar(
              backgroundColor: Color(0xFFC9FEEA),
              elevation: 0.01,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    icon: const Icon(
                      Icons.menu,
                      color: KIcons,
                      size: 40,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
            ),
          ),
        ),
        drawer: Navigation_drawer(),
        backgroundColor: Color(0xFFC9FEEA),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "MEDI",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "CO",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2EBDAB)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Changing the way you",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "recive healthcare with",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "medical excellence.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                    child: Container(
                      height: 200,
                      width: 150,
                      child: CircleAvatar(
                          backgroundColor: Color(0xFF78FDD1),
                          child: Image.asset(
                            "asset/images/h2.png",
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ReusableCard(
                              colour: Colors.white,
                              onPress: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Controller_pharmcy()));
                              },
                              cardChild: Padding(
                                padding: EdgeInsets.only(top: height * 0.03),
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        height: height * 0.1,
                                        width: width * 0.3,
                                        child: Image.asset(
                                          "asset/images/pharmacy1.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Pharmacy",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF298C7F),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ReusableCard(
                              colour: Colors.white,
                              cardChild: Padding(
                                padding: EdgeInsets.only(top: height * 0.03),
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        height: height * 0.1,
                                        width: width * 0.3,
                                        child: Image.asset(
                                          "asset/images/doctor.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Doctors",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF298C7F),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              onPress: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ReusableCard(
                              colour: Colors.white,
                              cardChild: Padding(
                                padding: EdgeInsets.only(top: height * 0.03),
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        height: height * 0.1,
                                        width: width * 0.3,
                                        child: Image.asset(
                                          "asset/images/set reminder.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Set Reminder",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF298C7F),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              onPress: () {},
                            ),
                          ),
                          Expanded(
                            child: ReusableCard(
                              colour: Colors.white,
                              cardChild: Padding(
                                padding: EdgeInsets.only(top: height * 0.03),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: height * 0.1,
                                      width: width * 0.6,
                                      child: Image.asset(
                                        "asset/images/ambulance.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Emergency",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF298C7F),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              onPress: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.description), title: Text("Documents")),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text("Chat"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), title: Text("notifications")),
          ],
          onTap: (int y) {
            setState(() {
              x = y;
            });
          },
          currentIndex: x,
          type: BottomNavigationBarType.fixed,
          fixedColor: KIcons,
        ));
  }
}
