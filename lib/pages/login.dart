
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/mainmenu.dart';
import 'package:scb_mobile_banking/pages/register.dart';
import 'package:scb_mobile_banking/pages/forgotpass.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  bool passwordInvisible = true;

  // Login
  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.value.text,
              password: _passwordController.value.text);
      print('Login berhasil: ${userCredential.user!.uid}');
      storeUidLocally(_emailController.value.text);

      Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _emailController.clear();
        _passwordController.clear();
      } else if (e.code == 'wrong-password') {
        _emailController.clear();
        _passwordController.clear();
      }
    }
  }

  void storeUidLocally(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', uid);
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
            opacity: 0.8,
            child : Align(
              alignment: Alignment.topCenter,
              child: Image(
              height: 500,
              width: 350,
              image: AssetImage('lib/images/SmartChoiceBankLogo.jpg'),
              fit: BoxFit.contain,
              ),
            )
          ),
          // Text
          const Align(
              alignment: Alignment.topCenter,
              child: Image(
              height: 510,
              width: 280,
              image: AssetImage('lib/images/SCB SmartChoiceBank Font.png'),
              fit: BoxFit.contain,
            ),
          ),
          // Email
          Padding(
            padding: EdgeInsets.fromLTRB(15, 450, 15, 0),
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: InputBorder.none,
                  hintText: 'Masukkan email',
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
          ),
          // Password
          Padding(
            padding: EdgeInsets.fromLTRB(15, 535, 15, 0),
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Masukkan Password";
                  }
                  return null;
                },
                controller: _passwordController,
                obscureText: passwordInvisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: InputBorder.none,
                  hintText: 'Masukkan password',
                  contentPadding: EdgeInsets.fromLTRB(18, 10, 18, 0),
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
          // Forgot password
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.fromLTRB(0, 0, 10, 210),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.yellowAccent,
                    padding: const EdgeInsets.all(10.0),
                    textStyle: const TextStyle(fontSize: 17),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassPage()));
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Log In Button
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 125),
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
                    // loginUser();
                    // String usernme = _usernameController.value.text;
                    // String passwrd = _passwordController.value.text;

                    _login();
                  },
                  child: const Text(
                    'Masuk',
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

          // User baru Button
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
                    'User Baru? ',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
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