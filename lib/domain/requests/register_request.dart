import 'dart:io';

class RegisterRequest {
  String? firstName;
  String? lastName;
  String? about;
  List<String>? tags;
  List<String>? preferredSocialMedia;
  String? salary;
  String? password;
  String? confirmPassword;
  String? email;
  String? birthDate;
  String? gender;
  String? typeId;
  File? avatar;

  RegisterRequest(
      {this.firstName,
      this.lastName,
      this.about,
      this.tags,
      this.preferredSocialMedia,
      this.salary,
      this.password,
      this.confirmPassword,
      this.email,
      this.birthDate,
      this.gender,
      this.typeId,
      this.avatar});
}
