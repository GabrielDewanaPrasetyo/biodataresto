import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}){
    biodata['name'] = 'Raden Mas Speed';
    biodata['email'] = 'speed@gmail.com';
    biodata['phone'] = '+6289411355';
    biodata['image'] = 'speed.png';
    biodata['menu'] = 'Nasi Goreng Gila';
    biodata['jam'] = '10.00 - 22.00';
    biodata['addr'] = 'Jl. Nakula 555';
    biodata['desc'] = '''Rm. Sedap Speed dikelola oleh Mas Raden Speed Asli Jawa menghidangkan masakan asli khas Jawa.''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rm. Sedap Speed",
      home: Scaffold(
        appBar: AppBar(title: const Text("Rm. Sedap Speed")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            teksKotak(Colors.black, biodata['name'] ?? ''),
            Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
            SizedBox(height: 10),
            Row(
              children: [
                btnContact(Icons.mark_email_unread_rounded, Colors.green[900], "mailto:${biodata['email']}"),
                btnContact(Icons.phone, Colors.deepPurple, "tel:${biodata['phone']}"),
                btnContact(Icons.maps_ugc_rounded, Colors.blueAccent, "https://wa.me/${biodata['phone']}"),
              ],
            ),
            SizedBox(height: 10),
            Text(biodata['desc'] ?? '', style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            textAttribute("List Menu", biodata['menu'] ?? ''),
            textAttribute("Jam Buka", biodata['jam'] ?? ''),
            textAttribute("Alamat", biodata['addr'] ?? ''),
            SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }

  Container teksKotak(Color bgcolor, String teks) {
    return Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(color: bgcolor),
            child: Text(
              teks,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),
            ),
          );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
            children: [
            Container(width: 120, child: Text("- $judul", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))), 
            Text(":", style: TextStyle(fontSize: 18)), 
            Text(teks, style: TextStyle(fontSize: 18))
            ],
          );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    launch(uri);
                  }, 
                  child: Icon(icon),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
                ),
            );
  }

  void launch(String uri) async{
    if(!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}