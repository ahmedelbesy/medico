class get_data_empolyee {
  int id;
  int mangerId;
  int employeeId;
  String name;
  String price;
  String createAt;
  String updateAt;
  String createFrom;

  get_data_empolyee(
      {this.id,
        this.mangerId,
        this.employeeId,
        this.name,
        this.price,
        this.createAt,
        this.updateAt,
        this.createFrom});

  get_data_empolyee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mangerId = json['manger_id'];
    employeeId = json['employee_id'];
    name = json['name'];
    price = json['price'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    createFrom = json['create_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['manger_id'] = this.mangerId;
    data['employee_id'] = this.employeeId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['create_at'] = this.createAt;
    data['update_at'] = this.updateAt;
    data['create_from'] = this.createFrom;
    return data;
  }
}
