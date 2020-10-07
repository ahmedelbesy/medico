import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicoo/UI/Coustm_widget/constant.dart';
import 'package:medicoo/UI/Screens/sing_up.dart';


import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class onboarding extends StatefulWidget {
  @override
  _onboardingState createState() => _onboardingState();
}

// ignore: camel_case_types
class _onboardingState extends State<onboarding> {
  final controller = ScrollController();
  double offset = 0;
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 15.0 : 10.0,
      width: isActive ? 15.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF2CBBA9) : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(600)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: kMainColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 100, left: 30),
                            child: Text(
                              "All-ln-One",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 48, bottom: 10),
                            child: Text(
                              "App",
                              style: TextStyle(
                                  color: Color(0xFF2CBBA9),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Divider(
                            color: Color(0xFF2CBBA9),
                            endIndent: 260,
                            indent: 30,
                            thickness: 7,
                          ),

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 100, left: 30),
                            child: Text(
                              "One Click",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 48, bottom: 10),
                            child: Text(
                              "Emergency Service",
                              style: TextStyle(
                                  color: Color(0xFF2CBBA9),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Divider(
                            color: Color(0xFF2CBBA9),
                            endIndent: 260,
                            indent: 30,
                            thickness: 7,
                          ),

                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 100, left: 30),
                            child: Text(
                              "Ask The",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 48, bottom: 10),
                            child: Text(
                              "Expert",
                              style: TextStyle(
                                  color: Color(0xFF2CBBA9),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Divider(
                            color: Color(0xFF2CBBA9),
                            endIndent: 260,
                            indent: 30,
                            thickness: 7,
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              _currentPage != _numPages
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Divider(
                            color: Colors.grey.shade100,
                            thickness: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        _updateSeen();
                                        return Sing_Up();
                                      }));
                                    },
                                    child: Text(
                                      "SKIP",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey.shade400),
                                    ),
                                  ),
                                  Row(
                                    children: _buildPageIndicator(),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      if (_currentPage == _numPages - 1) {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          _updateSeen();
                                          return Sing_Up();
                                        }));
                                      } else {
                                        _pageController.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Next',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF2CBBA9),
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("seen", true);
  }
}
