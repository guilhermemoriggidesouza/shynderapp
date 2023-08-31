import 'dart:ffi';

class User {
  User({
    required this.name,
    required this.email,
    required this.login,
    required this.password,
    this.userId,
    this.id,
    this.age,
    this.bio,
    this.facul,
    this.ocupation,
    this.facebook,
    this.instagram,
    this.twitter,
  });

  final String name;
  final String email;
  final String login;
  final String password;
  final String? id;
  final String? age;
  final String? userId;
  final String? bio;
  final String? facul;
  final String? ocupation;
  final String? facebook;
  final String? instagram;
  final String? twitter;

  User copyWith({
    String name = "",
    String login = "",
    String email = "",
    String password = "",
    String? age,
    String? id,
    String? userId,
    String? bio,
    String? facul,
    String? ocupation,
    String? facebook,
    String? instagram,
    String? twitter,
  }) {
    return User(
      id: this.id,
      userId: this.userId,
      password: this.password,
      name: this.name,
      login: this.login,
      email: this.email,
      age: this.age,
      bio: this.bio,
      facul: this.facul,
      ocupation: this.ocupation,
      facebook: this.facebook,
      instagram: this.instagram,
      twitter: this.twitter,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"] ?? "",
      userId: json["id"] ?? "",
      password: json["password"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      login: json["login"] ?? "",
      bio: json["bio"] ?? "",
      age: json["age"],
      facul: json["facul"] ?? "",
      ocupation: json["ocupation"] ?? "",
      facebook: json["facebook"] ?? "",
      instagram: json["instagram"] ?? "",
      twitter: json["twitter"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": userId,
        "name": name,
        "password": password,
        "email": email,
        "age": age,
        "login": login,
        "bio": bio,
        "facul": facul,
        "ocupation": ocupation,
        "facebook": facebook,
        "instagram": instagram,
        "twitter": twitter,
      };
}
