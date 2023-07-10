import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/mainmenu.dart';

void showTransaksiBerhasil(context) {
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
                        "Sukses",
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
                "Transaksi berhasil",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              // child: TextField(
              //   style: new TextStyle(
              //       fontSize: 14.0, height: 1.0, color: Colors.black),
              //   decoration: new InputDecoration(
              //     hintText: "Input nama lengkap",
              //     border: OutlineInputBorder(
              //         borderRadius: new BorderRadius.circular(3.0)),
              //     contentPadding: const EdgeInsets.symmetric(
              //         vertical: 14.0, horizontal: 15.0),
              //   ),
              // ),
              child: MaterialButton(
                color: Color.fromARGB(255, 56, 147, 82),
                child: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()));
                },
              ),
              
            ),
            
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: MaterialButton(
                color: Color.fromARGB(255, 56, 147, 82),
                child: Text(
                  "Tutup",
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