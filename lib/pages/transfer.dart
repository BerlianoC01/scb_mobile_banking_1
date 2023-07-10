
import 'package:flutter/material.dart';
import 'package:scb_mobile_banking/pages/antarrek.dart';
import 'package:scb_mobile_banking/pages/mainmenu.dart';
import 'package:scb_mobile_banking/pages/virtualacc.dart';

class TransferPage extends StatefulWidget{
  const TransferPage({Key? key}) : super(key: key);
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  //const Transfer({super.key});

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
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child:ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TransferAntarRekening()));
              },  
              style: ElevatedButton.styleFrom(
                fixedSize: Size(375, 150),
                primary: Color.fromRGBO(61, 153, 112, 1),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Antar\nRekening',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 150),
            child:ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TransferVirtualAcc()));
              },  
              style: ElevatedButton.styleFrom(
                fixedSize: Size(375, 150), // Set the size of the button
                primary: Color.fromRGBO(61, 153, 112, 1), // Set the background color
                onPrimary: Colors.white, // Set the text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Set the border radius
                ),
              ),
              child: Text(
                'Virtual\nAccount',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
