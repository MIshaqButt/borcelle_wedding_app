class UserModel {
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _birthday;
  String? _gender;
  bool? _verified;
  DateTime? _createdAt;
  String? _profilePic;

  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get birthday => _birthday;
  String? get gender => _gender;
  bool? get verified => _verified;
  DateTime? get createdAt => _createdAt;
  String? get profilePic => _profilePic;

  UserModel({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? birthday,
    String? gender,
    bool? verified,
    DateTime? createdAt,
    String? profilePic,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _birthday = birthday;
    _gender = gender;
    _verified = verified;
    _createdAt = createdAt;
    _profilePic = profilePic;
  }

  UserModel.fromJson(dynamic json) {
    if (json is Map) {
      _id = json["id"] as String?;
      _firstName = json["firstName"] as String?;
      _lastName = json["lastName"] as String?;
      _email = json["email"] as String?;
      _birthday = json["birthday"].toString();
      _gender = json["gender"].toString();
      _verified = json["verified"] as bool?;
      _createdAt = json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"].toString())
          : null;
      _profilePic = json["profilePic"] as String?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["id"] = _id;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["email"] = _email;
    map["birthday"] = _birthday;
    map["gender"] = _gender;
    map["verified"] = _verified;
    map["createdAt"] = _createdAt?.toString();
    map["profilePic"] = _profilePic;
    return map;
  }
}
