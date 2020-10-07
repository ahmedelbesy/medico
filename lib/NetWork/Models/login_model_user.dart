import 'package:shared_preferences/shared_preferences.dart';

class Login_User {
  String msg;
  String token;
  String key;
  Data data;

  Login_User({this.msg, this.token, this.key, this.data});

  Login_User.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    token = json['token'];
    key = json['key'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['token'] = this.token;
    data['key'] = this.key;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String user;
  String name;
  String phone;
  String email;

  Data({this.id, this.user, this.name, this.phone, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}
class UserLocalStorageU {

  static Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear() ;
    return true ;
  }
  static Future<bool> logIn(Login_User user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setInt("id", user.data.id);
      await prefs.setString("user", user.data.user);
      await prefs.setString("name", user.data.name);
      await prefs.setString("phone", user.data.phone);
      await prefs.setString("email", user.data.email);

      return true ;
    }catch(Excption){
      print("save to shared faild   :  $Excption");
      return false ;
    }
  }
  static Future< Login_User > getUser () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Data data= Data();
    data.id=prefs.getInt("id");
    data.user=prefs.getString("user");

    data.name=prefs.getString("name");
    data.phone=prefs.getString("phone");
    data.email=prefs.getString("job");

    return Login_User(
      token: prefs.getString('token'),
      key: prefs.getString("key"),
      data:data,
    );
  }
}
