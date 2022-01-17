import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sudaki_elektrik/provider_yayinlari.dart';
import 'anasayfa.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider<ProviderYayinlari>(
      create: (BuildContext context) {
        return ProviderYayinlari();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {

    Provider.of<ProviderYayinlari>(context,listen: false).loadPriz1FromSharedPref();
    Provider.of<ProviderYayinlari>(context,listen: false).loadPriz2FromSharedPref();
    Provider.of<ProviderYayinlari>(context,listen: false).loadPriz3FromSharedPref();
    Provider.of<ProviderYayinlari>(context,listen: false).loadPriz4FromSharedPref();
    Provider.of<ProviderYayinlari>(context,listen: false).loadPriz5FromSharedPref();
    Provider.of<ProviderYayinlari>(context,listen: false).loadPriz6FromSharedPref();

    Provider.of<ProviderYayinlari>(context,listen: false).loadButon1FromSharedPref();
    Provider.of<ProviderYayinlari>(context,listen: false).loadButon2FromSharedPref();
    Provider.of<ProviderYayinlari>(context,listen: false).loadButon3FromSharedPref();
    Provider.of<ProviderYayinlari>(context,listen: false).loadButon4FromSharedPref();
    Provider.of<ProviderYayinlari>(context,listen: false).loadButon5FromSharedPref();
    Provider.of<ProviderYayinlari>(context,listen: false).loadButon6FromSharedPref();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown

    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.blue[900]!,
          accentColor: Colors.blue[900]!,
        ),
        home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Beklenilmeyen Bir Hata Oluştu'));
              } else if (snapshot.hasData) {
                return SplashScreen();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
