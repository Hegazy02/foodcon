import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:math';

class CustomImagePicker {
  static File? profilePic;
  static File? recPic;

  final piker = ImagePicker();
  int? rand;
  String? imagename;
  var imageurl;
// Reference? refrance;

  Future<String?>? photofromCamera(
      {required context, required bool isProfilePic}) async {
    XFile? piked = await piker.pickImage(source: ImageSource.camera);
    if (piked != null) {
      if (isProfilePic) {
        profilePic = File(piked.path);

        rand = Random().nextInt(1000000000);
        imagename = "$rand${basename(piked.path)}";
        return piked.path;
      } else {
        recPic = File(piked.path);

        rand = Random().nextInt(1000000000);
        imagename = "$rand${basename(piked.path)}";
        return piked.path;
      }

      // refrance = FirebaseStorage.instance.ref("images").child(imagename);
      // ///////////
      // await refrance?.putFile(image!);
      // imageurl = await refrance!.getDownloadURL();
      // //////////
      // CollectionReference users =
      //     FirebaseFirestore.instance.collection(kUsersCollection);
      // updateMyAvatar(users, newuid ?? homeUid, imageurl);
    }
  }

  Future<String?>? photofromGallery(
      {required context, required bool isProfilePic}) async {
    XFile? piked = await piker.pickImage(source: ImageSource.gallery);
    if (piked != null) {
      if (isProfilePic) {
        profilePic = File(piked.path);

        rand = Random().nextInt(1000000000);
        imagename = "$rand${basename(piked.path)}";
        return piked.path;
      } else {
        recPic = File(piked.path);

        rand = Random().nextInt(1000000000);
        imagename = "$rand${basename(piked.path)}";
        return piked.path;
      }

      // refrance = FirebaseStorage.instance.ref("images").child(imagename);
      //////////
      // await refrance?.putFile(image!);
      // imageurl = await refrance!.getDownloadURL();
      // ///////////
      // CollectionReference users =
      //     FirebaseFirestore.instance.collection(kUsersCollection);
      // updateMyAvatar(users, newuid ?? homeUid, imageurl);
    }
  }
}
