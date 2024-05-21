import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lift/core/common/widgets/custom_indicator_dialog.dart';
import 'package:lift/domain/hire/model/hire_company.dart';
import 'package:lift/domain/hire/model/hire_detail_company.dart';
import 'package:lift/domain/hire/view/hire_detail_view.dart';
import 'package:lift/domain/hire/view/widget/list_hire_item_widget.dart';
import 'package:lift/domain/hire/view_model/controller/hire_view_model.dart';

class ListHireWidget extends StatelessWidget {
  ListHireWidget({Key? key}) : super(key: key);

  final _hireVM = Get.put(HireViewModel());


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _hireVM.pagingController.refresh(),
      ),
      child: PagedGridView<int, HireCompany>(
        padding: const EdgeInsets.all(10),
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: true,
        pagingController: _hireVM.pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
        ),
        builderDelegate: PagedChildBuilderDelegate<HireCompany>(
          animateTransitions: true,
          itemBuilder: (pageContext, item, index) {
            return GestureDetector(
              child: ListHireItemWidget(hireCompany: item),
              onTap: () async {
                HireDetailCompany detail =  await _hireVM.getHireInfo(id: item.id);
                Get.to(() =>  HireDetailView(hireDetailCompany: detail,));
              },
            );
          },
          noItemsFoundIndicatorBuilder: (context) => _showEmpty(),
          firstPageErrorIndicatorBuilder: (context) => _showEmpty(),
        ),
      ),
    );
  }

  Widget _showEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "채용을 원하는 기업을 찾을 수가 없습니다",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search_outlined, color: Colors.black, size: 24),
                Expanded(
                    child: Text('채용조건 재설정',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
              ],
            ),
          ),
        )
      ],
    );
  }
}
