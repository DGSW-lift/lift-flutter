import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/common/widgets/custom_indicator_dialog.dart';
import 'package:lift/core/values/constants.dart';
import 'package:lift/domain/member/model/member_model.dart';
import 'package:lift/domain/member/repository/member_repository.dart';

class ConversationViewModel extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final _memberRepository = MemberRepositoryImpl();

  RxList<DocumentSnapshot<Map<String, dynamic>>> listMessage = RxList();

  void messagesListener(
      {required String email}) async {
    _firestore
        .collection(CONNECTIONS)
        .doc(email)
        .collection(CONVERSATIONS)
        .orderBy(TIMESTAMP, descending: true)
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> snapshot) async {
      listMessage.value = snapshot.docs.toList();
    });
  }

  Future<MemberModel?> getMemberProfileByEmail({required String email}) async {
    ApiResponse apiResponse = await _memberRepository.profileByEmail(email: email);
    return (apiResponse.statusCode == HttpStatus.ok) ? apiResponse.data : null;
  }
}
