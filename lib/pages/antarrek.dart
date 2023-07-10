
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scb_mobile_banking/pages/konfirmasiantarrek.dart';
import 'package:scb_mobile_banking/pages/transfer.dart';


class TransferAntarRekening extends StatefulWidget{
  const TransferAntarRekening({Key? key}) : super(key: key);

  @override
  _TransferAntarRekeningState createState() => _TransferAntarRekeningState();
}

class _TransferAntarRekeningState extends State<TransferAntarRekening> {
  final TextEditingController rekTujController = TextEditingController();
  final TextEditingController uangTFController = TextEditingController();
  final TextEditingController pesanController = TextEditingController();
    
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
            SizedBox(width: 42), // Add some spacing between the image and text
            Text(
              'Antar Rekening',
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
              padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Container(
                width: 400,
                height: 650,// Warna latar belakang hijau
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 61, 153, 112), // Warna latar belakang hijau
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'Rekening Tujuan',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.black, // Warna teks putih
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 204, 204, 204), // Warna latar belakang hijau
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              controller: rekTujController,
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
                          SizedBox(height: 2),
                          Text(
                            'Jumlah Uang',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.black, // Warna teks putih
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 204, 204, 204), // Warna latar belakang hijau
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              controller: uangTFController,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: '10.000',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30,
                                ),
                                border: InputBorder.none, // Menghilangkan garis tepi input
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Pesan',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.black, // Warna teks putih
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 204, 204, 204), // Warna latar belakang hijau
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              controller: pesanController,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                              textInputAction: TextInputAction.newline,
                              maxLines: 5, // Membuat TextField dapat menyesuaikan tinggi sesuai dengan teks yang dimasukkan
                              decoration: InputDecoration(
                                hintText: 'Pesan Tambahan',
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
                              String rek = rekTujController.text;
                              double uang = double.tryParse(uangTFController.text) ?? 0.0;
                              String pesanTambahan = pesanController.text;
                              showKonfirmasiAntarRek(context, rek, uang, pesanTambahan);
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