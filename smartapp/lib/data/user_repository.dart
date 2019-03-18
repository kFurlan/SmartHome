import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final auth = FirebaseAuth.instance;

  Future<void> signIn({
    @required String email,
    @required String password,
  }) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUser({
    @required String email,
    @required String password,
  }) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

   Future<bool> isSigned() async {
    return await auth.currentUser() != null;
  }
}
