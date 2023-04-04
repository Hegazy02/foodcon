import 'package:flutter/material.dart';
import 'package:foodcon/Helpers/bottomSheet.dart';
import 'package:foodcon/Services/imagePicker.dart';
import 'package:foodcon/constants.dart';

class chefSettingsPage extends StatelessWidget {
  const chefSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: BottomSheetHelpers.futureProfilePic,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(
                  trailing: CircleAvatar(
                      radius: 30, child: Image.network(snapshot.data!)),
                );
              } else if (CustomImagePicker.profilePic != null) {
                return ListTile(
                    trailing: CircleAvatar(
                        radius: 30,
                        child: Image.file(CustomImagePicker.profilePic!)));
              } else {
                return ListTile(
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundColor: KprimaryColor,
                  ),
                );
              }
            })
      ],
    );
  }
}
