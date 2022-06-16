class AccountModel {
  String type;

  String email;
  String password;

  AccountModel({
    required this.type,
    required this.email,
    required this.password,
  });

  AccountModel.fromJson(Map<String, dynamic> json)
      : type = json['type'] ?? '',
        email = json['email'] ?? '',
        password = json['password'] ?? '';

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'type': type,
      'email': email,
      'password': password,
    };
    return data;
  }
}
