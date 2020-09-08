import 'package:shared_preferences/shared_preferences.dart';

class LoginEmployee {
  String msg;
  String token;
  String key;
  int type;
  int mangerId;
  int employeeId;
  String user;

  LoginEmployee(
      {this.msg,
        this.token,
        this.key,
        this.type,
        this.mangerId,
        this.employeeId,
        this.user});

  LoginEmployee.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    token = json['token'];
    key = json['key'];
    type = json['type'];
    mangerId = json['manger_id'];
    employeeId = json['employee_id'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['token'] = this.token;
    data['key'] = this.key;
    data['type'] = this.type;
    data['manger_id'] = this.mangerId;
    data['employee_id'] = this.employeeId;
    data['user'] = this.user;
    return data;
  }
}
class UserLocalStorageE {

  static Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear() ;
    return true ;
  }
  static Future<bool> logIn(LoginEmployee user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString("key", user.key);
      await prefs.setInt("type", user.type);
      await prefs.setInt("employee_id", user.employeeId);
      await prefs.setString("user", user.user);
      await prefs.setInt("manger_id", user.mangerId);


      return true ;
    }catch(Excption){
      print("save to shared faild   :  $Excption");
      return false ;
    }
  }
  static Future< LoginEmployee > getUser () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginEmployee data= LoginEmployee();
    data.msg=prefs.getString("msg");
    data.type=prefs.getInt("type");
    data.employeeId=prefs.getInt("employee_id");
    data.user=prefs.getString("user");
    data.mangerId=prefs.getInt("manger_id");
   
    return LoginEmployee(
      token: prefs.getString('token'),
      key: prefs.getString("key"),
      msg: prefs.getString("msg"),
      employeeId: prefs.getInt("employee_id"),
      mangerId: prefs.getInt("manger_id"),
      type: prefs.getInt("type"),
      user: prefs.getString("user"),
      
    );
  }
}