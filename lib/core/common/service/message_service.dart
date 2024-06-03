import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/common/models/message.dart';
import 'package:lift/core/common/models/upload_response.dart';
import 'package:lift/core/common/repository/message_repository.dart';
import 'package:lift/core/common/repository/upload_repository.dart';
import 'package:lift/core/common/widgets/progress_dialog.dart';

abstract class MessageService {
  Future<bool> send({required BuildContext context, required Message message});
}

class MessageServiceImpl implements MessageService {
  final _messageRepository = MessageRepositoryImpl();
  final _uploadRepository = UploadRepositoryImpl();

  @override
  Future<bool> send(
      {required BuildContext context, required Message message}) async {
    final ProgressDialog pr = ProgressDialog(context);
    String textMsg = '';
    String imageUrl = '';

    switch (message.type) {
      case 'text':
        textMsg = message.textMsg!;
        break;
      case 'image':
        await pr.show('업로드....');
        ApiResponse apiResponse =
            await _uploadRepository.upload(file: message.imgFile!);
        UploadResponse uploadResponse = apiResponse.data;
        if (apiResponse.data != null) {
          imageUrl = uploadResponse.path;
        }
        await pr.hide();
        break;
    }

    await _messageRepository.saveMessage(
        type: message.type,
        fromUserId: message.senderMemberID,
        senderId: message.senderMemberID,
        receiverId: message.receiverMemberID,
        userPhotoLink: message.receiverMemberProfile,
        userFullName: message.receiverMemberName,
        textMsg: textMsg,
        imgLink: imageUrl,
        badge: 0,
        isRead: true);

    await _messageRepository.saveMessage(
        type: message.type,
        fromUserId: message.senderMemberID,
        senderId: message.receiverMemberID,
        receiverId: message.senderMemberID,
        userPhotoLink: message.senderMemberProfile,
        // current user photo
        userFullName: message.senderMemberName,
        // current user ful name
        textMsg: textMsg,
        imgLink: imageUrl,
        badge: 0,
        isRead: false);

    // push 작업

    return true;
  }
}
