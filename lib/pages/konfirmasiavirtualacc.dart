
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/transaksiberhasil.dart';

  void showKonfirmasiVirtualAcc(BuildContext context, String noVirtAcc, String namaPerusahaan, double jumlahUang) {
    void CreateDataTransaction() {
    FirebaseFirestore.instance
    .collection('Transaksi')
    .doc('VirtualAccount')
    .set({
      'NomorVirtualAccount': noVirtAcc,
      'NamaPerusahaan': namaPerusahaan,
      'JumlahUang': jumlahUang,
    });
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
                        "Konfirmasi",
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
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                'No Virtual Account :',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                '${noVirtAcc}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                '${namaPerusahaan}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                'Jumlah Uang :',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                'Rp ${jumlahUang}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            //const SizedBox(height: 50,),
            
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),

              child: MaterialButton(
                color: Color.fromARGB(255, 56, 147, 82),
                child: Text(
                  "Ya",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  CreateDataTransaction();

                  Navigator.pop(context);
                  showTransaksiBerhasil(context);
                },
              ),
              
            ),
            
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: MaterialButton(
                color: Color.fromARGB(255, 56, 147, 82),
                child: Text(
                  "Tidak",
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