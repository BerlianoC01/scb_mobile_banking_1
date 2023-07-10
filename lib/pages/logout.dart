
import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/login.dart';

void showLoggingOut(context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        textAlign : TextAlign.center,
                        "Logging Out",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.close),
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    // )
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Anda yakin akan log out SCB - Mobile?",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: MaterialButton(
                color: Color.fromARGB(255, 56, 147, 82),
                child: Text(
                  "Ya",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              
            ),
            
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: MaterialButton(
                color: Color.fromARGB(255, 56, 147, 82),
                child: Text(
                  "Tidak",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        );
      },
    );
  }  