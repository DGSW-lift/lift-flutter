import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/common/widgets/custom_app_bar.dart';
import 'package:lift/domain/community/model/community.dart';
import 'package:lift/domain/community/view/widget/list_community_widget.dart';
import 'package:lift/domain/community/viewmodel/community_view_model.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {

  final _communityVM = Get.put(CommunityViewModel());

  @override
  void initState() {
    super.initState();
    _communityVM.setupPagingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        ),
         backgroundColor: Color.fromARGB(0xFF, 0x4F, 0x60, 0xFE),
        onPressed: () {
        print('플로팅 액션 버튼');
      },
        child: Icon(Icons.edit),),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                CustomAppBar(title: '커뮤니티',rightIconButton: IconButton(onPressed: (){}, icon: const Icon(Icons.search)),),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: ListCommunityWidget())
              ],
            ),
            Obx(() => (_communityVM.isLoading.value)
                ? Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            )
                : Container())
          ],
        ),
      ),
    );
  }



  @override
  void dispose() {
    super.dispose();
  }
}