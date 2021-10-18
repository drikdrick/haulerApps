class User {
  String company, address, phone, email, username;

  User({
    required this.company,
    required this.address,
    required this.phone,
    required this.email,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      company: json["company_name"],
      address: json["address_1"],
      phone: json["phone_1"],
      email: json["email_kantor"],
      username: json["username"],
    );
  }
}
