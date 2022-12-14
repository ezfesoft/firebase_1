import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_1/firebase_options.dart';

String mesaj = "";

class MesajPage extends StatefulWidget {
  const MesajPage({super.key, required this.gelenBilgi});
  final String gelenBilgi;

  @override
  State<StatefulWidget> createState() {
    return _MesajPageState();
  }
}

class _MesajPageState extends State<MesajPage> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

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
            Text(widget.gelenBilgi),
            Text("Mesaj Yazınız:"),
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
            ElevatedButton(
                onPressed: (() {
                  DatabaseReference ref =
                      FirebaseDatabase.instance.ref("mesajlar/");

                  ref.set({"isim": widget.gelenBilgi, "mesaj": mesaj});
                }),
                child: Text("Gönder"))
          ],
        )
            //---------------------------------> Body Özelliği -Bitiş
            ));
    //---------------------------------> Scaffold Widget'i
  }
}
