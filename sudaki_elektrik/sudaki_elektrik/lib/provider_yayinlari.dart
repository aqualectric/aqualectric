import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProviderYayinlari with ChangeNotifier {

  late SharedPreferences _sharedPrefObject ;
  Future <void> createdSharedPrefObject()async{
    _sharedPrefObject = await SharedPreferences.getInstance();
  }

  /// Priz İsimleri
  String priz1 = 'Priz 1';
  String priz2 = 'Priz 2';
  String priz3 = 'Priz 3';
  String priz4 = 'Priz 4';
  String priz5 = 'Priz 5';
  String priz6 = 'Priz 6';


  void yeniIsim1(String isim1) {
    priz1 = isim1;
    savePriz1ToSharedPref(priz1);
    notifyListeners();
  }

  void savePriz1ToSharedPref(String priz1){
    _sharedPrefObject.setString('Priz 1', priz1);
  }

  void loadPriz1FromSharedPref  ()async{
    await createdSharedPrefObject();
    priz1 = _sharedPrefObject.getString('Priz 1')!;
  }

  void yeniIsim2(String isim2) {
    priz2 = isim2;
    savePriz2ToSharedPref(priz2);
    notifyListeners();
  }

  void savePriz2ToSharedPref(String priz2){
    _sharedPrefObject.setString('Priz 2', priz2);
  }

  void loadPriz2FromSharedPref  ()async{
    await createdSharedPrefObject();
    priz2 = _sharedPrefObject.getString('Priz 2')!;
  }

  void yeniIsim3(String isim3) {
    priz3 = isim3;
    savePriz3ToSharedPref(priz3);
    notifyListeners();
  }

  void savePriz3ToSharedPref(String priz3){
    _sharedPrefObject.setString('Priz 3', priz3);
  }

  void loadPriz3FromSharedPref  ()async{
    await createdSharedPrefObject();
    priz3 = _sharedPrefObject.getString('Priz 3')!;
  }

  void yeniIsim4(String isim4) {
    priz4 = isim4;
    savePriz4ToSharedPref(priz4);
    notifyListeners();
  }

  void savePriz4ToSharedPref(String priz4){
    _sharedPrefObject.setString('Priz 4', priz4);
  }

  void loadPriz4FromSharedPref  ()async{
    await createdSharedPrefObject();
    priz4 = _sharedPrefObject.getString('Priz 4')!;
  }

  void yeniIsim5(String isim5) {
    priz5 = isim5;
    savePriz5ToSharedPref(priz5);
    notifyListeners();
  }

  void savePriz5ToSharedPref(String priz5){
    _sharedPrefObject.setString('Priz 5', priz5);
  }

  void loadPriz5FromSharedPref  ()async{
    await createdSharedPrefObject();
    priz5 = _sharedPrefObject.getString('Priz 5')!;
  }

  void yeniIsim6(String isim6) {
    priz6 = isim6;
    savePriz6ToSharedPref(priz6);
    notifyListeners();
  }

  void savePriz6ToSharedPref(String priz6){
    _sharedPrefObject.setString('Priz 6', priz6);
  }

  void loadPriz6FromSharedPref  ()async{
    await createdSharedPrefObject();
    priz6 = _sharedPrefObject.getString('Priz 6')!;
  }

  /// Butonlar
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;
  bool isSwitched6 = false;


  void yeniButon1 (bool buton1) {
    isSwitched1 = buton1;
    saveButon1ToSharedPref(isSwitched1);
    notifyListeners();
  }

  void saveButon1ToSharedPref(bool isSwitched1){
    _sharedPrefObject.setBool( 'Buton 1',isSwitched1);
  }

  void loadButon1FromSharedPref  ()async{
    await createdSharedPrefObject();
    isSwitched1 = _sharedPrefObject.getBool('Buton 1')!;
  }

  void yeniButon2 (bool buton2) {
    isSwitched2 = buton2;
    saveButon2ToSharedPref(isSwitched2);
    notifyListeners();
  }

  void saveButon2ToSharedPref(bool isSwitched2){
    _sharedPrefObject.setBool('Priz 2', isSwitched2);
  }

  void loadButon2FromSharedPref () async {
    await createdSharedPrefObject();
    isSwitched2 = _sharedPrefObject.getBool('Priz 2')!;
  }

  void yeniButon3 (bool buton3) {
    isSwitched3 = buton3;
    saveButon3ToSharedPref(isSwitched3);
    notifyListeners();
  }

  void saveButon3ToSharedPref(bool isSwitched3){
    _sharedPrefObject.setBool('Priz 3', isSwitched3);
  }

  void loadButon3FromSharedPref () async {
    await createdSharedPrefObject();
    isSwitched3 = _sharedPrefObject.getBool('Priz 3')!;
  }

  void yeniButon4 (bool buton4) {
    isSwitched4 = buton4;
    saveButon4ToSharedPref(isSwitched4);
    notifyListeners();
  }

  void saveButon4ToSharedPref(bool isSwitched4){
    _sharedPrefObject.setBool('Priz 4', isSwitched4);
  }

  void loadButon4FromSharedPref () async {
    await createdSharedPrefObject();
    isSwitched4 = _sharedPrefObject.getBool('Priz 4')!;
  }

  void yeniButon5 (bool buton5) {
    isSwitched5 = buton5;
    saveButon5ToSharedPref(isSwitched5);
    notifyListeners();
  }

  void saveButon5ToSharedPref(bool isSwitched5){
    _sharedPrefObject.setBool('Priz 5', isSwitched5);
  }

  void loadButon5FromSharedPref () async {
    await createdSharedPrefObject();
    isSwitched5 = _sharedPrefObject.getBool('Priz 5')!;
  }

  void yeniButon6 (bool buton6) {
    isSwitched6 = buton6;
    saveButon6ToSharedPref(isSwitched6);
    notifyListeners();
  }

  void saveButon6ToSharedPref(bool isSwitched6){
    _sharedPrefObject.setBool('Priz 6', isSwitched6);
  }

  void loadButon6FromSharedPref () async {
    await createdSharedPrefObject();
    isSwitched6 = _sharedPrefObject.getBool('Priz 6')!;
  }

}

