import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {

  FirebaseAuth auth  = FirebaseAuth.instance;

  Future loginUser(String email, String password) async {
      await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future signUpUser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future signOut() async {
    await auth.signOut();
  }

  User? getCurrentUser() {
    return auth.currentUser;
  }

}