import '/core/models/account_model.dart';

class UserModel {
  String email;
  String password;
  List<AccountModel> accounts = [];

  UserModel({
    required this.email,
    required this.accounts,
    required this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'] ?? '',
        password = json['password'] ?? '' {
    if (json['accounts'] != null) {
      accounts = <AccountModel>[];
      json['accounts'].forEach((v) {
        accounts.add(AccountModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'accounts': accounts.map((e) => e.toJson()).toList(),
      'email': email,
      'password': password,
    };
    return data;
  }
}

