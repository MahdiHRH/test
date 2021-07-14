import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myappmahdi/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'json.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool C_Login = false;
  String mobile = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.indigo,
        child: Center(
          child: Text(
            "Mahdi HRH",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }

  Future<void> Check() async {
    await getmobile();
    if (C_Login == false) {
      Splash("no");
    } else if (C_Login == true) {
      checklogin(mobile: mobile);
    }
  }

  getmobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('sts') == false) {
      C_Login == false;
    } else if (prefs.getString('sts') == "yes") {
      if (prefs.getString('mobile') != null) {
        C_Login = true;
        mobile = prefs.getString('mobile').toString();
      }
    }
  }

  void Splash(String value) async {
    if (value == "no") {
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
    } else if (value == "yes") {
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Home(
          mobile: mobile,
        );
      }));
    }
  }

  void checklogin({
    required String mobile,
  }) async {
    var url = "http://www.instasekke.ir/myapptest/api.php?apicall=check_login";
    var body = Map<String, dynamic>();
    body["mobile"] = mobile;

    Response response = await post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      //successful

      var json_model = json.decode(utf8.decode(response.bodyBytes));
      var model = login_check(json_model["error"], json_model["login"]);

      if (model.error == true) {
        if (model.login == false) {
          Splash("no");
        }
      } else if (model.error == false) {
        if (model.login == true) {
          Splash("yes");
        }
      }
    } else {
      //error

    }
  }
}
