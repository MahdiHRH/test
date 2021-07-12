import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.success();
      _btnController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 102, 239),
        elevation: 0,
        title: Center(
            child: Text(
          "Mahdi HRH",
          style: TextStyle(
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 250,
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
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'IranSans',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
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
                      RoundedLoadingButton(
                        borderRadius: 5,
                        color: Color.fromARGB(255, 86, 102, 239),
                        child: Text('ارسال کد',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'IranSans',
                            )),
                        controller: _btnController,
                        onPressed: () {
                          _doSomething();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
                child: Container(
                    child: Image.asset(
              "assets/vector.png",
              scale: 1.5,
            )),alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }
}
