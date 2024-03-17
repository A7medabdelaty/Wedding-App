import 'package:cloud_firestore/cloud_firestore.dart';
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
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        // Check photographer collection
        DocumentSnapshot<Map<String, dynamic>> photographerSnapshot =
        await FirebaseFirestore.instance
            .collection('photographers')
            .doc(user.uid)
            .get();
        // Check user collection
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Determine user type based on which collection the user is found in
        if (photographerSnapshot.exists) {
          // User is a photographer
          emit(AuthenticationSuccessPhotographer(user));
        } else if (userSnapshot.exists) {
          // User is a regular user
          emit(AuthenticationSuccessUser(user));
        } else {
          // User not found in either collection
          emit(AuthenticationFailure(error: 'User not found'));
        }
      }
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