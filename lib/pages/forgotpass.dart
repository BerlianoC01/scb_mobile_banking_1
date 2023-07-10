
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/login.dart';

class ForgotPassPage extends StatefulWidget{
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPassPage> {
  final TextEditingController _passwdController = TextEditingController();
  final TextEditingController _noKartuController = TextEditingController();
  final TextEditingController _PINController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String email = '';
  String noKartu = '';
  String PIN = '';
  String passwd = '';

  bool passwordInvisible = true;
  bool pinInvisible = true;

  Future<void> changePassword(String email, String cardNumber, String pin, String newPassword) async {
  try {
    // Retrieve user document based on email
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('UsersData')
        .where('Email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = querySnapshot.docs[0];
      String storedCardNumber = userDoc.get('NomorKartu');
      String storedPin = userDoc.get('PIN');
      // Verify card number and PIN
      if (storedCardNumber == cardNumber && storedPin == pin) {
        String userId = userDoc.id;

        // Change password in Firestore
        await FirebaseFirestore.instance
            .collection('UsersData')
            .doc(userId)
            .update({'Password': newPassword});

        // Change password in Firebase Authentication
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.updatePassword(newPassword);
          print('Password changed successfully!');
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        } else {
          print('No user is currently signed in.');
        }
      } else {
        _noKartuController.clear();
        _PINController.clear();
      }
    } else {
      _emailController.clear();
    }
  } catch (error) {
    print('Error changing password: $error');
  }
}

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
            padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: Colors.white,
              ),
            ),
          ),
          
          // Text Email User
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 180, 10, 0),
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
            padding: EdgeInsets.fromLTRB(10, 210, 10, 0),
            child: Container(
              height: 55,
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

          // Text Nomor Kartu
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 290, 10, 0),
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
            padding: EdgeInsets.fromLTRB(10, 320, 10, 0),
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _noKartuController,
                decoration: InputDecoration(
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
            padding: EdgeInsets.fromLTRB(20, 400, 10, 0),
            child: Text(
              'PIN Bank',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          // Text Input PIN
          Padding(
            padding: EdgeInsets.fromLTRB(15, 430, 15, 0), 
            child: Container(
              height: 55,
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
          
          // Text Password
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 510, 10, 0),
            child: Text(
              'Password Baru',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),

          // Input field Password
          Padding(
            padding: EdgeInsets.fromLTRB(15, 540, 15, 0), // Adjust the margin as needed
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _passwdController,
                obscureText: passwordInvisible,
                decoration: InputDecoration(
                  //labelText: 'Password',
                  border: InputBorder.none,
                  hintText: '**********',
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

          

          //Ganti Pass Button
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 150),
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
                    email = _emailController.value.text;
                    noKartu = _noKartuController.value.text;
                    PIN = _PINController.value.text;
                    passwd = _passwdController.value.text;

                    changePassword(email, noKartu, PIN, passwd);
                  },
                  child: const Text(
                    'Ganti Password',
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
          margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
          width: double.infinity,
          child:  
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child:  
                  Text(
                    'Sudah ingat password anda? ',
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