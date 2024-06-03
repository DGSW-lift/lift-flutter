import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lift/core/common/models/message.dart';
import 'package:lift/core/common/service/member_profile_service.dart';
import 'package:lift/core/common/service/message_service.dart';
import 'package:lift/core/common/widgets/image_source_sheet.dart';
import 'package:lift/core/values/constants.dart';
import 'package:lift/domain/chat/view/widget/chat_message.dart';
import 'package:lift/domain/chat/view_model/chat_view_model.dart';
import 'package:lift/domain/member/model/member_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatView extends StatefulWidget {
  final MemberModel revMember;

  const ChatView({Key? key, required this.revMember}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView>
    with AutomaticKeepAliveClientMixin {
  final _chatVM = Get.put(ChatViewModel());
  final MemberProfileService _memberProfileService = Get.find();

  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('ko', timeago.KoMessages());
    _chatVM.setup(withUserId: widget.revMember.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: GestureDetector(
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 0),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(widget.revMember.imgUrl),
                onBackgroundImageError: (e, s) => {debugPrint(e.toString())},
              ),
              title: Text(
                '${widget.revMember.firstName} ${widget.revMember.lastName}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {},
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
                initialValue: "",
                splashRadius: 10,
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem(
                      value: "delete_chat",
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.delete, size: 20,),
                          SizedBox(width: 5),
                          Text('대화삭제', style: TextStyle(fontSize: 17),),
                        ],
                      )),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                      value: "delete_match",
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.block, size: 20,),
                          const SizedBox(width: 5),
                          Text('차단', style: const TextStyle(fontSize: 17),)
                        ],
                      )),
                ])
          ]),
      body: SafeArea(
        child: Column(
          children: [
            _showMessages(),
            Container(
              color: Colors.grey.withAlpha(30),
              child: ListTile(
                leading: IconButton(
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 20,
                    ),
                    onPressed: () async {
                      await _getImage();
                      await _chatVM.scrollMessageList();
                    }),
                title: TextField(
                  controller: _chatVM.textController.value,
                  minLines: 1,
                  maxLines: 4,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: '',
                    filled: true,
                    isDense: true,
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  onChanged: (text) {},
                ),
                trailing: InkWell(
                  onTap: () async {
                    final text = _chatVM.textController.value.text.trim();
                    if (text.isEmpty) {
                      return;
                    }
                    _chatVM.textController.value.clear();
                    await _sendMessage(type: 'text', text: text);
                    await _chatVM.scrollMessageList();
                  },
                  child: const Expanded(
                    child: SizedBox(
                      height: double.maxFinite,
                      width: 40,
                      child: Icon(
                        Icons.send,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Build bubble message
  Widget _showMessages() {
    return Obx(() => Flexible(
        child: _chatVM.messages.value.isEmpty
            ? const CupertinoActivityIndicator()
            : PagedListView<int, DocumentSnapshot<Map<String, dynamic>>>(
                reverse: true,
                pagingController: _chatVM.pagingController,
                scrollController: _chatVM.messageScrollController.value,
                builderDelegate: PagedChildBuilderDelegate<
                    DocumentSnapshot<Map<String, dynamic>>>(
                  animateTransitions: true,
                  itemBuilder: (context, item, index) {
                    final Map<String, dynamic> msg = item.data()!;
                    print(msg[MESSAGE_TEXT]);

                    bool isUserSender;
                    String userPhotoLink;
                    final bool isImage = msg[MESSAGE_TYPE] == 'image';
                    final String textMessage = msg[MESSAGE_TEXT];
                    final String? imageLink = msg[MESSAGE_IMG_LINK];
                    String timeAgo = '';
                    try {
                      timeAgo =
                          timeago.format(msg[TIMESTAMP].toDate(), locale: 'ko');
                    } catch (e) {}

                    if (msg[USER_ID] == _memberProfileService.getEmail()) {
                      isUserSender = true;
                      userPhotoLink = _memberProfileService.getImageURL();
                    } else {
                      isUserSender = false;
                      userPhotoLink = widget.revMember.imgUrl;
                    }

                    return ChatMessage(
                      isUserSender: isUserSender,
                      isImage: isImage,
                      userPhotoLink: userPhotoLink,
                      textMessage: textMessage,
                      imageLink: imageLink,
                      timeAgo: timeAgo ?? "",
                    );
                  },
                  noItemsFoundIndicatorBuilder: (context) => Container(),
                  firstPageErrorIndicatorBuilder: (context) => Container(),
                ))));
  }

  Future<void> _sendMessage(
      {required String type, String? text, File? imgFile}) async {
    Message message = Message(
        type,
        text,
        imgFile,
        _memberProfileService.getEmail(),
        _memberProfileService.getName() ?? "",
        _memberProfileService.getImageURL(),
        widget.revMember.email,
        '${widget.revMember.firstName} ${widget.revMember.lastName}',
        widget.revMember.imgUrl,
        '');
    final messageService = MessageServiceImpl();
    await messageService.send(context: context, message: message);
  }

  Future<void> _getImage() async {
    await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => ImageSourceSheet(
              onImageSelected: (image) async {
                if (image != null) {
                  await _sendMessage(type: 'image', imgFile: image);
                  // close modal
                  Navigator.of(context).pop();
                }
              },
            ));
  }

  @override
  void dispose() {
    // _messages.drain();
    _chatVM.textController.value.dispose();
    _chatVM.messageScrollController.value.dispose();
    _chatVM.dispose();
    Get.delete<ChatViewModel>();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
