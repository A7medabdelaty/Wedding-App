class Profile{
  String ?name;
  String? password;
  String ?phoneNumber;
  String ?email;
  String ?profileId;
  String ? gender;
  String ?address;
  String ?governorate;
  String ?birthDate;
  String ?profilePic;
  String?authorization;



  Profile({
      this.name,
      this.password,
      this.phoneNumber,
      this.email,
      this.profileId,
      this.gender,
      this.address,
      this.governorate,
      this.birthDate,
      this.profilePic,
      this.authorization});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'photographerId': profileId,
      'gender': gender,
      'address': address,
      'governorate': governorate,
      'birthDate': birthDate,
      'profilePic': profilePic,
      'authorization': authorization,
    };
  }

}

