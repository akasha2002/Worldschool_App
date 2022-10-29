import 'dart:convert';

LoginModel LoginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.loginUserName,
    required this.loginPassword,
    required this.userCode,
    required this.userType,
  });

  String loginUserName;
  String loginPassword;
  String userCode;
  String userType;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        loginUserName: json["login_user_name"],
        loginPassword: json["login_password"],
        userCode: json["user_code"],
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "login_user_name": loginUserName,
        "login_password": loginPassword,
        "user_code": userCode,
        "user_type": userType,
      };
}
