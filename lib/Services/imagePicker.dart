import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:math';

class CustomImagePicker {
  static File? pic;

  final piker = ImagePicker();

  var imageurl;
// Reference? refrance;
  empty(setFun) {
    setFun(() {});
  }

  Future<File?> photofromCamera({required context}) async {
    XFile? piked = await piker.pickImage(source: ImageSource.camera);
    if (piked != null) {
      pic = File(piked.path);

      int rand = Random().nextInt(1000000000);
      String imagename = "$rand${basename(piked.path)}";

      return pic;

      // refrance = FirebaseStorage.instance.ref("images").child(imagename);
      // ///////////
      // await refrance?.putFile(image!);
      // imageurl = await refrance!.getDownloadURL();
      // //////////
      // CollectionReference users =
      //     FirebaseFirestore.instance.collection(kUsersCollection);
      // updateMyAvatar(users, newuid ?? homeUid, imageurl);

      // empty(setFun);
    }
  }

  Future<File?> photofromGallery({required context}) async {
    XFile? piked = await piker.pickImage(source: ImageSource.gallery);
    if (piked != null) {
      pic = File(piked.path);

      int rand = Random().nextInt(1000000000);
      String imagename = "$rand${basename(piked.path)}";

      return pic;

      // refrance = FirebaseStorage.instance.ref("images").child(imagename);
      //////////
      // await refrance?.putFile(image!);
      // imageurl = await refrance!.getDownloadURL();
      // ///////////
      // CollectionReference users =
      //     FirebaseFirestore.instance.collection(kUsersCollection);
      // updateMyAvatar(users, newuid ?? homeUid, imageurl);

      // empty(setFun);
    }
  }
}
