import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Forgot_Password/get_otp.dart';
import 'package:myapp/home.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/staff_home_page.dart';

class Login extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff65F9CE),
      body: !isloading
          ? Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  SizedBox(height: 40),
                  Icon(Icons.school, color: Colors.black, size: 140),
                  SizedBox(height: 13),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "sign in to continue",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) => !input.toString().contains("@")
                          ? "Email id should be valid"
                          : null,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        // border: InputBorder.,
                        prefixIcon: Icon(Icons.person_outlined, size: 30),
                        labelText: "USER NAME",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.green[400],
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      controller: passController,
                      keyboardType: TextInputType.text,
                      validator: (input) => input.toString().length < 3
                          ? "Email id should be valid"
                          : null,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                          // border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock, size: 30),
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.green[400],
                            fontWeight: FontWeight.w800,
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => Get_Otp()));
                        },
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          textStyle: TextStyle(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          loginn();
                          // emailController.clear();a
                          // passController.clear();
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ))),
            )
          : Center(
              child: CircularProgressIndicator(
              color: Colors.brown,
              backgroundColor: Colors.white,
              strokeWidth: 6,
            )),
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

      print(response.statusCode);

      jsonData = jsonDecode(response.body);
      print(jsonData);
      if (jsonData[0]["user_type"].toString() == "Student".toString()) {
        var response2 = await http.get(Uri.parse(
            "http://10.0.2.2:8090/api/student/${jsonData[0]["user_code"].toString()}"));
        HomejsonData = jsonDecode(response2.body);
        print(HomejsonData);
      } else if (jsonData[0]["login_user_name"].toString().isNotEmpty &&
          jsonData[0]["user_type"].toString() == "Staff") {
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
          if (jsonData[0]["user_type"].toString() == "Student".toString()) {
            emailController.clear();
            passController.clear();
            Navigator.push(
                (context),
                MaterialPageRoute(
                    builder: (context) => MyHomePage(jsonData, HomejsonData)));
          } else if (jsonData[0]["user_type"].toString() == "Staff") {
            emailController.clear();
            passController.clear();
            Navigator.push(
                (context),
                MaterialPageRoute(
                    builder: (context) =>
                        MyStaffHomePage(jsonData, HomeStaffjsonDataz)));
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
    loading();
  }
}
