import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String _nama = "";
  String pilihanSalam = "pagi"; //
  String pilihanSalamOut = ""; //untuk ditampilkan

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> salam = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "pagi",
      child: Text("selamat pagi"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "siang",
      child: Text("selamat siang"),
    );
    salam.add(itm1);
    salam.add(itm2);

    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        //harus dibawah langsung Scaffold
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // jika ditap
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.dangerous),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 150,
            ),
            DropdownButton(
              value: pilihanSalam,
              items: salam,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    pilihanSalam = newValue;
                  }
                });
              },
            ),
            Text('Masukan Nama :'),
            TextField(
              controller: textEditController, //controller
            ),
            Padding(
              padding: EdgeInsets.all(20), //20 pixel ke semua arah
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _nama = textEditController.text; //akses text via controller
                    pilihanSalamOut = pilihanSalam; //ambil dari state
                  }); //refresh
                },
                child: const Text('Klik Ini'),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  _nama = textEditController.text; //akses text via controller
                  pilihanSalamOut = pilihanSalam; //ambil dari state
                }); //refresh
              },
              child: const Text('Ini TextButton'),
            ),
            IconButton(
              icon: const Icon(Icons.account_box_outlined),
              tooltip: 'Profil User',
              onPressed: () {
                // kalau ditap
              },
            ),
            Text(
              _nama != "" ? 'Halo $_nama  selamat $pilihanSalamOut' : "",
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        )), //column center
      ), //Scaffold
    ); //Material APP
  }
}
