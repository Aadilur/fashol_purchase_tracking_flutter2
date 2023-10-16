class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? created;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.created});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['created'] = created;
    return data;
  }
}
