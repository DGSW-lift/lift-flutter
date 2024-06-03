import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lift/core/common/models/message.dart';
import 'package:lift/core/common/service/member_profile_service.dart';
import 'package:lift/core/common/service/message_service.dart';
import 'package:lift/core/common/widgets/custom_indicator_dialog.dart';
import 'package:lift/domain/hire/model/hire_detail_company.dart';
import 'package:lift/domain/hire/view_model/controller/hire_view_model.dart';
import 'package:get/get.dart';
import 'package:lift/domain/member/model/member_model.dart';
import 'package:lift/core/values/colors.dart' as colors;

class HireDetailView extends StatefulWidget {
  final HireDetailCompany hireDetailCompany;

  const HireDetailView({Key? key, required this.hireDetailCompany})
      : super(key: key);

  @override
  _HireDetailViewState createState() => _HireDetailViewState();
}

class _HireDetailViewState extends State<HireDetailView> {
  final _hireVM = Get.put(HireViewModel());

  final MemberProfileService _memberProfileService = Get.find();

  final _messageFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.hireDetailCompany.name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 15),
              child: ElevatedButton.icon(
                onPressed: () {
                  _messageDialog(
                      context: context, id: widget.hireDetailCompany.compId);
                },
                label: const Text(
                  '문의',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                icon: const Icon(
                  Icons.chat,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _messageDialog(
      {required BuildContext context, required int id}) async {
    if (!context.mounted) {
      return;
    }
    MemberModel revMember = await _hireVM.getProfileByCompanyId(id: id);
    if (revMember == null) {
      return;
    }
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Theme(
            data: Theme.of(context).copyWith(
              dialogBackgroundColor: Colors.white,
            ),
            child: AlertDialog(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: const Column(
                children: [
                  Text('문의',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: colors.accentColor,
                      )),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _messageFormKey,
                      child: TextFormField(
                        controller: _hireVM.messageController.value,
                        maxLength: 200,
                        autofocus: true,
                        autocorrect: false,
                        keyboardType: TextInputType.multiline,
                        minLines: 5,
                        maxLines: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "메시지를 입력해 주세요.";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "메시지를 입력해 주세요.",
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.white10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  colors.accentColor,
                            surfaceTintColor: colors.accentColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('보내기',
                              style:  TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ),
                        onPressed: () async {

                          if (_messageFormKey.currentState!.validate()) {

                            final messageText = _hireVM.messageController.value.text;
                            Message message = Message(
                                "text",
                                messageText,
                                null,
                                _memberProfileService.getEmail(),
                                _memberProfileService.getName(),
                                _memberProfileService.getImageURL(),
                                revMember.email,
                                '${revMember.firstName} ${revMember.lastName}',
                                revMember.imgUrl,
                                'token');

                            final messageService = MessageServiceImpl();
                            if(await messageService.send(context: context, message: message)){
                              await Fluttertoast.showToast(
                                msg: '성공적으로 메시지가 전달되었습니다.',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 13.0,
                              );
                            }
                            if(context.mounted){
                              _hireVM.messageController.value.clear();
                              Navigator.of(context).pop();
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
