import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:lift/core/values/colors.dart' as colors;
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';
import 'package:textfield_tags/src/controller.dart';

class ListInterestTagWidget extends StatelessWidget {
  ListInterestTagWidget({Key? key}) : super(key: key);
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  final loginVM = Get.put(SignupViewModel());
  double _fontSize = 14;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Obx(() => Tags(
            key: _tagStateKey,
            spacing: 18,
            alignment: WrapAlignment.start,
            itemCount: loginVM.tagList.length,

            itemBuilder: (int index) {
              final item = loginVM.tagList[index];
              return ItemTags(
                key: Key(index.toString()),
                index: index,
                padding: const EdgeInsets.fromLTRB(14, 5, 14, 5),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: const Color.fromRGBO(245, 245, 245, 1), width: 0),
                color: const Color.fromRGBO(245, 245, 245, 1),
                colorShowDuplicate: Colors.transparent,
                activeColor: colors.accentColor,
                title: "#"+item.title,
                active: item.active,
                textStyle: TextStyle(
                  fontSize: _fontSize,
                ),
                combine: ItemTagsCombine.withTextBefore,
                // OR null,
                onPressed: (item) {
                  if(item.active ?? false){
                    if(item.title!.isNotEmpty) {
                      loginVM.interestTagController.value.onTagSubmitted(item.title!.replaceFirst("#", ""));
                    }
                  } else {
                    loginVM.interestTagController.value.onTagRemoved(item.title!.replaceFirst("#", ""));
                  }
                  loginVM.interestTagController.value.notifyListeners();
                },
                onLongPressed: (item) => print(item),
              );
            },
          )),
    );
  }
}
