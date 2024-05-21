import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lift/core/values/constants.dart';

abstract class MessageRepository {
  Future<void> saveMessage(
      {required String type,
      required String senderId,
      required String receiverId,
      required String fromUserId,
      required String userPhotoLink,
      required String userFullName,
      required String textMsg,
      required String imgLink,
      required int badge,
      required bool isRead});

  Future<DocumentSnapshot<Map<String, dynamic>>> getConversations(
      String senderId, String receiverId);

  Future<void> saveConversation({
    required String type,
    required String senderId,
    required String receiverId,
    required String userPhotoLink,
    required String userFullName,
    required String textMsg,
    required int badge,
    required bool isRead,
  });
}

class MessageRepositoryImpl implements MessageRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<void> saveMessage(
      {required String type,
      required String senderId,
      required String receiverId,
      required String fromUserId,
      required String userPhotoLink,
      required String userFullName,
      required String textMsg,
      required String imgLink,
      required int badge,
      required bool isRead}) async {
    await _firestore
        .collection(MESSAGES)
        .doc(senderId)
        .collection(receiverId)
        .doc()
        .set(<String, dynamic>{
      USER_ID: fromUserId,
      MESSAGE_TYPE: type,
      MESSAGE_TEXT: textMsg,
      MESSAGE_IMG_LINK: imgLink,
      MESSAGE_BADGE: 0,
      TIMESTAMP: FieldValue.serverTimestamp(),
    });

    if(isRead == false){
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await getConversations(senderId, receiverId);
      if(documentSnapshot != null && documentSnapshot.exists){
        int badgeCnt = documentSnapshot.get(MESSAGE_BADGE);
        badge  = badgeCnt +1;
      }
    }

    await  saveConversation(
        type: type,
        senderId: senderId,
        receiverId: receiverId,
        userPhotoLink: userPhotoLink,
        userFullName: userFullName,
        textMsg: textMsg,
        badge:  badge,
        isRead: isRead);

  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getConversations(String senderId, String receiverId) async {
    return _firestore
        .collection(CONNECTIONS)
        .doc(senderId)
        .collection(CONVERSATIONS)
        .doc(receiverId)
        .get();
  }

  @override
  Future<void> saveConversation({required String type, required String senderId, required String receiverId, required String userPhotoLink, required String userFullName, required String textMsg, required int badge, required bool isRead}) async {
    await _firestore
        .collection(CONNECTIONS)
        .doc(senderId)
        .collection(CONVERSATIONS)
        .doc(receiverId)
        .set(<String, dynamic>{
      USER_ID: receiverId,
      USER_PROFILE_PHOTO: userPhotoLink,
      USER_FULLNAME: userFullName,
      MESSAGE_TYPE: type,
      LAST_MESSAGE: textMsg,
      MESSAGE_BADGE : badge,
      MESSAGE_READ: isRead,
      TIMESTAMP: FieldValue.serverTimestamp(),
    }).then((value) {
    }).catchError((e) {
    });
  }
}
