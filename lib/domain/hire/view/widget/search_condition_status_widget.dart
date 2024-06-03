import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/domain/hire/view_model/controller/hire_view_model.dart';

class SearchConditionStatusWidget extends StatelessWidget {
  SearchConditionStatusWidget({Key? key}) : super(key: key);

  final _recruitView = Get.put(HireViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  minimumSize: const Size(100, 35),
                ),
                child: Text(
                  _recruitView.getSelectedRegion(),
                  style: const TextStyle(color: Colors.black, fontSize: 13),
                )),
            const SizedBox(width: 10,),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  minimumSize: const Size(100, 35),
                ),
                child: Text(
                  _recruitView.getSelectedCareer(),
                  style: const TextStyle(color: Colors.black, fontSize: 13),
                )),
            const SizedBox(width: 10,),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  minimumSize: const Size(100, 35),
                ),
                child: Text(
                  _recruitView.getSelectedStack(),
                  style: const TextStyle(color: Colors.black, fontSize: 13),
                ))
          ],
        ),
      ),
    );
  }
}
