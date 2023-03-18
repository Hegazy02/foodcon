import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:math';

File? image;
final piker = ImagePicker();

var imageurl;
// Reference? refrance;
empty(setFun) {
  setFun(() {});
}

photofromCamera() async {
  XFile? piked = await piker.pickImage(source: ImageSource.camera);
  if (piked != null) {
    image = File(piked.path);
    int rand = Random().nextInt(1000000000);
    String imagename = "$rand${basename(piked.path)}";
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

photofromGallery(setFun) async {
  XFile? piked = await piker.pickImage(source: ImageSource.gallery);
  if (piked != null) {
    image = File(piked.path);

    int rand = Random().nextInt(1000000000);
    String imagename = "$rand${basename(piked.path)}";
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
