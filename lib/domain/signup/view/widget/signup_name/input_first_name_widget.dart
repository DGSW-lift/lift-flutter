import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/utils/utils.dart';
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';

class InputFirstNameWidget extends StatelessWidget {
  InputFirstNameWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(SignupViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: loginVM.firstNameController.value,
        focusNode: loginVM.firstNameFocusNode.value,
        validator: (value) {
          if (value!.isEmpty) {
            Utils.snackBar('이름', '이름을 입력해주세요.');
          }
        },
        onChanged: (value) {
          if(value.isEmpty){
            loginVM.firstNameAvailable.value = false;
          } else {
            loginVM.firstNameAvailable.value = true;
          }
        },
        style: const TextStyle(
            color: Colors.black, fontSize: 15, fontFamily: 'NanumGothic'),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xff4F60FE),
                width: 2.0,
              )),
          contentPadding: const EdgeInsets.all(13),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xff4F60FE),
                width: 2.0,
              )),
          hintText: '이름을 입력해주세요',
        ));
  }
}
