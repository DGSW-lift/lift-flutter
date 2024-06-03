import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/common/service/member_profile_service.dart';
import 'package:lift/core/common/widgets/cached_circle_avatar.dart';
import 'package:lift/core/common/widgets/custom_app_bar.dart';
import 'package:lift/core/common/widgets/custom_indicator_dialog.dart';
import 'package:lift/core/common/widgets/my_badge.dart';
import 'package:lift/core/values/constants.dart';
import 'package:lift/domain/chat/view/chat_view.dart';
import 'package:lift/domain/conversation/view_model/controller/conversation_view_model.dart';
import 'package:lift/domain/member/model/member_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class ConversationView extends StatefulWidget {
  const ConversationView({Key? key}) : super(key: key);

  @override
  _ConversationViewState createState() => _ConversationViewState();
}

class _ConversationViewState extends State<ConversationView> {
  final _conversationVM = Get.put(ConversationViewModel());
  final MemberProfileService _memberProfileService = Get.find();
  late CustomIndicatorDialog _pr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeago.setLocaleMessages('ko', timeago.KoMessages());
    _conversationVM.messagesListener(email: _memberProfileService.getEmail());
  }

  @override
  Widget build(BuildContext context) {
    _pr = CustomIndicatorDialog(context, isDismissible: false);
    return SafeArea(
        child: Column(
      children: [
        CustomAppBar(
          title: '채팅',
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Obx(() => ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(height: 10),
                  itemCount: _conversationVM.listMessage.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot<Map<String, dynamic>> conversation =
                        _conversationVM.listMessage[index];
                    return Container(
                      // color: !conversation[MESSAGE_READ]
                      //     ? Theme.of(context).primaryColor.withAlpha(40)
                      //     : null,
                      child: ListTile(
                        leading:
                            CachedCicleAvatar(conversation[USER_PROFILE_PHOTO]),
                        title: Text(conversation[USER_FULLNAME],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        subtitle: conversation[MESSAGE_TYPE] == 'text'
                            ? Text("${conversation[LAST_MESSAGE]}\n"
                                "${timeago.format(conversation[TIMESTAMP].toDate(), locale: 'ko')}")
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(Icons.photo_camera,
                                      color: Theme.of(context).primaryColor),
                                  const SizedBox(width: 5),
                                  const Text('사진'),
                                ],
                              ),
                        trailing: !conversation[MESSAGE_READ]
                            ? MyBadge(
                                text: conversation[MESSAGE_BADGE].toString(),
                              )
                            // MyBadge(text: _i18n.translate("new"))
                            : null,
                        onTap: () async {
                          await _pr.show();
                          await conversation.reference
                              .update({MESSAGE_READ: true});
                          MemberModel? revMemberProfile =
                              await _conversationVM.getMemberProfileByEmail(
                                  email: conversation[USER_ID]);
                          await  _pr.hide();
                          if (revMemberProfile != null) {
                            Get.to(() => ChatView(
                                  revMember: revMemberProfile,
                                ));
                          }
                        },
                      ),
                    );
                  },
                )))
      ],
    ));
  }
}
