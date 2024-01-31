
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle()async{
    try{
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
         if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;


        final  credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        return await _auth.signInWithCredential(credential);
      }
    }
    on FirebaseAuthException {
      rethrow;
    }
  }
}
