import 'package:flutter/material.dart';

class MesajPage extends StatefulWidget {
  const MesajPage({super.key, required this.gelenBilgi});
  final String gelenBilgi;
  @override
  State<StatefulWidget> createState() {
    return _MesajPageState();
  }
}

String mesaj = "";

class _MesajPageState extends State<MesajPage> {
  @override
  Widget build(Object context) {
    //---------------------------------> Scaffold Widget'i -Başlangıç
    return Scaffold(
        //---------------------------------> AppBar Özelliği -Başlangıç
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Mesaj Gönder"),
        ),
        //---------------------------------> AppBar Özelliği -Bitiş
        //---------------------------------> Body Özelliği -Başlangıç
        body: Center(
            child: Column(
          children: [
            Text("Kullanıcı Adı Giriniz"),
            Container(
                width: 250,
                height: 100,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      mesaj = value;
                    });
                  },
                )),
            ElevatedButton(onPressed: (() {}), child: Text("Giriş"))
          ],
        )
            //---------------------------------> Body Özelliği -Bitiş
            ));
    //---------------------------------> Scaffold Widget'i
  }
}
