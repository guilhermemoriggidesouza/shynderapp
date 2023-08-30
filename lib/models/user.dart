class User {
  User({
    required this.id,
    required this.userId,
    required this.name,
    required this.login,
    required this.bio,
    required this.facul,
    required this.ocupation,
    required this.facebook,
    required this.instagram,
    required this.twitter,
  });

  final String id;
  final String userId;
  final String name;
  final String login;
  final String bio;
  final String facul;
  final String ocupation;
  final String facebook;
  final String instagram;
  final String twitter;

  User copyWith({
    String id = "",
    String userId = "",
    String name = "",
    String login = "",
    String bio = "",
    String facul = "",
    String ocupation = "",
    String facebook = "",
    String instagram = "",
    String twitter = "",
  }) {
    return User(
      id: this.id,
      userId: this.userId,
      name: this.name,
      login: this.login,
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
      id: json["_id"],
      userId: json["id"],
      name: json["name"],
      login: json["login"],
      bio: json["bio"],
      facul: json["facul"],
      ocupation: json["ocupation"],
      facebook: json["facebook"],
      instagram: json["instagram"],
      twitter: json["twitter"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": userId,
        "name": name,
        "login": login,
        "bio": bio,
        "facul": facul,
        "ocupation": ocupation,
        "facebook": facebook,
        "instagram": instagram,
        "twitter": twitter,
      };
}
