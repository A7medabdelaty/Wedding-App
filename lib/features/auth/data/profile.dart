class Profile{
  String ?name;
  String? password;
  String ?phoneNumber;
  String ?email;
  String ?photographerId;
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
      this.photographerId,
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
      'photographerId': photographerId,
      'gender': gender,
      'address': address,
      'governorate': governorate,
      'birthDate': birthDate,
      'profilePic': profilePic,
      'authorization': authorization,
    };
  }

}

