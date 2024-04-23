import 'package:flutter/material.dart';
import 'package:lift/View/widget/resource/custom_indicator_dialog.dart';
import 'package:lift/core/common/widgets/circle_button.dart';
import 'package:lift/core/values/colors.dart' as colors;
import 'package:lift/domain/signup/model/signup_request.dart';
import 'package:lift/domain/signup/view/signup_complete_view.dart';
import 'package:lift/domain/signup/view/widget/signup_interest/input_interest_tag_widget.dart';
import 'package:lift/domain/signup/view/widget/signup_interest/list_interest_tag_widget.dart';
import 'package:get/get.dart';
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';

class SignupInterestView extends StatefulWidget {
  const SignupInterestView({super.key});

  @override
  State<SignupInterestView> createState() => _SignupInterestViewState();
}

class _SignupInterestViewState extends State<SignupInterestView> {

  final loginVM = Get.put(SignupViewModel());
  late CustomIndicatorDialog _pr;

  @override
  void initState() {
    super.initState();
    _pr = CustomIndicatorDialog(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginVM.fetchInterest("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Column(
              children: [
                _interestText(),
                InputLastNameWidget(
                    distanceToField: MediaQuery.of(context).size.width),
                ListInterestTagWidget()
              ],
            )  ,
          ),
        ),
        floatingActionButton: CircleButton(
            icon: const Icon(
              Icons.navigate_next,
              color: Colors.white,
            ),
            bgColor: colors.accentColor,
            padding: 20,
            onTap: () async {
              await _pr.show();
              if(await loginVM.signup()) {
                await  Get.offAll(() => const SignUpCompleteView());
              }
              await _pr.hide();
      // loginVM.
            }));
  }

  Widget _interestText() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('활동분야를',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumGothicBold',
                  fontSize: 30),
              textAlign: TextAlign.left),
          Text('선택해 주세요',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumGothicBold',
                  fontSize: 30),
              textAlign: TextAlign.left),
        ],
      ),
    );
  }
}
