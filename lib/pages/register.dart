
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/login.dart';
//import 'package:scb_mobile_banking/database/userdata.dart';

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernmController = TextEditingController();
  final TextEditingController _passwdController = TextEditingController();
  final TextEditingController _noKartuController = TextEditingController();
  final TextEditingController _PINController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();

  void createRecord() {
    final usernm = _usernmController.value.text;
    final passwd = _passwdController.value.text;
    final noKartu = _noKartuController.value.text;
    final PIN = _PINController.value.text;
    final nama = _namaController.value.text;
    final email = _emailController.value.text;
    
    int randomNoRek = Random().nextInt(99999999);
    String noRek = randomNoRek.toString();
    
    double saldo = 100000;

    registerUser(email, passwd, nama, email, usernm, noKartu, PIN, saldo, noRek);
  }

Future<void> registerUser(String email, String password, String namaLengkap, String emailUser, String userName, String nmrKartu, String PINATM, double saldo, String noRek) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    await FirebaseFirestore.instance.collection('UsersData').doc(userCredential.user!.uid).set({
      'Email': email,
      'NamaLengkap': namaLengkap,
      'Username': userName,
      'Password': password,
      'NomorKartu': nmrKartu,
      'PIN': PINATM,
      'Saldo': saldo,
      'NoRekening': noRek,
      'UID': userCredential.user!.uid,
    });
    print('User registered: ${userCredential.user!.uid}');

    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e.toString());
  }
}

  void storeUidLocally(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', uid);
  }

  bool passwordInvisible = true;
  bool pinInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(61, 153, 112, 1),
      body: Stack(
        children: [
          // Image BG
          Opacity(
            opacity: 0.6,
            child : Container(
              alignment: Alignment.center,
              child: Image(
              height: 450,
              width: 350,
              image: AssetImage('lib/images/SmartChoiceBankLogo.jpg'),
              fit: BoxFit.contain,
              ),
            )
          ),

          //Daftar Akun
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              'Daftar Akun',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: Colors.white,
              ),
            ),
          ),

          // Text Nama Lengkap
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 130, 10, 0),
            child: Text(
              'Nama Lengkap',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          // Input field Nama Lengkap
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(10, 160, 10, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nama Lengkap',
                  hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.35)),
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
          ),
          
          // Text Email User
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 220, 10, 0),
            child: Text(
              'Email User',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          // Input field Email User
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(10, 250, 10, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email@gmail.com',
                  hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.35)),
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
          ),

          // Text Username
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 310, 10, 0),
            child: Text(
              'Username',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          // Input field Username
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(10, 340, 10, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _usernmController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.35)),
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
          ),
          
          // Text Password
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 400, 10, 0),
            child: Text(
              'Password User',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          // Input field Password
          Padding(
            padding: EdgeInsets.fromLTRB(15, 430, 15, 0), // Adjust the margin as needed
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _passwdController,
                obscureText: passwordInvisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '********',
                  hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.35)),
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordInvisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        if(passwordInvisible){
                          passwordInvisible = false;
                        }else{
                          passwordInvisible = true;
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
          ),

          // Text Nomor Kartu
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 490, 10, 0),
            child: Text(
              'Nomor Kartu Bank User',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          // Input field Nomor Kartu
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(10, 520, 10, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _noKartuController,
                decoration: InputDecoration(
                  //labelText: '1234567890',
                  //labelStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
                  border: InputBorder.none,
                  hintText: '1234567890',
                  hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.35)),
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                  prefixIcon: Icon(Icons.credit_card),
                ),
              ),
            ),
          ),

          // Text Input PIN
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 580, 10, 0),
            child: Text(
              'PIN Bank',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          // Input field PIN
          Padding(
            padding: EdgeInsets.fromLTRB(15, 610, 15, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _PINController,
                obscureText: pinInvisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '******',
                  hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.35)),
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                  prefixIcon: Icon(Icons.pin),
                  suffixIcon: IconButton(
                    icon: Icon(
                      pinInvisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        if(pinInvisible){
                          pinInvisible = false;
                        }else{
                          pinInvisible = true;
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
          ),

          //Daftar Button
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 110),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(18.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    createRecord();
                  },
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),

          //sudah punya akun
          Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
          width: double.infinity,
          child:  
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child:  
                  Text(
                    'Sudah Punya Akun? ',
                    style: TextStyle(
                      fontSize:  20,
                      fontWeight:  FontWeight.bold,
                      height:  1.3025,
                      color:  Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed:  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  style:  TextButton.styleFrom (
                  padding:  EdgeInsets.zero,
                ),
                child:  
                  Text(
                    'Klik Disini',
                    style:  TextStyle (
                      fontSize:  20,
                      fontWeight:  FontWeight.bold,
                      height:  1.3025,
                      decoration:  TextDecoration.underline,
                      color:  Colors.yellowAccent,
                      decorationColor:  Colors.yellowAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
