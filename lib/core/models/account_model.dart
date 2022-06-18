class AccountModel {
  String type;
  String name;
  String email;
  String password;

  AccountModel({
    required this.type,
    required this.name,
    required this.email,
    required this.password,
  });

  AccountModel.fromJson(Map<String, dynamic> json)
      : type = json['type'] ?? '',
        name = json['name'] ?? '',
        email = json['email'] ?? '',
        password = json['password'] ?? '';

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'type': type,
      'name': name,
      'email': email,
      'password': password,
    };
    return data;
  }
}
