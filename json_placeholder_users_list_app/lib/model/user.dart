class User {
  String name;
  String username;
  String phone;
  String website;
  User({
    required this.name,
    required this.website,
    required this.username,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      website: json['website'],
      username: json['username'],
      phone: json['phone'],
    );
  }
}
