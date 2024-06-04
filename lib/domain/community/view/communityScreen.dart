import 'package:flutter/material.dart';
import 'package:lift/domain/community/model/community_model.dart';
import 'package:lift/domain/community/viewmodel/fetch_items.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  List<CommunityModel> items = [];
  bool isLoading = false;
  int currentPage = 0;
  final int itemsPerPage = 10;
  final ScrollController _scrollController = ScrollController();
  bool allLoaded = false;

  @override
  void initState() {
    super.initState();
    _fetchItems();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchItems();
      }
    });
  }

  Future<void> _fetchItems() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    try {
      List<CommunityModel> fetchedItems = await fetchItems(page: currentPage, limit: itemsPerPage);
      setState(() {
        items.addAll(fetchedItems.where((newItem) => items.every((existingItem) => existingItem.id != newItem.id)));
        currentPage++;
      });
    } catch (error) {
      // 에러 처리
      print('Error: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: items.length + (isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == items.length) {
                return Center(child: CircularProgressIndicator());
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('질문', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: Color(0xffCF3C3C))),
                  SizedBox(width: 10),
                  Text(items[index].title),
                  SizedBox(height: 40),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}