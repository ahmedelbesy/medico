


class User_Data {
  int id;
  String orgName;
  String location;

  User_Data({this.id, this.orgName, this.location});

  User_Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orgName = json['org_name'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['org_name'] = this.orgName;
    data['location'] = this.location;
    return data;
  }

}