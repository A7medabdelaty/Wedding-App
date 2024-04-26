import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/data/profile.dart';

class DataFetchingCubit extends Cubit<Profile?> {
  DataFetchingCubit() : super(null);

  void fetchDataPhotographer(String photographerId) async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('photographers').doc(photographerId).get();
      if (docSnapshot.exists) {
        Profile profile = Profile.fromFirestore(docSnapshot);
        emit(profile);
      } else {
        emit(null);
      }
    } catch (e) {
      print(e);
    }
  }
  void fetchDataUser(String userId) async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (docSnapshot.exists) {
        Profile profile = Profile.fromFirestore(docSnapshot);
        emit(profile);
      } else {
        emit(null);
      }
    } catch (e) {
      print(e);
    }
  }
}