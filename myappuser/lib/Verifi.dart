import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'font.dart';
import 'home.dart';
import 'json.dart';

class Verifi extends StatefulWidget {
  final String mobile;

  Verifi({required this.mobile});

  @override
  _VerifiState createState() => _VerifiState();
}

class _VerifiState extends State<Verifi> with TickerProviderStateMixin {
  late AnimationController controller;

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  var T1 = TextEditingController();
  var T2 = TextEditingController();
  var T3 = TextEditingController();
  var T4 = TextEditingController();

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
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: 'IranSans',
                  fontSize: MyFontStyleDevice(context, .032, .037),
                  fontWeight: FontWeight.bold,
                ),
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

  List<String> code = ["0", "0", "0", "0"];

  bool animsts = false;

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 120),
    );

    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);

    controller.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.dismissed) {
        setState(() {
          animsts = true;
        });
      } else {
        setState(() {
          animsts = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 86, 102, 239),
        title: Center(
            child: Text(
          "Mahdi HRH",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'IranSans',
          ),
        )),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 86, 102, 239),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
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
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "وارد کردن کد فعال سازی",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          fontFamily: 'IranSans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Text(
                      "یک پیام حاوی کد فعال سازی برای شما ارسال شد",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'IranSans',
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60.0,
                          width: 40,
                          child: TextFieldMy("", T1, 0),
                        ),
                        Container(
                          height: 60.0,
                          width: 40,
                          child: TextFieldMy("", T2, 1),
                        ),
                        Container(
                          height: 60.0,
                          width: 40,
                          child: TextFieldMy("", T3, 2),
                        ),
                        Container(
                          height: 60.0,
                          width: 40,
                          child: TextFieldMy("", T4, 3),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    (animsts == false)
                        ? AnimatedBuilder(
                            animation: controller,
                            builder: (context, child) {
                              return Text(
                                timerString,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'IranSans',
                                ),
                              );
                            })
                        : TextButton(
                            onPressed: () {
                              resend(mobile: widget.mobile);
                              _btnController.reset();
                              controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
                            },
                            child: Text(
                              "تلاش مجدید",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                fontFamily: 'IranSans',
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 20,
                    ),

                    RoundedLoadingButton(
                      // borderRadius: 5,
                      color: Color.fromARGB(255, 86, 102, 239),
                      child: Text('تایید',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'IranSans',
                          )),
                      controller: _btnController,
                      onPressed: () {
                        String sum = "";
                        sum = code[0] + code[1] + code[2] + code[3];
                        print(sum);
                        check_code(mobile: widget.mobile, code: sum);
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget TextFieldMy(String label, var controll, int index) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'IranSans',
          ),
          maxLines: 1,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Color.fromARGB(255, 86, 102, 239), width: 2.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controll,
          onChanged: (text) {
            if (text.length == 1) {
              FocusScope.of(context).nextFocus();
              code[index] = text;
              print(code);
            }
          },
        ),
      ),
    );
  }

  LoginOk(String mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("sts", "yes");
    prefs.setString("mobile", mobile);
  }

  void check_code({
    required String code,
    required String mobile,
  }) async {
    var url = "http://www.instasekke.ir/myapptest/api.php?apicall=verifi";
    var body = Map<String, dynamic>();
    body["code"] = code;
    body["mobile"] = mobile;

    Response response = await post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      //successful

      var json_model = json.decode(utf8.decode(response.bodyBytes));
      var model = verifi_json(json_model["sts"], json_model["message"], json_model["error"]);

      if (model.error == true) {
        _btnController.error();
        DialogMessg(model.message);
      } else if (model.error == false) {
        _btnController.success();
        LoginOk(widget.mobile);

        Timer(Duration(seconds: 1), () {
          controller.dispose();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return Home(
              mobile: widget.mobile,
            );
          }));
        });
      }
    } else {
      //error
      _btnController.reset();
    }
  }

  void resend({
    required String mobile,
  }) async {
    var url = "http://www.instasekke.ir/myapptest/api.php?apicall=ressend";
    var body = Map<String, dynamic>();
    body["mobile"] = mobile;

    Response response = await post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      //successful

    } else {
      //error
      _btnController.reset();
    }
  }
}
