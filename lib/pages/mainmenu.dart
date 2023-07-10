
import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/infosaldo.dart';
import 'package:scb_mobile_banking/pages/pembayaran.dart';
import 'package:scb_mobile_banking/pages/logout.dart';
import 'package:scb_mobile_banking/pages/transaksimasuk.dart';
import 'package:scb_mobile_banking/pages/transfer.dart';
import 'package:scb_mobile_banking/pages/infoakun.dart';

class MainMenuPage extends StatefulWidget{
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenuPage> {

  bool passwordInvisible = true;
  bool pinInvisible = true;

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
            SizedBox(width: 8), // Add some spacing between the image and text
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
              image: AssetImage('lib/images/LogOut3.png'), // Replace with your image path
              width: 24,
              height: 24,
              child: null,
              fit: BoxFit.cover,
              // Add any additional properties as needed
            ),
          ),
        ),
      ],
      ),
      body: Stack(
        children: [
          // CekSaldo
          Container(
            margin:  EdgeInsets.fromLTRB(10, 30, 10, 0),
            child:  
              TextButton(
                onPressed:  () {
                  showInfoSaldo(context);
                },
                style:  TextButton.styleFrom (
                  padding:  EdgeInsets.zero,
                ),
              child:  
              Container(
                padding:  EdgeInsets.fromLTRB(2, 5, 22, 5),
                width:  double.infinity,
                decoration:  BoxDecoration (
                  color:  Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      margin:  EdgeInsets.fromLTRB(0, 0, 20, 0),
                      width:  100,
                      height:  100,
                      child: Image.asset(
                        'lib/images/CekSaldo.png',
                        fit:  BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin:  EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        'Cek Saldo',
                        style: TextStyle (
                          //'Inria Sans',
                          fontSize:  48,
                          fontWeight:  FontWeight.w500,
                          height:  1.1975,
                          color:  Color(0xbf000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Transfer
          Container(
            // ceksaldo
            margin:  EdgeInsets.fromLTRB(10, 180, 10, 0),
            child:  
              TextButton(
                onPressed:  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TransferPage()));
                },
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
              child:  
              Container(
                padding:  EdgeInsets.fromLTRB(2, 5, 22, 5),
                width:  double.infinity,
                decoration:  BoxDecoration (
                  color:  Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      margin:  EdgeInsets.fromLTRB(0, 0, 20, 0),
                      width:  100,
                      height:  100,
                      child: Image.asset(
                        'lib/images/Transfer.png',
                        fit:  BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin:  EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        'Transfer',
                        style: TextStyle (
                          //'Inria Sans',
                          fontSize:  48,
                          fontWeight:  FontWeight.w500,
                          height:  1.1975,
                          color:  Color(0xbf000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bayar
          Container(
            // ceksaldo
            margin: EdgeInsets.fromLTRB(10, 330, 10, 0),
            child: 
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
                },
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
              child:  
              Container(
                padding: EdgeInsets.fromLTRB(2, 5, 22, 5),
                width: double.infinity,
                decoration: BoxDecoration (
                  color:  Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      margin:  EdgeInsets.fromLTRB(0, 0, 20, 0),
                      width:  100,
                      height:  100,
                      child: Image.asset(
                        'lib/images/Bayar.png',
                        fit:  BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin:  EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        'Bayar',
                        style: TextStyle (
                          //'Inria Sans',
                          fontSize:  48,
                          fontWeight:  FontWeight.w500,
                          height:  1.1975,
                          color:  Color(0xbf000000),
                        ),
                      ),
                    ),
                  ],
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
                onPressed:  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoAkun()));
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