import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lift/core/common/models/message.dart';
import 'package:lift/core/common/service/member_profile_service.dart';
import 'package:lift/core/common/service/message_service.dart';
import 'package:lift/core/plugins/carousel_pro.dart';
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
        // appBar: AppBar(
        //   title: Text(
        //     widget.hireDetailCompany.name,
        //     style: const TextStyle(color: Colors.black),
        //   ),
        // ),
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _pageView(),
              SizedBox(
                width: double.maxFinite,
                child: _infoView(),
              ),
              _positionInfoViwe(),
              _mainWorkView(),
              _conditionView(),
              _hopeView(),
              _welfareAndBenefits(),
              _chatButton(),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                widget.hireDetailCompany.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              iconTheme: const IconThemeData(color: Colors.white)),
        ),
      ],
    ));
  }


  _chatButton() {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: colors.accentColor,
              surfaceTintColor: colors.accentColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Text('문의하기',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          ),
          onPressed: () async {
            _messageDialog(
                context: context, id: widget.hireDetailCompany.compId);
          },
        ),
      ),
    );
  }

  _infoView() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.hireDetailCompany.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '${widget.hireDetailCompany.name} • ${widget.hireDetailCompany.address.split(' ').take(2).join(' ').toString()} • 경력 ${widget.hireDetailCompany.exprMin}~${widget.hireDetailCompany.exprMax}년',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  _welfareAndBenefits() {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            '복지 및 혜택',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.hireDetailCompany.welfare),
          SizedBox(
            height: 10,
          ),
        ]));
  }

  _hopeView() {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            '우대사항',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.hireDetailCompany.hospitality),
          SizedBox(
            height: 10,
          ),
        ]));
  }

  _conditionView() {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            '자격요건',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.hireDetailCompany.hireCondition),
          SizedBox(
            height: 10,
          ),
        ]));
  }

  _positionInfoViwe() {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            '포지션 상세',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.hireDetailCompany.positionDetails),
          SizedBox(
            height: 10,
          ),
        ]));
  }

  _mainWorkView() {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            '주요엄무',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.hireDetailCompany.mainWork),
          SizedBox(
            height: 10,
          ),
        ]));
  }

  _pageView() {
    return AspectRatio(
        aspectRatio: 1.5 / 1,
        child: Carousel(
            autoplay: false,
            dotBgColor: Colors.transparent,
            dotIncreasedColor: colors.accentColor,
            images: [
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.hireDetailCompany.img,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.hireDetailCompany.img,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.hireDetailCompany.img,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            ]));
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
                            backgroundColor: colors.accentColor,
                            surfaceTintColor: colors.accentColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('보내기',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ),
                        onPressed: () async {
                          if (_messageFormKey.currentState!.validate()) {
                            final messageText =
                                _hireVM.messageController.value.text;
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
                            if (await messageService.send(
                                context: context, message: message)) {
                              await Fluttertoast.showToast(
                                msg: '성공적으로 메시지가 전달되었습니다.',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 13.0,
                              );
                            }
                            if (context.mounted) {
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
