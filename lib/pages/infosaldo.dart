
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

  Future<String?> getUidLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  void showInfoSaldo(context) async {
    DateTime tgl = new DateTime.now();

    var collection = FirebaseFirestore.instance.collection('UsersData');
    var querySnapshot = await collection.where('Email', isEqualTo: await getUidLocally()).get();

    var balance = 0.0;
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      balance = data['Saldo'].toDouble();
    }
    
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
                        "Info Saldo",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                tgl.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                'Saldo Anda :',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                'Rp'+balance.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            const SizedBox(height: 50,),
            
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: MaterialButton(
                color: Color.fromARGB(255, 56, 147, 82),
                child: Text(
                  "Kembali",
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