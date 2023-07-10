import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/mainmenu.dart';
import 'package:scb_mobile_banking/pages/konfirmasibayar.dart';

class PaymentPage extends StatefulWidget{
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  TextEditingController IDBayar = new TextEditingController();
  TextEditingController kodeBayar = new TextEditingController();
  String namaPerusahaan = '';
  String jenisPembayaran = '';
  //double harga = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 61, 153, 112), // Warna latar belakang hijau
        title: Row(
          children: [
            Image.asset(
              'lib/images/SCBLogoNoShape.jpg',
              width: 40,
              height: 40,
            ),
            SizedBox(width: 110), // Add some spacing between the image and text
            Text(
              'Bayar',
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()));
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 15, 8),
              child: Ink.image(
                image: AssetImage('lib/images/Back1.png'), // Ganti dengan path gambar yang sesuai
                width: 45,
                height: 40,
                child: null,
                fit: BoxFit.cover,
                // Tambahkan properti tambahan jika diperlukan
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
              child: Container(
                width: 400,
                height: 450,// Warna latar belakang hijau
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 61, 153, 112), // Warna latar belakang hijau
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Kode Perusahaan',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.black, // Warna teks putih
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 204, 204, 204), // Warna latar belakang hijau
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: kodeBayar,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: '1999',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30,
                                ),
                                border: InputBorder.none, // Menghilangkan garis tepi input
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'ID Pembayaran',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.black, // Warna teks putih
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 204, 204, 204), // Warna latar belakang hijau
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: IDBayar,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: '53521000110',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30,
                                ),
                                border: InputBorder.none, // Menghilangkan garis tepi input
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          Center(
                            child: ElevatedButton(
                            onPressed: () {
                              if(kodeBayar.text == '1999'){
                                namaPerusahaan = '1999 - Universitas Tarumanegara';
                              } else if(kodeBayar.text == '1234'){
                                namaPerusahaan = '1234 - Universitas Trisakti';
                              } else (
                                namaPerusahaan = kodeBayar.text
                              );

                              if(IDBayar.text == '53521000510'){
                                jenisPembayaran = 'BPP - Jerry Setiawan';
                              } else if(IDBayar.text == '53521000710'){
                                jenisPembayaran = 'BPP - Rendy Khosesa';
                              } else if(IDBayar.text == '53521002610'){
                                jenisPembayaran = 'BPP - Bryan Othman Salim';
                              } else if(IDBayar.text == '53521004310'){
                                jenisPembayaran = 'BPP - Asoka Dhananjaya';
                              } else if(IDBayar.text == '53519007810'){
                                jenisPembayaran = 'BPP - Berliano Catur Matahara';
                              } else if(IDBayar.text == '53521002810'){
                                jenisPembayaran = 'BPP - Charless Gotama';
                              } else {
                                jenisPembayaran = IDBayar.text;
                              }

                              showKonfirmasiBayar(context, namaPerusahaan, jenisPembayaran);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            ),
                            child: Text(
                              'Konfirmasi',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                              ),
                            ),
                          ),
                          ),
                          
                        ],
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