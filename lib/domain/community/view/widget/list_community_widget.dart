import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lift/domain/community/model/community.dart';
import 'package:lift/domain/community/view/widget/list_community_item_widget.dart';
import 'package:lift/domain/community/viewmodel/community_view_model.dart';

class ListCommunityWidget extends StatelessWidget {
  ListCommunityWidget({Key? key}) : super(key: key);

  final _communityVM = Get.put(CommunityViewModel());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: PagedListView<int, Community>(
            pagingController: _communityVM.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Community>(
              animateTransitions: true,
              itemBuilder: (context, item, index) {
                return ListCommunityItemWidget(community: item);
              },
              noItemsFoundIndicatorBuilder: (context) => Container(),
              firstPageErrorIndicatorBuilder: (context) => Container(),
            )),
        onRefresh: () => Future.sync(
              () => _communityVM.pagingController.refresh(),
            ));
  }
}
