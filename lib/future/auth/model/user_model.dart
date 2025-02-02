class UserModel {
  int? id;
  String? name;
  String? nickname;
  String? image;
  String? phoneNumber;
  String? email;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.image,
    this.phoneNumber,
    this.email,
    this.nickname,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phoneNumber = json['phone_number'];
    nickname = json['nickname'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['nickname'] = nickname;
    data['token'] = token;
    return data;
  }
}
