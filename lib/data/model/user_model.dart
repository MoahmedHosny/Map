class UserModel {
  String uid;
  String name;
  String email;
  String phoneNumber;
  String image;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.image,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'email': email,
      'phoneNumber': phoneNumber,
      'image': image,
    };
  }
}
