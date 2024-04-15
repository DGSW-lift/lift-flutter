import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lift/View/widget/resource/custom_appbar.dart';

// 회원가입 -> 이메일 입력후 비밀번호 설정 -> 이름 입력 받기 -> 사진 등록창

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
            _profileDescriptionText(),
             Spacer(),
            _nextButton()    
          ],
        ),
      ),
    );
  }

  Widget _registerProfileText() {
    final Map arguments = Get.arguments as Map;
    final String firstName = arguments['firstName'];
    final String lastName = arguments['lastName'];
    // 이름 입력 페이지에서 getx로 이름 인자 받아오기
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
    // FIX: 코드 재사용 가능할거같음
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
                      switch (option) {
                        case 'gallery':
                          getImage(ImageSource.gallery);
                          break;
                        case 'camera':
                          getImage(ImageSource.camera);
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
  // 프로필 설정 페이지 텍스트 영역
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

Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20, bottom: 15),
          child: IconButton(
            icon: const Image(
                image: AssetImage('assets/images/NextButton.png'),
                height: 50,
                width: 50),
            onPressed: () {
              List<XFile> _selectedFiles = [];
              // FIX: 다음 버튼을 눌렀을때 뷰모델에 프로필 XFile 인자 저장해두기
              Get.to(
                () => const (),                
              // 활동 분야 페이지로 이동
              );
            },
          ),
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
          ],
        ),
      );
    },
  );
}
