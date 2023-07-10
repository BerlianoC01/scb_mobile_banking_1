
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/mainmenu.dart';
import 'package:scb_mobile_banking/pages/logout.dart';
import 'package:scb_mobile_banking/pages/transaksimasuk.dart';

Future<String?> getUidLocally() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('uid');
}

class InfoAkun extends StatefulWidget{
  const InfoAkun({Key? key}) : super(key: key);

  @override
  _InfoAkunState createState() => _InfoAkunState();
}

class _InfoAkunState extends State<InfoAkun> {
  bool passwordInvisible = true;
  bool pinInvisible = true;

  String nama = '';
  String noKartu = '';
  String noRek = '';

  @override
  void initState() {
    super.initState();
    ShowAccount();
  }

  void ShowAccount() async {
    var collection = FirebaseFirestore.instance.collection('UsersData');
    var querySnapshot = await collection.where('Email', isEqualTo: await getUidLocally()).get();

    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      setState(() {
        nama = data['NamaLengkap'];
        noKartu = data['NomorKartu'];
        noRek = data['NoRekening'];
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // remove back button
        backgroundColor: Color.fromRGBO(61, 153, 112, 1),
        // image & title
        title: Row(
          children: [
            Image.asset(
              'lib/images/SCBLogoNoShape.jpg',
              width: 40,
              height: 40,
            ),
            SizedBox(width: 8),
            Text(
              'SCB - Mobile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        
        // LogOut Button
        actions: <Widget>[
        InkWell(
          onTap: () {
            showLoggingOut(context);
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 15, 8),
            child: Ink.image(
              image: AssetImage('lib/images/LogOut3.png'),
              width: 24,
              height: 24,
              child: null,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      ),
      body: Stack(
        children: [
          Container(
            margin:  EdgeInsets.fromLTRB(10, 30, 10, 0),
            child:  
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                Text(
                  'Nama :',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(10, 80, 10, 10),
            child: 
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: 
              Text(
                nama,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),

          Container(
            margin:  EdgeInsets.fromLTRB(10, 120, 10, 0),
            child:  
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                Text(
                  'Nomor Rekening :',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(10, 170, 10, 10),
            child: 
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: 
              Text(
                noRek,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),

          Container(
            margin:  EdgeInsets.fromLTRB(10, 220, 10, 0),
            child:  
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                Text(
                  'Kartu Bank :',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
          ),
          
          Container(
            margin: EdgeInsets.fromLTRB(10, 270, 10, 0),
            child: 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: 
              Image.asset('lib/images/KartuBank1.png'),
            ),
          ),

          // Nama di kartu
          Container(
            margin: EdgeInsets.fromLTRB(15, 465, 10, 10),
            child: 
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: 
              Text(
                nama,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          // nomor kartu di kartu
          Container(
            margin: EdgeInsets.fromLTRB(15, 297, 10, 10),
            child: 
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: 
              Text(
                noKartu,
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Tampilan Bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
              width:  double.infinity,
              height:  102,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                onPressed:  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => transaksiMasuk()));
                },
                style:  TextButton.styleFrom (
                  padding:  EdgeInsets.zero,
                ),
                child: Container(
                  padding:  EdgeInsets.fromLTRB(13, 9, 13, 5),
                  width:  103,
                  height:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Color(0xffffffff),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin:  EdgeInsets.fromLTRB(0, 0, 1, 9),
                        width:  50,
                        height:  50,
                        child: Image.asset(
                          'lib/images/History.png',
                          fit:  BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Riwayat',
                        style: TextStyle (
                          //'Inika',
                          fontSize:  20,
                          fontWeight:  FontWeight.w400,
                          height:  1.3025,
                          color:  Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width:  25,
              ),
              TextButton(
                onPressed:  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()));
                },
                style:  TextButton.styleFrom (
                  padding:  EdgeInsets.zero,
                ),
                child: Container(
                  padding:  EdgeInsets.fromLTRB(26, 9, 26, 5),
                  width:  103,
                  height:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Color(0xffffffff),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin:  EdgeInsets.fromLTRB(1, 0, 0, 9),
                        width:  55,
                        height:  55,
                        child: Image.asset(
                          'lib/images/Home.png',
                          fit:  BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Home',
                        style: TextStyle (
                          //'Inika',
                          fontSize:  18,
                          fontWeight:  FontWeight.w400,
                          height:  1,
                          color:  Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width:  25,
              ),
              TextButton(
                onPressed:  () {},
                  style:  TextButton.styleFrom (
                  padding:  EdgeInsets.zero,
                ),
                child: Container(
                  padding:  EdgeInsets.fromLTRB(26, 9, 26, 5),
                  width:  103,
                  height:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Color(0xffffffff),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin:  EdgeInsets.fromLTRB(1, 0, 0, 9),
                        width:  50,
                        height:  50,
                        child: Image.asset(
                          'lib/images/Akun.png',
                          fit:  BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Akun',
                        style: TextStyle (
                          //'Inika',
                          fontSize:  20,
                          fontWeight:  FontWeight.w400,
                          height:  1.3025,
                          color:  Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
          ),
          ),
        ],
      ),
    );
  }
}