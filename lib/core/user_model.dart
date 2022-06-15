class UserModel {
  String? email;
  List<Google>? google;
  String? password;

  UserModel({this.email, this.google, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    if (json['google'] != null) {
      google = <Google>[];
      json['google'].forEach((v) {
        google!.add(Google.fromJson(v));
      });
    }
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    if (google != null) {
      data['google'] = google!.map((v) => v.toJson()).toList();
    }
    data['password'] = password;
    return data;
  }
}

class Google {
  String? email;
  String? password;

  Google({this.email, this.password});

  Google.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
