
import 'package:http/http.dart' as http;
import 'package:medicoo/Api/login_model_user.dart';


import 'package:medicoo/Api/model_login_employee.dart';
import 'package:medicoo/Api/model_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'linkapi.dart';

// ignore: camel_case_types
class login_Api {
  // ignore: non_constant_identifier_names
  Future<bool> login(String user, String password) async {
    String authApi = base_api + login_api;
    Map<String, String> body = {
      "user": user,
      "password": password,
    };

    var response = await http.post(authApi, body: body);

    if (response.statusCode == 200) {
      try {
        var jsonData = jsonDecode(response.body);
        final prefs =await SharedPreferences .getInstance();
        prefs.setString("logintype", jsonData["key"]);
        prefs.setString("token", jsonData["token"]);
        if(jsonData["key"]=="manger"){
          var res = LoginData.fromJson(jsonData);
          UserLocalStorage.logIn(res);

          return true;
        }else if(jsonData["key"]=="user"){
          var res = Login_User.fromJson(jsonData);
          UserLocalStorageU.logIn(res);
          return true;
        }

      } catch (Exception) {
        print(Exception);

        return false;
      }
    } else {
      print(response.body);
    }
    return false;
  }
}

// ignore: camel_case_types
class Registrastion_User {
  // ignore: non_constant_identifier_names
  Future<bool> registrastion_User(
    String user,
    String name,
    String phone,
    String email,
    String password,
  ) async {
    String authApi = base_api + registrastion_user;

    Map<String, String> body = {
      "user": user,
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
    };
    var response = await http.post(authApi, body: body);
    if (response.statusCode == 200) {
      try {
        var jsonData = jsonDecode(response.body);
        var token = jsonData["token"];
        print("token:" "$token");
        var key = jsonData["key"];
        print("key:" "$key");
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", token);
        return true;
      } catch (Exception) {
        return false;
      }
    } else {
      print(response.body);
    }
    return false;
  }
}

// ignore: camel_case_types
class Registrastion_org {
  // ignore: non_constant_identifier_names
  Future<bool> registrastion_Org(
    String user,
    String org_name,
    String name,
    String org_phone,
    String job,
    String password,
    String location,
    String org_type_id,
  ) async {
    String authApi = base_api + registrastion_org;

    Map<String, String> body = {
      "user": user,
      "org_name": org_name,
      "name": name,
      "org_phone": org_phone,
      "job": job,
      "password": password,
      "location": location,
      "org_type_id": org_type_id,
    };
    var response = await http.post(authApi, body: body);
    if (response.statusCode == 200) {
      try {
        var jsonData = jsonDecode(response.body);
        var token = jsonData["token"];
        print("token:" "$token");
        var key = jsonData["key"];
        print("key:" "$key");

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", token);

        return true;
      } catch (Exception) {
        return false;
      }
    } else {
      print(response.body);
    }
    return false;
  }
}

class Registrastion_Employee {
  Future<bool> registrastion_User(
    String user,
    String password,
    String manger_id,
    String employee_type_id,
    String create_from,
  ) async {
    String authApi = base_api + Registrastion_Employeee;
    Map<String, String> body = {
      "user": user,
      "password": password,
      "manger_id": manger_id,
      "employee_type_id": employee_type_id,
      "create_from": create_from,
    };
    final prefs =await SharedPreferences .getInstance();
    var value =  prefs.getString("token");
print("token1:$value");

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    };
    var response = await http.post(authApi, body: body, headers: headers);
    if (response.statusCode == 200) {
      try {
        var jsonData = jsonDecode(response.body);
        var token = jsonData["token"];
        print("token:" "$token");

        return true;
      } catch (Exception) {
        return false;
      }
    } else {
      print(response.body);
    }
    return false;
  }
}

class login_Employee {
  static var TokenEmployee;
  static var Manger_Id;
  static var User;
  static var Create_from;
  static var Employee_id;
  Future<bool> login(String user, String password) async {
    String authApi = base_api + login_emoloyee;
    Map<String, String> body = {
      "user": user,
      "password": password,
    };
    var response = await http.post(authApi, body: body);
    if (response.statusCode == 200) {
            try {
        var jsonData = jsonDecode(response.body);
        final prefs =await SharedPreferences .getInstance();
        prefs.setString("logintype", jsonData["key"]);
        prefs.setString("token", jsonData["token"]);
        prefs.setString("user", jsonData["user"]);
        prefs.setInt("manger_id", jsonData["manger_id"]);
        prefs.setInt("create_from", jsonData["create_from"]);
        prefs.setInt("employee_id", jsonData["employee_id"]);
        var res = LoginEmployee.fromJson(jsonData);
        UserLocalStorageE.logIn(res);
        TokenEmployee = prefs.getString("token");
       Manger_Id=prefs.getInt("manger_id");
        Employee_id=prefs.getInt("employee_id");
        Create_from=prefs.getString("create_from");
        User=prefs.getString("user");
        return true;
      } catch (Exception) {
        print(Exception);

        return false;
      }
    } else {
      print(response.body);
    }
    return false;
  }
}

class DatabaseHelper {
//  Future<List> getData() async {
//    String myUrl = base_api + Getdata;
//    http.Response response = await http.get(
//      myUrl,
//    );
//    return json.decode(response.body);
//  }
  Future<dynamic> getData(String manger_id) async {
    var value=login_Employee.TokenEmployee;
    String myUrl = base_api + finddata;
    http.Response response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "manger_id": "$manger_id",

    });
    if(response.statusCode==200){
      var jsondata=jsonDecode(response.body);
      // ignore: non_constant_identifier_names

      return jsondata;
    }else{
      print('Response status1 : ${response.statusCode}');
    }
    
  }

  void deleteData(String id, String employee_id) async {
    var value = login_Employee.TokenEmployee;

    String myUrl = base_api + Delete_Data;
    http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    },body: {
      "id": "$id",
      "employee_id": "$employee_id",
         }
    ).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void addData( String manger_id, String employee_id,String name, String price,
      String create_from) async {
    var value = login_Employee.TokenEmployee;

    String myUrl = base_api + AddData;
    http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "manger_id": "$manger_id",
      "employee_id": "$employee_id",
      "name": "$name",
      "price": "$price",
      "create_from": "$create_from",
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void editData(String id, String employee_id, String name, String price) async {
    var value = login_Employee.TokenEmployee;
    String myUrl = base_api + Update;
    http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "id": "$id",
      "employee_id": "$employee_id",
      "name": "$name",
      "price": "$price",
          }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
}
