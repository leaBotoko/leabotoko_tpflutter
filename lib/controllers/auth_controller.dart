import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Connexion avec email et mot de passe
  Future<UserModel?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserModel(
        uid: userCredential.user?.uid,
        email: userCredential.user?.email,
      );
    } catch (e) {
      print('Erreur connexion: $e');
      return null;
    }
  }

  // Déconnexion
  Future<void> logout() async {
    await _auth.signOut();
  }
}
// Inscription
Future<UserModel?> register(String email, String password, String name) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    // Tu peux ajouter le nom dans Firestore si nécessaire
    // FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
    //   'name': name,
    //   'email': email,
    // });

    return UserModel(
      uid: userCredential.user?.uid,
      email: userCredential.user?.email,
    );
  } catch (e) {
    print('Erreur inscription: $e');
    return null;
  }
}
