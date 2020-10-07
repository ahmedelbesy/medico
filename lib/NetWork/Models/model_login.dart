import 'package:shared_preferences/shared_preferences.dart';

class LoginData {
  String msg;
  String token;
  String key;
  Data data;

  LoginData({this.msg, this.token, this.key, this.data});

  LoginData.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    token = json['token'];
    key = json['key'];
    data = json['data'] != null ? new Data.fromJson(json['data']) :  null;
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
  String orgName;
  String name;
  String orgPhone;
  String job;
  String location;
  int orgTypeId;

  Data(
      {this.id,
        this.user,
        this.orgName,
        this.name,
        this.orgPhone,
        this.job,
        this.location,
        this.orgTypeId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    orgName = json['org_name'];
    name = json['name'];
    orgPhone = json['org_phone'];
    job = json['job'];
    location = json['location'];
    orgTypeId = json['org_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['org_name'] = this.orgName;
    data['name'] = this.name;
    data['org_phone'] = this.orgPhone;
    data['job'] = this.job;
    data['location'] = this.location;
    data['org_type_id'] = this.orgTypeId;
    return data;
  }
}


class UserLocalStorage {

  static Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear() ;
    return true ;
  }
  static Future<bool> logIn(LoginData user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setInt("id", user.data.id);
      await prefs.setString("user", user.data.user);
      await prefs.setString("org_name", user.data.orgName);
      await prefs.setString("name", user.data.name);
      await prefs.setString("org_phone", user.data.orgPhone);
      await prefs.setString("job", user.data.job);
      await prefs.setString("location", user.data.location);
      await prefs.setInt("org_type_id", user.data.orgTypeId);

      return true ;
    }catch(Excption){
      print("save to shared faild   :  $Excption");
      return false ;
    }
  }
  static Future< LoginData > getUser () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Data data= Data();
    data.id=prefs.getInt("id");
    data.user=prefs.getString("user");
    data.orgName=prefs.getString("org_name");
    data.name=prefs.getString("name");
    data.orgPhone=prefs.getString("org_phone");
    data.job=prefs.getString("job");
    data.location=prefs.getString("location");
    data.orgTypeId=prefs.getInt("org_type_id");
        return LoginData(
     
      data:data,
    );
  }
}

