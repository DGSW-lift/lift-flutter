import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/common/widgets/custom_app_bar.dart';
import 'package:lift/domain/hire/view/widget/list_hire_widget.dart';
import 'package:lift/domain/hire/view/widget/search_condition_status_widget.dart';
import 'package:lift/domain/hire/view_model/controller/hire_view_model.dart';

class HireView extends StatefulWidget {
  const HireView({Key? key}) : super(key: key);

  @override
  _HireViewState createState() => _HireViewState();
}

class _HireViewState extends State<HireView> {
  final _hireVM = Get.put(HireViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hireVM.setupPagingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              CustomAppBar(title: 'LIFT',rightIconButton: IconButton(onPressed: (){}, icon: const Icon(Icons.search)),),
              const SizedBox(
                height: 10,
              ),
              SearchConditionStatusWidget(),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: ListHireWidget())
            ],
          ),
          Obx(() => (_hireVM.isLoading.value)
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                )
              : Container())
        ],
      ),
    );
  }
}
