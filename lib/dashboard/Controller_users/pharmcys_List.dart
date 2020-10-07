import 'package:flutter/material.dart';
import 'package:medicoo/NetWork/Models/get_data_user.dart';
import 'package:medicoo/NetWork/Repository/api.dart';
import 'package:medicoo/UI/Coustm_widget/constant.dart';

import 'package:medicoo/UI/Screens/drawer_user.dart';

// ignore: must_be_immutable, camel_case_types
class Pharmcys_List extends StatefulWidget {
  User_Data ID;
  User_Data Name;
  Pharmcys_List(this.ID,this.Name);

  @override
  _Pharmcys_ListState createState() => _Pharmcys_ListState();
}

class _Pharmcys_ListState extends State<Pharmcys_List> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.black, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: AppBar(
            backgroundColor: kMainColor,
            elevation: 0.01,
            title: Text(
              widget.Name.orgName.toString(),
              style: TextStyle(fontSize: 30.0, color: KIcons),
            ),
            centerTitle: true,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  padding: EdgeInsets.only(left: 30.0),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: KIcons,
                    size: 40,
                  ),
                  onPressed: () {
                  Navigator.pop(context);
                  },

                );
              },
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body:Container(
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
                  Expanded(
                    child:  Container(
                      child: FutureBuilder<dynamic>(
                        future: databaseHelper.getData(widget.ID.id.toString()),
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
class ItemList extends StatefulWidget {
  List list;

  ItemList({this.list});

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return ListView.builder(
        itemCount: widget.list == null ? 0 : widget.list.length,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: ListTile(
                title: Text(
                  'Name : ${widget.list[i]['name']}',
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
                  'Price : ${widget.list[i]['price']}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          );
        });
  }
}
