import 'package:firebase_1/firebase_options.dart';
import 'package:firebase_1/mesajlar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

String kullaniciAdi = "";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        '/start': (context) => MyHomePage(),
        '/test': (context) => MesajPage(
              gelenBilgi: kullaniciAdi,
            )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Kullanıcı Adı Giriniz"),
            Container(
                width: 250,
                height: 100,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      kullaniciAdi = value;
                    });
                  },
                )),
            ElevatedButton(
                onPressed: (() {
                  Navigator.pushReplacementNamed(context, '/test');
                }),
                child: Text("Giriş"))
          ],
        ),
      ),
    );
  }
}
