import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lift/core/common/widgets/custom_app_bar.dart';
import 'package:lift/domain/community/model/board_Image_response.dart';
import 'package:lift/domain/community/model/community_detail.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommunityDetailView extends StatefulWidget {
  final CommunityDetail communityDetail;

  const CommunityDetailView({super.key, required this.communityDetail});

  @override
  State<CommunityDetailView> createState() => _CommunityDetailViewState();
}

class _CommunityDetailViewState extends State<CommunityDetailView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeago.setLocaleMessages('ko', timeago.KoMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.communityDetail.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(DateFormat('yyyy-MM-dd  HH:mm:ss').format(DateTime.parse(widget.communityDetail.createdDate)), style: const TextStyle(fontSize: 15, color: Colors.black),),
              ),
              const SizedBox(height: 20,),
              Text(widget.communityDetail.content, style: const TextStyle(fontSize: 16, color: Colors.black),),
               ...widget.communityDetail.images.map((boardImageResponse) {
                 return Padding(padding: EdgeInsets.all(5), child: Image.network(boardImageResponse.imageUrl),);
               }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
