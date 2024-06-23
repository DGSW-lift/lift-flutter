import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lift/domain/community/model/community.dart';
import 'package:lift/domain/community/model/community_detail.dart';
import 'package:lift/domain/community/view/community_detail_view.dart';
import 'package:lift/domain/community/viewmodel/community_view_model.dart';

class ListCommunityItemWidget extends StatelessWidget {

  final _communityVM = Get.put(CommunityViewModel());

  Community community;

  ListCommunityItemWidget({Key? key, required this.community})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () async {
          CommunityDetail communityDetail = await _communityVM.getCommunityDetail(id: community.id);
          Get.to(() => CommunityDetailView(
            communityDetail: communityDetail,
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              community.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                DateFormat('yyyy-MM-dd  HH:mm:ss').format(DateTime.parse(community.createdDate)),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(
              color: Color.fromRGBO(225, 225, 225, 1),
            )
          ],
        ),
      ),
    );
  }
}
