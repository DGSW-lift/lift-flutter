import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lift/View/widget/resource/custom_appbar.dart';

class RegisterProfilePicture extends StatefulWidget {
  const RegisterProfilePicture({super.key});

  @override
  State<RegisterProfilePicture> createState() => _RegisterProfilePictureState();
}

class _RegisterProfilePictureState extends State<RegisterProfilePicture> {
  XFile? _profileImage;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _profileImage = XFile(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            _registerProfileText(),
            const SizedBox(height: 25),
            _profileImageArea(),
            const SizedBox(height: 40),
            _profileDescriptionText()
          ],
        ),
      ),
    );
  }

  Widget _registerProfileText() {
    final Map arguments = Get.arguments as Map;
    final String firstName = arguments['firstName'];
    final String lastName = arguments['lastName'];
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$firstName$lastName님, \n프로필사진을 등록해보세요',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumGothicBold',
                  fontSize: 25),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _profileImageArea() {
    return _profileImage != null
        ? Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(65),
                child: Image.file(
                  File(_profileImage!.path),
                  fit: BoxFit.cover,
                  width: 130,
                  height: 130,
                ),
              ),
              Positioned(
                width: 45,
                height: 45,
                left: 87,
                bottom: 5,
                child: InkWell(
                  onTap: () async {
                    final option = await showImagePickerDialog(context);
                    if (option != null) {
                      // 선택한 옵션 처리
                      switch (option) {
                        case 'gallery':
                          getImage(ImageSource.gallery);
                          break;
                        case 'camera':
                          getImage(ImageSource.camera);
                          break;
                        case 'default':
                        
                        break;
                      }
                    }
                  },
                  child: Image.asset('assets/images/CameraImg.png'),
                ),
              ),
            ],
          )
        : Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/DefalutProfile.png',
                  width: 130,
                  height: 130,
                ),
              ),
              Positioned(
                width: 45,
                height: 45,
                left: 87,
                bottom: 5,
                child: InkWell(
                  onTap: () async {
                    final option = await showImagePickerDialog(context);
                    if (option != null) {
                      // 선택한 옵션 처리
                      switch (option) {
                        case 'gallery':
                          getImage(ImageSource.gallery);
                          break;
                        case 'camera':
                          getImage(ImageSource.camera);
                          break;
                        case 'default':
                          break;
                      }
                    }
                  },
                  child: Image.asset('assets/images/CameraImg.png'),
                ),
              )
            ],
          );
  }
}

Widget _profileDescriptionText() {
  return const Column(
    children: [
      Text(
        '자연스러운 사진을 올려주세요',
        style: TextStyle(
            fontFamily: 'NamunGothic',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xff898989)),
      ),
      Text(
        '사진은 언제든지 바꿀수있어요',
        style: TextStyle(
            fontFamily: 'NamunGothic',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xff898989)),
      ),
    ],
  );
}

Future<String?> showImagePickerDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
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
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('기본 이미지 사용'),
              onTap: () {
                Navigator.pop(context, 'default');
              },
            ),
          ],
        ),
      );
    },
  );
}
