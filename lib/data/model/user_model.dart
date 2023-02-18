class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.gender,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String imageUrl;
  String gender;

  String get fullname => this.firstName + " " + this.lastName;

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json[UserKey.login][UserKey.uid] ?? "",
        firstName = json[UserKey.name][UserKey.first] ?? "",
        lastName = json[UserKey.name][UserKey.last] ?? "",
        email = json[UserKey.email] ?? "",
        phone = json[UserKey.phone] ?? "",
        imageUrl = json[UserKey.picture][UserKey.large] ?? "",
        gender = json[UserKey.gender] ?? "";
}

class UserKey {
  static const login = "login";
  static const uid = "uid";
  static const name = "name";
  static const email = "email";
  static const first = "first";
  static const last = "last";
  static const phone = "phone";
  static const picture = "picture";
  static const medium = "medium";
  static const large = "large";
  static const gender = "gender";

  static const results = "results";
}