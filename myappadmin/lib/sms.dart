import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart';

import 'font.dart';
import 'json.dart';

class SMS extends StatefulWidget {
  @override
  _SMSState createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  var T_username = TextEditingController();
  var T_password = TextEditingController();
  var T_bodyId = TextEditingController();
  var T_url = TextEditingController();

  List<sms_json> smsjson = [];

  void ToastShow(String value) {
    showToast(value,
        textStyle: TextStyle(fontSize: 15.0, fontFamily: 'IranSans', color: Colors.white),
        context: context,
        backgroundColor: Colors.black87,
        textDirection: TextDirection.rtl,
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.center,
        animDuration: Duration(seconds: 1),
        duration: Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    smsgetapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 102, 239),
        centerTitle: true,
        title: Text(
          "تنظیمات سرویس sms",
          textDirection: TextDirection.rtl,
          style: MyFontStyleSelect(context, "titr"),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFieldMy(T_username),
                      ),
                    ),
                    Container(
                      child: Text(
                        "نام کاربری :",
                        style: MyFontStyleSelect(context, "txt"),
                        textScaleFactor: 1.0,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFieldMy(T_password),
                      ),
                    ),
                    Container(
                      child: Text(
                        "رمز :",
                        style: MyFontStyleSelect(context, "txt"),
                        textScaleFactor: 1.0,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFieldMy(T_bodyId),
                      ),
                    ),
                    Container(
                      child: Text(
                        "کد پیام :",
                        style: MyFontStyleSelect(context, "txt"),
                        textScaleFactor: 1.0,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "آدرس سرویس :",
                        style: MyFontStyleSelect(context, "txt"),
                        textScaleFactor: 1.0,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFieldMy(T_url),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      smsset(username: T_username.text, password: T_password.text, urlapi: T_url.text, bodyId: T_bodyId.text);
                    },
                    child: Text(
                      "ثبت",
                      style: MyFontStyleSelect(context, "btn"),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget TextFieldMy(var controll) {
    return TextField(
      controller: controll,
      textAlign: TextAlign.center,
      style: MyFontStyleSelect(context, "textfield"),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.all(10.0),
        isDense: true,
      ),
    );
  }

  void smsgetapi() async {
    var url = "http://www.instasekke.ir/myapptest/admin/api.php?apicall=sms_api_get";
    var body = Map<String, dynamic>();

    Response response = await post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      //successful

      var infoJson = json.decode(utf8.decode(response.bodyBytes));
      var model = sms_json(infoJson["id"], infoJson["username"], infoJson["password"], infoJson["url"], infoJson["bodyId"]);

      setState(() {
        T_username.text = model.username;
        T_password.text = model.password;
        T_bodyId.text = model.bodyId;
        T_url.text = model.url;
      });
    } else {
      //error

    }
  }

  void smsset({
    required String username,
    required String password,
    required String urlapi,
    required String bodyId,
  }) async {
    var url = "http://www.instasekke.ir/myapptest/admin/api.php?apicall=sms_set";
    var body = Map<String, dynamic>();

    body["username"] = username;
    body["password"] = password;
    body["url"] = urlapi;
    body["bodyId"] = bodyId;

    Response response = await post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      //successful
      var getjson = json.decode(utf8.decode(response.bodyBytes));
      var model = setsms(
        getjson["message"],
      );

      ToastShow(model.message);
    } else {
      //error

    }
  }
}
