import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> code = new List();
  onCodeEnter(String eachNumber) {
    if (code.length < 4) {
      setState(() {
        code.add(eachNumber);
      });

      print(code);
    }
  }

  removeCode() {
    print(code);
    setState(() {
      code.removeAt(code.length - 1);
    });
  }

  Widget roundInputField(int index) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 60,
      margin: EdgeInsets.only(left: 10.0),
      child: Text(
        code.length - 1 < index ? "" : code[index],
        style: TextStyle(fontSize: 25),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            spreadRadius: 5,
            blurRadius: 3,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(35.0),
        ),
        border: code.length == index
            ? Border.all(color: Color.fromRGBO(28, 143, 250, 1), width: 3.0)
            : Border.all(width: 0, color: Color.fromRGBO(255, 255, 255, 0)),
      ),
    );
  }

  Widget numberContainer(List<String> numberArray) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: numberArray.map<Widget>((String eachNum) {
          return Expanded(
            child: Material(
              child: InkWell(
                onTap: () {
                  onCodeEnter(eachNum);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    eachNum,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 18, 95, 1),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(36, 57, 89, 1),
              constraints: BoxConstraints.expand(),
              child: Container(
                padding: EdgeInsets.all(25),
                alignment: Alignment.topCenter,
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Color.fromRGBO(156, 160, 200, 1),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 242, 247, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "John Doe",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromRGBO(36, 57, 89, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "john@Doe.com",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(113, 115, 117, 1),
                              ),
                            ),
                          ]),
                          Container(
                              padding: EdgeInsets.only(top: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  roundInputField(0),
                                  roundInputField(1),
                                  roundInputField(2),
                                  roundInputField(3)
                                ],
                              )),
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              "Forget your password ?",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromRGBO(183, 184, 186, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          numberContainer(["1", "2", "3"]),
                          numberContainer(["4", "5", "6"]),
                          numberContainer(["7", "8", "9"]),
                          Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: Material(
                                      child: InkWell(
                                        onTap: () {
                                          removeCode();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(15.0),
                                          child: Icon(
                                            Icons.cancel,
                                            color: Color.fromRGBO(0, 18, 95, 1),
                                            size: 40.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Material(
                                      child: InkWell(
                                        onTap: () {
                                          onCodeEnter("0");
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(20.0),
                                          child: Text(
                                            "0",
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(0, 18, 95, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Material(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(15.0),
                                          child: Icon(
                                            Icons.fingerprint,
                                            color: Color.fromRGBO(0, 18, 95, 1),
                                            size: 40.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
