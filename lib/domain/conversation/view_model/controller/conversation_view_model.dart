import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lift/core/common/widgets/custom_indicator_dialog.dart';
import 'package:lift/core/values/constants.dart';

class ConversationViewModel extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  final Rxn<QuerySnapshot<Map<String, dynamic>>> messages = Rxn<QuerySnapshot<Map<String, dynamic>>>();

  void _messagesStream({required BuildContext context, required String email}) {
    final _pr = CustomIndicatorDialog(context, isDismissible: false);
    _pr.show();
    _firestore
        .collection(CONNECTIONS)
        .doc(email)
        .collection(CONVERSATIONS)
        .orderBy(TIMESTAMP, descending: true)
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
      messages.value = snapshot.docs as QuerySnapshot<Map<String, dynamic>>;
      _pr.hide();
    });
  }
}
