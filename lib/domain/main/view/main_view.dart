import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/domain/community/view/community_view.dart';
import 'package:lift/domain/conversation/view/conversation_view.dart';
import 'package:lift/domain/hire/view/hire_view.dart';
import 'package:lift/domain/main/view_model/controller/main_view_model.dart';
import 'package:lift/core/values/colors.dart' as colors;
import 'package:lift/domain/setting/view/settingScreen.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _mainVM = Get.put(MainViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _mainVM.mainPageController,
          onPageChanged: (index) {
            _mainVM.mainPageIndex.value = index;
          },
          physics: const NeverScrollableScrollPhysics(),
          children: _showCurrentNavBar(),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedItemColor: colors.accentColor,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            elevation: Platform.isIOS ? 0 : 8,
            onTap: (index) {
              _mainVM.mainPageIndex.value = index;
              _mainVM.mainPageController.jumpToPage(index);
            },
            currentIndex: _mainVM.mainPageIndex.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.home_filled),
                  ),
                  label: 'HOME'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.chat),
                  ),
                  label: '채팅'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.mark_unread_chat_alt_outlined),
                  ),
                  label: '커뮤니티'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.settings),
                  ),
                  label: '설정'),
            ],
            backgroundColor: Colors.white,
          ),
        ));
  }

  List<Widget> _showCurrentNavBar() {
    // return options.elementAt(_selectedIndex);
    return <Widget>[
      // const DiscoverTab(),
      const HireView(),
      const ConversationView(),
      const CommunityView(),
      const SettingScreen()
    ];
  }
}
       