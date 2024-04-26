import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ImageVideoCubit extends Cubit<List<String>> {
  ImageVideoCubit() : super([]);

  Future<void> fetchImageURLs(String id) async {
    try {
      final images = await FirebaseFirestore.instance
          .collection('photographers')
          .doc(id)
          .collection("images")
          .get();

      final urls = images.docs.map((doc) => doc.data()['url'] as String).toList();
      emit(urls);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> fetchVideosUrls(String id) async {
    try {
      final videos = await FirebaseFirestore.instance
          .collection('photographers')
          .doc(id)
          .collection("videos")
          .get();

      final urls = videos.docs.map((doc) => doc.data()['url'] as String).toList();
      emit(urls);
    } catch (e) {
      // Handle error
    }
  }
}
