import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding/features/auth/manager/auth_cubit/auth_state.dart';

class AuthenticationCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthenticationCubit() : super(AuthenticationInitial());

  void signInWithEmailAndPassword(String email, String password) async {
    try {
      emit(AuthenticationLoading());
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthenticationSuccess(FirebaseAuth.instance.currentUser));
    } catch (e) {
      emit(AuthenticationFailure(error: e.toString()));
    }
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      emit(AuthenticationLoading());
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = _firebaseAuth.currentUser;
      emit(AuthenticationSuccess(user));
      return user;
    } catch (e) {
      emit(AuthenticationFailure(error: e.toString()));
      return null;
    }
  }

  void signOut() async {
    await _firebaseAuth.signOut();
    emit(AuthenticationInitial());
  }

  void resetPassword(String email) async {
    try {
      emit(AuthenticationLoading());
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      emit(AuthenticationSuccess(FirebaseAuth.instance.currentUser));
    } catch (e) {
      emit(AuthenticationFailure(error: e.toString()));
    }
  }
}