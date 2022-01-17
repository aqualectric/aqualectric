import 'package:firebase_auth/firebase_auth.dart';

class AuthClass{

  FirebaseAuth auth = FirebaseAuth.instance;

  //Create
  Future<String?> createAccount({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return "Account created";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Zayıf şifre';
      } else if (e.code == 'email-already-in-use') {
        return 'Bu e-posta kullanılıyor.';
      }
      else{
        if(email =="" || password == "" ){
          return"Boş Kısımları Doldurunuz";
        }
        else{
          return "Hatalı Giriş";
        }
      }
    } catch (e) {
      return "Hata";
    }
  }
  //sign in user
  Future<String?> signIN({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Böyle bir e-mail bulunamadı';
      } else if (e.code == 'wrong-password') {
        return 'Yanlış şifre';
      }
      else{
        return "Hatalı Giriş";
      }
    }
  }
  //reset password
  Future<String> resetPassword({required String email}) async{

    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      return "Emaile gönderildi";
    }catch(e){
      return "Hatalı Giriş";
    }
  }
  //SignOut
  void signOut() {
    auth.signOut();
  }





}
