class User {
  String? id;
  String? firstName;
  String? lastName;
  String? middleName;

  String? tag;
  String? bvn;
  String? gender;
  String? dateOfBirth;
  String? email;
  String? phoneNumber;
  String? avatarUrl;

  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.bvn,
      this.dateOfBirth,
      this.email,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt,
      this.tag,
      this.gender,
      this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    middleName = json['middle_name'] ?? '';

    bvn = json['bvn'] ?? '';

    dateOfBirth = json['date_of_birth'] ?? '';
    email = json['email'] ?? '';
    gender = json['gender'] ?? '';
    avatarUrl = json['avatar_url'] ?? '';
    tag = json['tag'] ?? '';
    phoneNumber = json['phone_number'] ?? '';

    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middle_name'] = this.middleName;

    data['bvn'] = this.bvn;
    data['date_of_birth'] = this.dateOfBirth;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['tag'] = this.tag;
    data['gender'] = this.gender;
    data['avatar_url'] = this.avatarUrl;

    return data;
  }
}
