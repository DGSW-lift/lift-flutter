import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';

class ImageProfileWidget extends StatelessWidget {
  ImageProfileWidget({Key? key}) : super(key: key);

  final ImagePicker picker = ImagePicker();
  final _signUpVM = Get.put(SignupViewModel());

  Future getImage(BuildContext context, ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      await selectedImage(context, file);
    }
  }

  Future<void> selectedImage(BuildContext context, File? image) async {
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
                toolbarTitle: "사진 편집",
                toolbarColor: Theme.of(context).primaryColor,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: true),
            IOSUiSettings(
              title: "사진 편집",
              aspectRatioLockEnabled: true,
            ),
          ]);

      // Hold the file
      File? imageFile;
      // Check
      if (croppedFile != null) {
        imageFile = File(croppedFile.path);
        _signUpVM.profileImage.value = imageFile;
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showPickerDialog(context),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Obx(
                () => _signUpVM.profileImage.value != null
                    ? Image.file(
                        _signUpVM.profileImage.value!,
                        // File(_signUpVM.profileImage.value!.path),
                        fit: BoxFit.cover,
                        width: 130,
                        height: 130,
                      )
                    : Image.asset(
                        'assets/images/DefalutProfile.png',
                        width: 130,
                        height: 130,
                      ),
              )),
          Positioned(
            width: 45,
            height: 45,
            left: 87,
            bottom: 5,
            child: Image.asset('assets/images/CameraImg.png'),
          )
        ],
      ),
    );
  }

  Future<void> _showPickerDialog(BuildContext context) async {
    final option = await _showImagePickerDialog(context);
    if (option != null) {
      switch (option) {
        case 'gallery':
          getImage(context, ImageSource.gallery);
          break;
        case 'camera':
          getImage(context, ImageSource.camera);
          break;
      }
    }
  }

  Future<String?> _showImagePickerDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('프로필 이미지 선택'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('이미지 가져오기'),
                onTap: () {
                  Navigator.pop(context, 'gallery');
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('사진 찍기'),
                onTap: () {
                  Navigator.pop(context, 'camera');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
