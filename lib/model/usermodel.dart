class User {
  String? id;
  String? firstName;
  String? lastName;
  String? middleName;
  bool? isActivated;
  String? tag;
  String? bvn;
  String? gender;
  String? dateOfBirth;
  String? email;
  String? phoneNumber;
  String? avatarUrl;
  bool? emailConfirmed;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.isActivated,
      this.bvn,
      this.dateOfBirth,
      this.email,
      this.phoneNumber,
      this.emailConfirmed,
      this.createdAt,
      this.updatedAt,
      this.tag,
      this.gender,
      this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] : '';
    firstName = json['first_name'] != null ? json['first_name'] : '';
    lastName = json['last_name'] != null ? json['last_name'] : '';
    middleName = json['middle_name'] != null ? json['middle_name'] : '';
    isActivated = json['is_activated'] ?? '';
    bvn = json['bvn'] ?? '';

    dateOfBirth = json['date_of_birth'] ?? '';
    email = json['email'] ?? '';
    gender = json['gender'] ?? '';
    avatarUrl = json['avatar_url'] ?? '';
    tag = json['tag'] ?? '';
    phoneNumber = json['phone_number'] ?? '';
    emailConfirmed = json['email_confirmed'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middle_name'] = this.middleName;
    data['is_activated'] = this.isActivated;
    data['bvn'] = this.bvn;
    data['date_of_birth'] = this.dateOfBirth;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['email_confirmed'] = this.emailConfirmed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['tag'] = this.tag;
    data['gender'] = this.gender;
    data['avatar_url'] = this.avatarUrl;

    return data;
  }
}
