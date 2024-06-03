import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lift/core/common/repository/message_repository.dart';
import 'package:lift/core/common/repository/upload_repository.dart';
import 'package:lift/core/common/service/member_profile_service.dart';

class ChatViewModel extends GetxController {
  final textController = TextEditingController().obs;
  final messageScrollController = ScrollController().obs;
  final PagingController<int, DocumentSnapshot<Map<String, dynamic>>>
      pagingController = PagingController(firstPageKey: 1);

  RxList<DocumentSnapshot<Map<String, dynamic>>> messages = RxList();
  final _messageRepository = MessageRepositoryImpl();
  final _uploadRepository = UploadRepositoryImpl();

  late String _userId = '';

  final _limit = 20;

  Future<void> setup({required String withUserId}) async {
    _userId = withUserId;
    messagesListener();
    pagingController.addPageRequestListener((pageKey) {
      _fetchMessages(pageKey);
    });
  }

  Future<void> _fetchMessages(int pageKey) async {
    try {
      List<DocumentSnapshot<Map<String, dynamic>>> newItems =
          await getMoreMessages(_userId);
      final isLastPage = newItems.length < _limit;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<void> scrollMessageList() async {
    if (messageScrollController.value.hasClients) {
      messageScrollController.value.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  Future<void> messagesListener() async {
    getMessages(withUserId:  _userId)
        .listen((QuerySnapshot<Map<String, dynamic>> messageDoc) {
      if (messageDoc.docs.isEmpty) return;
      messages.value = messageDoc.docs.toList();
      pagingController.nextPageKey = 1;
      pagingController.itemList = messages.value;
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
      {required String withUserId}) {
    return _messageRepository.getMessages(withUserId, _limit);
  }

  @override
  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getMoreMessages(
      String withUserId) async {
    return _messageRepository.getMoreMessages(withUserId, _limit);
  }
}
