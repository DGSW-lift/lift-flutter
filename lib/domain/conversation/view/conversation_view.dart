import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/domain/conversation/view/widget/custom_app_bar.dart';
import 'package:lift/domain/conversation/view_model/controller/conversation_view_model.dart';

class ConversationView extends StatefulWidget {
  const ConversationView({Key? key}) : super(key: key);

  @override
  _ConversationViewState createState() => _ConversationViewState();
}

class _ConversationViewState extends State<ConversationView> {
  final _conversationVM = Get.put(ConversationViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        CustomAppBar(),
        Expanded(
            child: Obx(() => ListView.separated(
                  itemBuilder: (context, index) {
                    final DocumentSnapshot<Map<String, dynamic>>
                    conversation =  _conversationVM.messages.value!.docs[index];
                    return Container(
                      // color: !conversation[MESSAGE_READ]
                      //     ? Theme.of(context).primaryColor.withAlpha(40)
                      //     : null,
                      // child: ListTile(
                      //   leading:
                      //   CachedCicleAvatar(conversation[USER_PROFILE_PHOTO]),
                      //   title: Text(
                      //       conversation[USER_FULLNAME].split(" ")[0],
                      //       style: const TextStyle(fontSize: 18)),
                      //   subtitle: conversation[MESSAGE_TYPE] == 'text'
                      //       ? Text("${conversation[LAST_MESSAGE]}\n"
                      //       "${timeago.format(conversation[TIMESTAMP].toDate())}")
                      //       : Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: <Widget>[
                      //       Icon(Icons.photo_camera,
                      //           color:
                      //           Theme.of(context).primaryColor),
                      //       const SizedBox(width: 5),
                      //       Text(_i18n.translate("photo")),
                      //     ],
                      //   ),
                      //   trailing: !conversation[MESSAGE_READ]
                      //       ? MyBadge(text: conversation[MESSAGE_BADGE].toString(),)
                      //   // MyBadge(text: _i18n.translate("new"))
                      //       : null,
                      //   onTap: () async {
                      //     /// Show progress dialog
                      //     _pr.show();
                      //     /// 1.) Set conversation read = true
                      //     await conversation.reference
                      //         .update({MESSAGE_READ: true});
                      //     /// 2.) Get updated user info
                      //     MemberData? memData = await _findMemberVM.getMemberDataById(conversation[USER_ID]);
                      //     /// Hide progrees
                      //     _pr.hide();
                      //     if(memData == null){
                      //       return;
                      //     }
                      //     // /// Go to chat screen
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) =>
                      //             ChatView(user: memData!)));
                      //   },
                      // ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(height: 10),
                  itemCount: _conversationVM.messages.value!.docs.length,
                )))
      ],
    ));
  }
}
