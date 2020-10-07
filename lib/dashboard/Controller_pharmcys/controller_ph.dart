import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicoo/NetWork/Models/model_login.dart';
import 'package:medicoo/NetWork/Repository/api.dart';
import 'package:medicoo/UI/Coustm_widget/constant.dart';
import 'package:medicoo/UI/Screens/drawer_pharmcys.dart';



// ignore: camel_case_types
class Controller_pharmcy extends StatefulWidget {
  _Controller_pharmcyState createState() => _Controller_pharmcyState();
}

// ignore: camel_case_types
class _Controller_pharmcyState extends State<Controller_pharmcy> {
  LoginData loginData = LoginData();

  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  String x = "pharmcy";
  DatabaseHelper databaseHelper = new DatabaseHelper();

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
      drawer: Navigation_drawer_pharmcys(),
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

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
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
                      child: FutureBuilder<dynamic>(
                        future: databaseHelper.getData(login_Api.Id.toString()),
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Material(

                    child: Container(

                      child: ListView(

                        padding:  EdgeInsets.only(
                            top: 180, left: 12.0, right: 12.0, bottom: 12.0),

                        children: <Widget>[


                          Container(
                            height: 50,
                            child: new Text(
                              "Name : ${widget.list[i]['name']}",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              maxLines: 2,
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.only(top: 10.0),
                          ),
                          Container(
                            height: 50,
                            child: new Text(
                              " Price : ${widget.list[i]['price']}",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.only(top: 30.0),
                          ),
                          Container(
                            height: 50,
                            child: new Text(
                              " Created at : ${widget.list[i]['create_at']}",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: KIcons),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: new Text(
                              " Updated at : ${widget.list[i]['update_at']}",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: KIcons),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: new Text(
                              " Create_from: ${widget.list[i]['create_from']}",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: KIcons),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: new FlatButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(),

                              color: KButton,
                              child: new Text(
                                'Back',
                                style: new TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
              },
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
            ),
          );
        });
  }
}
