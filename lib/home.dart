import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myappmahdi/Login.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final String mobile;

  Home({required this.mobile});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 102, 239),
        centerTitle: true,
        title: Center(child: Text("خانه")),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("خوش آمدید",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'IranSans',
                )),
            SizedBox(
              height: 70,
            ),
            RoundedLoadingButton(
              // borderRadius: 5,
              color: Color.fromARGB(255, 86, 102, 239),
              child: Text('خروج از حساب کاربری',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'IranSans',
                  )),
              controller: _btnController,
              onPressed: () {
                logout(mobile: widget.mobile);
              },
            ),
          ],
        ),
      ),
    );
  }

  void logout({
    required String mobile,
  }) async {
    var url = "http://www.instasekke.ir/myapptest/api.php?apicall=logout";
    var body = Map<String, dynamic>();
    body["mobile"] = mobile;
    Response response = await post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      //successful

      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
    } else {
      //error
      _btnController.reset();
    }
  }
}
