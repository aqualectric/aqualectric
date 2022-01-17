import 'dart:async';
import 'dart:ffi';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sudaki_elektrik/ayar_sayfasi.dart';
import 'package:sudaki_elektrik/provider_yayinlari.dart';
import 'auth_provider.dart';
import 'degiskenler.dart';
import 'giris_sayfasi.dart';
import 'package:url_launcher/url_launcher.dart';



///////////////////////////////////////////////////////////////////
/// GİRİŞ EKRANI
///////////////////////////////////////////////////////////////////

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/LOGO-1.png',
              height: 125,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[900]!),
            )
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////
/// ANA SAYFA
///////////////////////////////////////////////////////////////////

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final databaseReference = FirebaseDatabase.instance.reference();


  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;
  bool isSwitched6 = false;


  @override
  Widget build(BuildContext context) {
    CollectionReference bilgi1Ref =
        _firestore.collection('veriler').doc('bilgiler').collection('bilgi1');
    var sicaklikRef = bilgi1Ref.doc('Sıcaklık ID');
    /*var cekilenGucRef = bilgi1Ref.doc('Çekilen Güç ID');
    var phRef = bilgi1Ref.doc('Ph ID');
    var yuzeySuyuDurumuRef = bilgi1Ref.doc('Su Durumu ID');
    */

    


    CollectionReference butonlarRef =
        _firestore.collection('veriler').doc('buton').collection('butonlar');
    var buton1Ref = butonlarRef.doc('buton1ID');
    var buton2Ref = butonlarRef.doc('buton2ID');
    var buton3Ref = butonlarRef.doc('buton3ID');
    var buton4Ref = butonlarRef.doc('buton4ID');
    var buton5Ref = butonlarRef.doc('buton5ID');
    var buton6Ref = butonlarRef.doc('buton6ID');

    Function yeniButon1 = Provider.of<ProviderYayinlari>(context).yeniButon1;
    Function yeniButon2 = Provider.of<ProviderYayinlari>(context).yeniButon2;
    Function yeniButon3 = Provider.of<ProviderYayinlari>(context).yeniButon3;
    Function yeniButon4 = Provider.of<ProviderYayinlari>(context).yeniButon4;
    Function yeniButon5 = Provider.of<ProviderYayinlari>(context).yeniButon5;
    Function yeniButon6 = Provider.of<ProviderYayinlari>(context).yeniButon6;


    _launchURLApp() async {
      var weburl = "http://192.168.155.65/";
      try {
        bool launched =
        await launch(weburl, forceSafariVC: false);
        if (!launched) {
          await launch(weburl, forceSafariVC: false);
        }
      } catch (e) {
        print('webSite problem: ${e.toString()}');
        await launch(weburl, forceSafariVC: false);
      }
    }



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900]!,
        title: Text('Sudaki Elektrik', style: kBaslikStili),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              AuthClass().signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Card(
              color: Colors.blue[900]!,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 150,
                          width: 200,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                    child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text(
                                    '${Provider.of<ProviderYayinlari>(context).priz1}',
                                    style: kMetinStili,
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                              ),
                              Expanded(
                                child: Switch(
                                  value: Provider.of<ProviderYayinlari>(context)
                                      .isSwitched1,
                                  onChanged: (value) async {
                                    setState(() {
                                      isSwitched1 = value;
                                    });
                                    Map<String, bool> switchData = {
                                      'buton1': isSwitched1,
                                    };
                                    await buton1Ref.update(switchData);
                                    yeniButon1(isSwitched1);
                                    databaseReference.update({
                                      'buton1': '$isSwitched1'
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreen,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 150,
                          width: 200,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        '${Provider.of<ProviderYayinlari>(context).priz2}',
                                        style: kMetinStili,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Switch(
                                  value: Provider.of<ProviderYayinlari>(context)
                                      .isSwitched2,
                                  onChanged: (value) async {
                                    setState(() {
                                      isSwitched2 = value;
                                    });
                                    Map<String, bool> switchData = {
                                      'buton2': isSwitched2,
                                    };
                                    await buton2Ref.update(switchData);
                                    yeniButon2(isSwitched2);
                                    databaseReference.update({
                                      'buton2': '$isSwitched2'
                                    });

                                  },
                                  activeTrackColor: Colors.lightGreen,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 150,
                          width: 200,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        '${Provider.of<ProviderYayinlari>(context).priz3}',
                                        style: kMetinStili,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Switch(
                                  value: Provider.of<ProviderYayinlari>(context)
                                      .isSwitched3,
                                  onChanged: (value) async {
                                    setState(() {
                                      isSwitched3 = value;
                                    });
                                    Map<String, bool> switchData = {
                                      'buton3': isSwitched3,
                                    };
                                    await buton3Ref.update(switchData);
                                    yeniButon3(isSwitched3);
                                    databaseReference.update({
                                      'buton3': '$isSwitched3'
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreen,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 150,
                          width: 200,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        '${Provider.of<ProviderYayinlari>(context).priz4}',
                                        style: kMetinStili,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Switch(
                                  value: Provider.of<ProviderYayinlari>(context)
                                      .isSwitched4,
                                  onChanged: (value) async {
                                    setState(() {
                                      isSwitched4 = value;
                                    });
                                    Map<String, bool> switchData = {
                                      'buton4': isSwitched4,
                                    };
                                    await buton4Ref.update(switchData);
                                    yeniButon4(isSwitched4);
                                    databaseReference.update({
                                      'buton4': '$isSwitched4'
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreen,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 150,
                          width: 200,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        '${Provider.of<ProviderYayinlari>(context).priz5}',
                                        style: kMetinStili,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Switch(
                                  value: Provider.of<ProviderYayinlari>(context)
                                      .isSwitched5,
                                  onChanged: (value) async {
                                    setState(() {
                                      isSwitched5 = value;
                                    });
                                    Map<String, bool> switchData = {
                                      'buton5': isSwitched5,
                                    };
                                    await buton5Ref.update(switchData);
                                    yeniButon5(isSwitched5);
                                    databaseReference.update({
                                      'buton5': '$isSwitched5'
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreen,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 150,
                          width: 200,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        '${Provider.of<ProviderYayinlari>(context).priz6}',
                                        style: kMetinStili,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Switch(
                                  value: Provider.of<ProviderYayinlari>(context)
                                      .isSwitched6,
                                  onChanged: (value) async {
                                    setState(() {
                                      isSwitched6 = value;
                                    });
                                    Map<String, bool> switchData = {
                                      'buton6': isSwitched6,
                                    };
                                    await buton6Ref.update(switchData);
                                    yeniButon6(isSwitched6);
                                    databaseReference.update({
                                      'buton6': '$isSwitched6'
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreen,
                                  activeColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: ListView(
              children: <Widget>[
               /* Card(
                  color: Colors.blue[900]!,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      height: 50,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: cekilenGucRef.snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot asyncSnapshot) {
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'Çekilen Güç = ${asyncSnapshot.data.data()['Çekilen Güç']} Watt',
                                style: kMetinStili,
                              ));
                        },
                      )),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      height: 50,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: phRef.snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot asyncSnapshot) {
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'Ph = ${asyncSnapshot.data.data()['Ph']}',
                                style: kMetinStili,
                              ));
                        },
                      )),
                ),*/
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      height: 50,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: sicaklikRef.snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot asyncSnapshot) {
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'Su Sıcaklığı = 23.43'
                                    ' C',
                                style: kMetinStili,
                              ));
                        },
                      )),
                ),/*
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      height: 50,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: yuzeySuyuDurumuRef.snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot asyncSnapshot) {
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'Yüzey Suyu Durumu = ${asyncSnapshot.data.data()['Su Durumu']} ',
                                style: kMetinStili,
                              ));
                        },
                      )),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 50,
                    child: Text(
                      'Beşinci Öğe',
                      style: kMetinStili,
                    ),
                  ),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 50,
                    child: Text(
                      'Altıncı Öğe',
                      style: kMetinStili,
                    ),
                  ),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 50,
                    child: Text(
                      'Yedinci Öğe',
                      style: kMetinStili,
                    ),
                  ),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 50,
                    child: Text(
                      'Sekizinci Öğe',
                      style: kMetinStili,
                    ),
                  ),
                ),*/
              ],
            ),
          ),
          Container(
            color: Colors.blue[900]!,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.photo_camera),
                    color: Colors.white,
                    onPressed: _launchURLApp,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AyarSayfasi()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
