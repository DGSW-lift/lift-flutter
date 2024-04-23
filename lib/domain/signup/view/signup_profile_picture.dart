
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/common/widgets/circle_button.dart';
import 'package:lift/domain/signup/view/signup_interest_view.dart';
import 'package:lift/domain/signup/view/widget/profile/image_profile.dart';
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';
import 'package:lift/core/values/colors.dart' as colors;

class SignUpProfilePicture extends StatefulWidget {
  const SignUpProfilePicture({super.key});

  @override
  State<SignUpProfilePicture> createState() => _SignUpProfilePictureState();
}

class _SignUpProfilePictureState extends State<SignUpProfilePicture> {
  final _signUpVM = Get.put(SignupViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(surfaceTintColor: Colors.white,),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Column(
              children: [
                _registerProfileText(),
                const SizedBox(height: 25),
                ImageProfileWidget(),
                const SizedBox(height: 40),
                _profileDescriptionText(),
              ],
            ),
          ),
        ),
        floatingActionButton: CircleButton(
            icon: const Icon(
              Icons.navigate_next,
              color: Colors.white,
            ),
            bgColor: colors.accentColor,
            padding: 20,
            onTap: () {
              if(_signUpVM.profileImage.value != null) {
                Get.to(const SignupInterestView());
              }
            }));
  }

  Widget _registerProfileText() {
    final Map arguments  = Get.arguments as Map;
    final String firstName = arguments['firstName'];
    // 이름 입력 페이지에서 이름만 들고 옴 

    // final String lastName = arguments['lastName'];
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$firstName님, \n프로필사진을 등록해보세요',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumGothicBold',
                  fontSize: 25),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

// Widget _profileImageArea() {
//   return InkWell(
//     onTap: () => _showPickerDialog(context),
//     child: Stack(
//       children: [
//         ClipRRect(
//             borderRadius: BorderRadius.circular(30),
//             child: Obx(
//               () => _signUpVM.profileImageAvailable.value &&
//                       _profileImage != null
//                   ? Image.file(
//                       File(_profileImage!.path),
//                       fit: BoxFit.cover,
//                       width: 130,
//                       height: 130,
//                     )
//                   : Image.asset(
//                       'assets/images/DefalutProfile.png',
//                       width: 130,
//                       height: 130,
//                     ),
//             )),
//         Positioned(
//           width: 45,
//           height: 45,
//           left: 87,
//           bottom: 5,
//           child: Image.asset('assets/images/CameraImg.png'),
//         )
//       ],
//     ),
//   );
// }
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
