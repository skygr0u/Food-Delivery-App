import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Get instance of Firebase Auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      // Sign user in
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      // Catch any errors
      if (e is FirebaseAuthException) {
        throw Exception(e.message);
      } else {
        throw Exception('An unknown error occurred');
      }
    }
  }

  // Sign up with email and password
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try {
      // Sign user in
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      // Catch any errors
      if (e is FirebaseAuthException) {
        throw Exception(e.message);
      } else {
        throw Exception('An unknown error occurred');
      }
    }
  }

  // Sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
