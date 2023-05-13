import 'package:get/get.dart';
import '../app_logger.dart';
import '../firebase_ref/references.dart';

class FirebaseStorageService extends GetxService {
  /* method to get image from firebase storage (load image) */
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }

    try {
      /* define the path of file in firebase storage */
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (error) {
      AppLogger.e(error);
      return null;
    }
  }
}
