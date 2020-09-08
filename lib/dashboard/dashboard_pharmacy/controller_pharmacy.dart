import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicoo/Api/model_login.dart';
import 'package:medicoo/widget/constant.dart';
import 'package:medicoo/widget/navigation_drawer.dart';

class Controller_pharmcy extends StatefulWidget {
  _Controller_pharmcyState createState() => _Controller_pharmcyState();
}

class _Controller_pharmcyState extends State<Controller_pharmcy> {
  LoginData loginData = LoginData();

  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  String x = "pharmcy";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UserLocalStorage.getUser().then((value) {
      setState(() {
        loginData = value;
        x = loginData.data.orgName;
      });
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation_drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: AppBar(
            backgroundColor: kMainColor,
            elevation: 0.01,
            title: Text(
              x ?? loginData.data.orgName,
              style: TextStyle(fontSize: 30.0, color: KIcons),
            ),
            centerTitle: true,
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
      // drawer: Drawer(),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 145),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kMainColor,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextField(
                        cursorColor: KIcons,
                        style: dropdownMenuItem,
                        decoration: InputDecoration(
                            hintText: "Search For The Medicines",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 16),
                            prefixIcon: Material(
                              elevation: 0.0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: Icon(Icons.search),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 13)),
                      ),
                    ),
                  ),
                ],
              ),

              // ignore: missing_return, missing_return
            ),
          ],
        ),
      ),
    );
  }
}
