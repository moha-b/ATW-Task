class UserModel {
  String userId;
  String? email;
  String? name;

  UserModel({
    required this.userId,
    this.email,
    this.name,
  });

  static final empty = UserModel(
    userId: "",
    email: "",
    name: "",
  );
  Map<String, dynamic> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
    };
  }

  static UserModel fromDocument(Map<String, dynamic> doc) {
    return UserModel(
      userId: doc['userId'],
      email: doc['email'],
      name: doc['name'],
    );
  }
}
