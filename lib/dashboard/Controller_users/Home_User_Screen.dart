import 'package:flutter/material.dart';
import 'package:medicoo/Dashboard/Controller_users/pharmcys_List.dart';
import 'package:medicoo/NetWork/Models/get_data_user.dart';
import 'package:medicoo/NetWork/Repository/api.dart';

import 'package:medicoo/UI/Coustm_widget/constant.dart';

import 'package:medicoo/UI/Screens/drawer_user.dart';

// ignore: camel_case_types
class Home_User_Screen extends StatefulWidget {

  List<User_Data> _notes = List<User_Data>();
  List<User_Data> _notesForDisplay = List<User_Data>();


  @override
  _Home_User_ScreenState createState() => _Home_User_ScreenState();
}

// ignore: camel_case_types
class _Home_User_ScreenState extends State<Home_User_Screen> {
  int x = 0;

  // ignore: non_constant_identifier_names
  GET_USER get_user = GET_USER();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // ignore: unnecessary_statements
    get_user.get_Data_user().then((value) {
      setState(() {
        widget._notes.addAll(value);
        widget._notesForDisplay=widget._notes;

      });
    });
  }

  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.09),
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
                        tooltip: MaterialLocalizations.of(context)
                            .openAppDrawerTooltip,
                      );
                    },
                  ),
                ),
              ),
            ),
            drawer: Navigation_drawer_user(),
            backgroundColor: Color(0xFFC9FEEA),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      height: 150,
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "MEDI",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "CO",
                                    style: TextStyle(
                                        fontSize: 35,
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
                            padding:
                                const EdgeInsets.only(left: 7.0, right: 5.0),
                            child: Container(
                              height: 250,
                              width: 190,
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
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                      elevation: 10.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextField(
                        onChanged: (text){
                          text=text.toLowerCase();
                          setState(() {
                            widget._notesForDisplay=widget._notes.where((note) {
                              var noteTitle = note.orgName.toLowerCase();
                              return noteTitle.contains(text);
                            }).toList();
                          });
                        },
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
                              child:
                                Icon(Icons.search),


                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 13)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: double.infinity,
                      child: FutureBuilder<List<User_Data>>(
                          future: get_user.get_Data_user(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount:snapshot.data.length=widget._notesForDisplay.length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (c) => Pharmcys_List(
                                                    snapshot.data[i],
                                                    snapshot.data[i])));
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        child: ListTile(
                                          title: Text(
                                            'Name : ${widget._notesForDisplay[i].orgName}',
                                            style: TextStyle(fontSize: 20.0),
                                            maxLines: 2,
                                          ),
                                          leading: CircleAvatar(
                                            backgroundColor: Color(0xFFe2faf8),
                                            child: Image.asset(
                                              "asset/images/logo.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          subtitle: Text(
                                            'Location : ${widget._notesForDisplay[i].location}',
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text("Sorry");
                            }
                            return Center(
                                child: Container(
                                    child: CircularProgressIndicator()));
                          }),
                    ),
                  ),


                ],
              ),
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
                    icon: Icon(Icons.notifications),
                    title: Text("notifications")),
              ],
              onTap: (int y) {
                setState(() {
                  x = y;
                });
              },
              currentIndex: x,
              type: BottomNavigationBarType.fixed,
              fixedColor: KIcons,
            )),
      ],
    );
  }
}

