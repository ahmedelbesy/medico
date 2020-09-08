import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicoo/Api/model_login_employee.dart';
import 'package:medicoo/Produt_Employee/adddata.dart';
import 'package:medicoo/Produt_Employee/showdata.dart';
import 'package:medicoo/screen/loginScreen.dart';
import 'package:medicoo/widget/constant.dart';
import '../Api/api.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  LoginEmployee loginEmployee = LoginEmployee();

  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: AppBar(

              backgroundColor: kMainColor,
              elevation: 0.01,
              title: Text(
                login_Employee.User.toString(),
                style: TextStyle(fontSize: 30.0, color: KIcons),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                   height: 10,
                    child: RaisedButton(
                      onPressed: (){

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Page()));
                      },
                      color: KIcons,
                      child: new Text(
                        'Logout',
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 15),
                      ),

                    ),
                  ),
                ),
              ],
              centerTitle: true,

            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kMainColor,
          child: Icon(
            Icons.add,
            color: KIcons,
          ),
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
            builder: (BuildContext context) => AddData(),
          )),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 110),
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
                    height: 40,
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
                  Expanded(
                    child: FutureBuilder<dynamic>(

                      future: databaseHelper
                          .getData(login_Employee.Manger_Id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? ItemList(list: snapshot.data)
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
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

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap:
                () => Navigator.of(context).push(
                MaterialPageRoute(

                    builder: (BuildContext context) => ShowData(
                          list: list,
                          index: i,
                        )),
              ),

              child: Card(
                child: ListTile(
                  title: Text(
                    list[i]['name'],
                    style: TextStyle(fontSize: 20.0),
                    maxLines: 2,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFe2faf8),
                    child: Image.asset(
                      "asset/images/pharmacy.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  subtitle: Text(
                    'Price : ${list[i]['price']}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
