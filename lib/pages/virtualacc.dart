import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scb_mobile_banking/pages/konfirmasiavirtualacc.dart';
import 'package:scb_mobile_banking/pages/transfer.dart';

class TransferVirtualAcc extends StatefulWidget{
  const TransferVirtualAcc({Key? key}) : super(key: key);

  @override
  _TransferVirtualAccState createState() => _TransferVirtualAccState();
}

class _TransferVirtualAccState extends State<TransferVirtualAcc> {
  //const PaymentPage({Key? key}) : super(key: key);

  TextEditingController noVirt = new TextEditingController();
  TextEditingController totalUang = new TextEditingController();
  String namaVirtual = '';
  
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
            SizedBox(width: 50), // Add some spacing between the image and text
            Text(
              'Virtual Account',
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => TransferPage()));
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
                            'Nomor Virtual Account',
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
                              controller: noVirt,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: '1234567890',
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
                            'Jumlah Uang',
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
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              controller: totalUang,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: '1.000.000',
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
                              if(noVirt.text.substring(0, 4) == '1234'){
                                namaVirtual = 'Go-Pay Customer';
                              } else if(noVirt.text.substring(0, 4) == '0987'){
                                namaVirtual = 'OVO Customer';
                              } else if(noVirt.text.substring(0, 4) == '5353'){
                                namaVirtual = 'Dana';
                              } else {
                                namaVirtual = noVirt.text.substring(0, 4);
                              }

                              String noVirAcc = noVirt.text;
                              double jumlahHarga = double.tryParse(totalUang.text) ?? 0.0;

                              showKonfirmasiVirtualAcc(context, noVirAcc, namaVirtual, jumlahHarga);
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