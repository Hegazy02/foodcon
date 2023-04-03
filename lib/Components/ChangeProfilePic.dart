import 'package:flutter/material.dart';
import 'package:foodcon/Helpers/bottomSheet.dart';
import 'package:foodcon/Services/imagePicker.dart';
import 'package:sizer/sizer.dart';

class changeProfilePic extends StatefulWidget {
  const changeProfilePic({super.key});

  @override
  State<changeProfilePic> createState() => _changeProfilePicState();
}

class _changeProfilePicState extends State<changeProfilePic> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Center(
              child: FutureBuilder(
                  future: BottomSheetHelpers.futureProfilePic,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CircleAvatar(
                        backgroundImage: FileImage(snapshot.data!),
                        radius: 60,
                      );
                    } else {
                      return CircleAvatar(
                        radius: 60,
                      );
                    }
                  }),
            ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
        Positioned(
          bottom: 0,
          right: 32.w,
          child: GestureDetector(
            onTap: () async {
              BottomSheetHelpers(isProfielPic: true).imagePicker(context);
            },
            child: Container(
              child: Icon(
                Icons.photo_camera,
                // color: KprimaryColor,
                size: 32,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      35,
                    ),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 4),
                      color: Colors.black.withOpacity(
                        0.3,
                      ),
                      blurRadius: 3,
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
