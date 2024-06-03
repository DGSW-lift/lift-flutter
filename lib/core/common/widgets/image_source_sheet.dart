
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  // Constructor
  ImageSourceSheet({Key? key, required this.onImageSelected}) : super(key: key);

  // Callback function to return image file
  final Function(File?) onImageSelected;
  // ImagePicker instance
  final picker = ImagePicker();

  Future<void> selectedImage(BuildContext context, File? image) async {
    // init i18n
    // Check file
    if (image != null) {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [CropAspectRatioPreset.square],
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          cropStyle: CropStyle.rectangle,
          maxWidth: 500,
          maxHeight: 500,
          compressQuality: 100,
          compressFormat: ImageCompressFormat.jpg,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: '사진 편집',
                toolbarColor: Theme.of(context).primaryColor,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: true),
            IOSUiSettings(
              title: '사진 편집',
              aspectRatioLockEnabled: true,
            ),
          ]);

      // Hold the file
      File? imageFile;

      // Check
      if (croppedFile != null) {
        imageFile = File(croppedFile.path);
      }

      // Callback
      onImageSelected(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Variables
    final list = ['카메라', '갤러리'];

    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 100,
        width: 300.0,
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(list[index]),
              onTap: () async {
                // Navigator.of(context).pop();
                if (index == 0) {
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedFile == null) return;
                  selectedImage(context, File(pickedFile.path));
                } else {
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile == null) return;
                  selectedImage(context, File(pickedFile.path));
                }
              },
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('닫기'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        )
      ],
    );
  }
}
