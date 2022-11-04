import 'dart:convert';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myapp/home/home.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/staff_home_page.dart';

import 'login_body_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isloading = false;
  var emailController = TextEditingController();
  var passController = TextEditingController();

  void loading() {
    setState(() {
      isloading = !isloading;
    });
  }

  loadings() {
    return EasyLoading.show(status: 'loading...');
  }

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isloading,
      blurEffectIntensity: 4,
      progressIndicator: CircularProgressIndicator(
        color: Colors.green,
      ),
      dismissible: false,
      opacity: 0.4,
      color: Colors.black,
      child: Scaffold(
        backgroundColor: const Color(0xff65F9CE),
        body: LoginBody(
          loginn: loginn,
          passController: passController,
          emailController: emailController,
        ),
      ),
    );
  }

  var jsonData;
  var HomejsonData;
  var HomeStaffjsonDataz;

  Future<void> loginn() async {
    loading();

    print(emailController.text);
    print(passController.text);

    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.get(Uri.parse(
          "http://10.0.2.2:8090/api/login/${emailController.text}/${passController.text}"));
      if (response.body.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Wrong Password")));
        loading();
      }

      jsonData = jsonDecode(response.body);

      print(response.statusCode);
      print(jsonData);

      if (jsonData[0]["user_type"].toString() == "student".toString()) {
        var response2 = await http.get(Uri.parse(
            "http://10.0.2.2:8090/api/student/${jsonData[0]["user_code"].toString()}"));
        HomejsonData = jsonDecode(response2.body);
        print(HomejsonData);
      } else if (jsonData[0]["login_user_name"].toString().isNotEmpty &&
          jsonData[0]["user_type"].toString() == "staff") {
        var response3 = await http.get(Uri.parse(
            "http://10.0.2.2:8090/api/staff/${jsonData[0]["user_code"].toString()}"));
        print("staff status code ${response3.statusCode}");
        HomeStaffjsonDataz = jsonDecode(response3.body);

        print("staff data ${HomeStaffjsonDataz}");

        //print(jsonData[0]["login_user_name"]);
      } else {
        print("Failed to connect");
      }
      //data = response.data.toString();
      print(jsonData);
      //LoginModel.fromJson(jsonData);
      print(jsonData[0]["login_user_name"]);

      if (response.statusCode == 200) {
        if (jsonData[0]["login_user_name"] == emailController.text &&
            jsonData[0]["login_password"] == passController.text) {
          if (jsonData[0]["user_type"].toString() == "student".toString()) {
            emailController.clear();
            passController.clear();
            Navigator.push(
                (context),
                MaterialPageRoute(
                    builder: (context) => MyHomePage(jsonData, HomejsonData)));
            loading();
          } else if (jsonData[0]["user_type"].toString() == "staff") {
            emailController.clear();
            passController.clear();
            Navigator.push(
                (context),
                MaterialPageRoute(
                    builder: (context) =>
                        MyStaffHomePage(jsonData, HomeStaffjsonDataz)));
            loading();
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Field not allowed")));
    }

    //EasyLoading.dismiss();
  }
}
