// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/infoakun.dart';
import 'package:scb_mobile_banking/pages/mainmenu.dart';
import 'package:scb_mobile_banking/pages/transaksikeluar.dart';
import 'package:scb_mobile_banking/pages/logout.dart';

class transaksiMasuk extends StatefulWidget {
  const transaksiMasuk({Key? key}) : super(key: key);

  @override
  _transaksiMasukState createState() => _transaksiMasukState();
}

class _transaksiMasukState extends State<transaksiMasuk> {
  
  DateTime tgl = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(
              255, 61, 153, 112), // Warna latar belakang hijau
          title: Row(
            children: [
              Image.asset(
                'lib/images/SCBLogoNoShape.jpg',
                width: 40,
                height: 40,
              ),
              SizedBox(
                  width: 110), // Add some spacing between the image and text
              Text(
                'History',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          //centerTitle: true, // Posisikan teks di tengah appbar
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
        body: Stack(children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            width: 400,
            height: 57,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // transaksimasuk57H (14:482)
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  width: 180,
                  child: TextButton(
                    // transaksikeluarXEB (14:490)
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      child: Center(
                        child: Text(
                          'Transaksi Masuk',
                          style: TextStyle(
                            // 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  width: 1.5,
                  height: 57,
                  decoration: BoxDecoration(
                    color: Color(0xff000000),
                  ),
                ),
                TextButton(
                  // transaksikeluarXEB (14:490)
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => transaksiKeluar()));
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 180,
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        'Transaksi Keluar',
                        style: TextStyle(
                          // 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Tampilan Tengah
          Container(
            // autogroup2wwmp1H (CEnogo5hWD4H8MaywV2Wwm)
            padding: EdgeInsets.fromLTRB(12, 55, 12, 6),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogrouppbgpMG7 (CEnoEJqqGHRCT4zENTPbgP)
                  padding: EdgeInsets.fromLTRB(4, 7, 0, 450),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffd4d4d4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // darirekening098765432110000005 (14:483)
                        margin: EdgeInsets.fromLTRB(0, 0, 2, 14),
                        constraints: BoxConstraints(
                          maxWidth: 328,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dari Rekening :\n0987654321                  +1.000.000',
                              style: TextStyle(
                                // 'Inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: Color(0xff3d9970),
                              ),
                            ),
                            SizedBox(
                                height:
                                    3), // Add some spacing between the two texts
                            Text(
                              tgl.toString(), // Replace with the desired date
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // darirekening098765432110000005 (14:483)
                        margin: EdgeInsets.fromLTRB(0, 0, 2, 14),
                        constraints: BoxConstraints(
                          maxWidth: 328,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dari Rekening :\n5910238571                +10.000.000',
                              style: TextStyle(
                                // 'Inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: Color(0xff3d9970),
                              ),
                            ),
                            SizedBox(
                                height:
                                    3), // Add some spacing between the two texts
                            Text(
                              tgl.toString(), // Replace with the desired date
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Tampilan Bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                height: 102,
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
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13, 9, 13, 5),
                        width: 103,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 1, 9),
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'lib/images/History.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Riwayat',
                              style: TextStyle(
                                //'Inika',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.3025,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainMenuPage()));
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(26, 9, 26, 5),
                        width: 103,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(1, 0, 0, 9),
                              width: 55,
                              height: 55,
                              child: Image.asset(
                                'lib/images/Home.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                //'Inika',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InfoAkun()));
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(26, 9, 26, 5),
                        width: 103,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(1, 0, 0, 9),
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'lib/images/Akun.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Akun',
                              style: TextStyle(
                                //'Inika',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.3025,
                                color: Color(0xff000000),
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
        ]));
  }
}
