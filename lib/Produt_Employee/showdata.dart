import 'package:flutter/material.dart';
import 'package:medicoo/Api/model_login.dart';
import 'package:medicoo/Api/model_login_employee.dart';
import 'package:medicoo/Produt_Employee/dashboard.dart';
import 'package:medicoo/Produt_Employee/editdata.dart';

import 'package:medicoo/widget/constant.dart';
import '../Api/api.dart';

// ignore: must_be_immutable
class ShowData extends StatefulWidget {
  List list;
  int index;

  ShowData({this.index, this.list});
  @override
  ShowDataState createState() => ShowDataState();
}

class ShowDataState extends State<ShowData> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  LoginEmployee loginEmployee = LoginEmployee();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UserLocalStorageE.getUser().then((value) {
      setState(() {
        loginEmployee = value;

      });
    });
  }
 // ignore: non_constant_identifier_names
 var employee_id= login_Employee.Employee_id.toString();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: KIcons,
          ),
          backgroundColor: kMainColor,
          elevation: 0.01,
          centerTitle: true,
          title: Text(
            loginEmployee.user.toString() ,
            style: TextStyle(fontSize: 30.0, color: KIcons),
          ),
          actions: <Widget>[],
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new Text(
                  "Name : ${widget.list[widget.index]["name"]}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  maxLines: 2,
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 10.0),
              ),
              Container(
                height: 50,
                child: new Text(
                  " Price : ${widget.list[widget.index]['price']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 30.0),
              ),
              Container(
                height: 50,
                child: new Text(
                  " Created at : ${widget.list[widget.index]['create_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, color: KIcons),
                ),
              ),
              Container(
                height: 50,
                child: new Text(
                  " Updated at : ${widget.list[widget.index]['update_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, color: KIcons),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: new FlatButton(
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            EditData(list: widget.list, index: widget.index),
                      )),
                      color: KButton,
                      child: new Text(
                        'Edit',
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    child: new FlatButton(
                      onPressed: () {

                        databaseHelper.deleteData(
                          widget.list[widget.index]['id'].toString(),
                          employee_id.toString(),
                        );
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>  Dashboard(),
                        ));
                      },
                      color: Colors.red,
                      child: new Text(
                        'Delete',
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
