import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudaki_elektrik/degiskenler.dart';
import 'package:sudaki_elektrik/provider_yayinlari.dart';


class AyarSayfasi extends StatefulWidget {
  static const String routeName = '/ayarSayfasi';
  @override
  _AyarSayfasiState createState() => _AyarSayfasiState();
}



class _AyarSayfasiState extends State<AyarSayfasi> {
  @override
  Widget build(BuildContext context) {

    Function yeniIsim1 = Provider.of<ProviderYayinlari>(context).yeniIsim1;
    Function yeniIsim2 = Provider.of<ProviderYayinlari>(context).yeniIsim2;
    Function yeniIsim3 = Provider.of<ProviderYayinlari>(context).yeniIsim3;
    Function yeniIsim4 = Provider.of<ProviderYayinlari>(context).yeniIsim4;
    Function yeniIsim5 = Provider.of<ProviderYayinlari>(context).yeniIsim5;
    Function yeniIsim6 = Provider.of<ProviderYayinlari>(context).yeniIsim6;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900]!,
        title: Text('Ayarlar', style: kBaslikStili),
        centerTitle: true,
      ),
      body:ListView(
        children: <Widget>[
          Card(color: Colors.white,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Card(
                  color: Colors.blue[900]!,
                  child: Container(height: 45,
                    child: Center(child: Text('Priz İsimleri',style: kMetinStili,)),
                  ),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                    child: Column(
                      children: <Widget> [
                        Text('Priz 1:',style: kMetinStili,),
                        TextField(onChanged:(input){
                          yeniIsim1(input);
                        }),
                      ],
                    )
                  ),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                      child: Column(
                        children: <Widget> [
                          Text('Priz 2:',style: kMetinStili,),
                          TextField(onChanged:(input){
                            yeniIsim2(input);
                          }),
                        ],
                      )
                  ),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                      child: Column(
                        children: <Widget> [
                          Text('Priz 3:',style: kMetinStili,),
                          TextField(onChanged:(input){
                            yeniIsim3(input);
                          }),
                        ],
                      )
                  ),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                      child: Column(
                        children: <Widget> [
                          Text('Priz 4:',style: kMetinStili,),
                          TextField(onChanged:(input){
                            yeniIsim4(input);
                          }),
                        ],
                      )
                  ),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                      child: Column(
                        children: <Widget> [
                          Text('Priz 5:',style: kMetinStili,),
                          TextField(onChanged:(input){
                            yeniIsim5(input);
                          }),
                        ],
                      )
                  ),
                ),
                Card(
                  color: Colors.blue[900]!,
                  child: Container(
                      child: Column(
                        children: <Widget> [
                          Text('Priz 6:',style: kMetinStili,),
                          TextField(onChanged:(input){
                            yeniIsim6(input);
                          }),
                        ],
                      )
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





