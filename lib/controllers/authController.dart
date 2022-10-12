import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  late GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  Rxn<GoogleSignInAccount> googleSignInAccount = Rxn(null);
  RxBool isSignedIn = RxBool(false);

  signWithGoogle() async {
    try {
      //enables to select account from the pop up dialog
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        Get.snackbar("", "failed to log in");
      } else {
        //assign user details to GoogleSigninAccount
        isSignedIn.value = true;
        googleSignInAccount.value = googleUser;
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credentials = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        await firebaseAuth.signInWithCredential(credentials);
        Get.snackbar("", googleSignInAccount.value!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  logout() async {
    await googleSignIn.disconnect();
    await firebaseAuth.signOut();
    isSignedIn.value=false;
  }

  @override
  void onInit() {
    googleSignIn = GoogleSignIn();
    super.onInit();
  }
}
