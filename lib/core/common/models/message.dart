
import 'dart:io';

class Message {
  String type;
  String? textMsg;
  File? imgFile;

  String senderMemberID;
  String senderMemberName;
  String senderMemberProfile;

  String receiverMemberID;
  String receiverMemberName;
  String receiverMemberProfile;
  String receiverDeviceToken;

  Message(
      this.type,
      this.textMsg,
      this.imgFile,
      this.senderMemberID,
      this.senderMemberName,
      this.senderMemberProfile,
      this.receiverMemberID,
      this.receiverMemberName,
      this.receiverMemberProfile,
      this.receiverDeviceToken);
}
