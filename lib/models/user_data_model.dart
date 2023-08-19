// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  String uid;
  String email;
  String userNmae;
  String phoneNum;
  UserData({
    required this.uid,
    required this.email,
    required this.userNmae,
    required this.phoneNum,
  });

  Map<String, dynamic> userToMap() {
    return {'email': email, 'userName': userNmae, 'phoneNum': phoneNum};
  }
}
