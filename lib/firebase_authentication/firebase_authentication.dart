import 'package:firebase_auth/firebase_auth.dart';

import '../style/style.dart';

class FirebaseMethods {

  Future RegisterWithEmailPassword(email,password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
print("E:$email");
print("P:$password");


    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        ErrorToast("User is currently signed out!");
//loginscreen
      } else {
        SuccessToast("User is signed in!");

        print('User is signed in!');
      }
    });
    // FirebaseAuth.instance
    //     .authStateChanges()
    //     .listen((User? user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //   } else {
    //     print('User is signed in!');
    //   }
    // });


    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }


  Future Login(email,password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email,
          password: password
      );

SuccessToast("Successfully Login");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ErrorToast('No user found for that email.');

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ErrorToast('Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
  }
}