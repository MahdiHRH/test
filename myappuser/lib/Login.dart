import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myappmahdi/Verifi.dart';
import 'package:myappmahdi/json.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'font.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  var T_mobile = TextEditingController();

  Future<void> DialogMessg(String Value) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            Value,
            textScaleFactor: 1,
            style: MyFontStyleSelect(context, "txt"),
            textDirection: TextDirection.rtl,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'تایید',
                textScaleFactor: 1,
                style: MyFontStyleSelect(context, "txt"),
                textDirection: TextDirection.rtl,
              ),
              onPressed: () {
                _btnController.reset();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 102, 239),
        elevation: 0,
        title: Center(
            child: Text(
          "Mahdi HRH",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'IranSans',
          ),
        )),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 86, 102, 239),
                boxShadow: [BoxShadow(blurRadius: 0)],
                borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 70.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 243,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "شماره همراه خود را وارد نمایید",
                          style: MyFontStyleSelect(context, "txt"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "مثال : *********09",textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'IranSans',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: T_mobile,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: const EdgeInsets.all(10.0),
                              isDense: false,
                              labelText: "شماره همراه",
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'IranSans',
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(width: 1, color: Colors.red),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0,left: 20),
                        child: RoundedLoadingButton(
                          // borderRadius: 5,
                          color: Color.fromARGB(255, 86, 102, 239),
                          child: Text('ارسال کد', style: MyFontStyleSelect(context, "btn")),
                          controller: _btnController,
                          onPressed: () {
                            if (T_mobile.text.length == 11) {
                              send_code(mobile: T_mobile.text);
                            } else {
                              DialogMessg("شماره همرا صحیح نمی باشد");
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              child: Container(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    "assets/vector.png",
                    fit: BoxFit.cover,
                  )),
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }

  void send_code({required String mobile}) async {
    var url = "http://www.instasekke.ir/myapptest/api.php?apicall=login";
    var body = Map<String, dynamic>();
    body["mobile"] = mobile;
    Response response = await post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      //successful

      var json_model = json.decode(utf8.decode(response.bodyBytes));
      var model = login_json(json_model["error"], json_model["message"]);

      if (model.error == false) {
        _btnController.success();

        Timer(Duration(seconds: 1), () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (
                context,
                animation,
                secondaryAnimation,
              ) =>
                  Verifi(
                mobile: T_mobile.text,
              ),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) =>
                  SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.ease,
                )),
                child: child,
              ),
            ),
          );
        });
      } else {
        DialogMessg(model.message);
        _btnController.error();
      }
    } else {
      //error
      _btnController.reset();
    }
  }
}
