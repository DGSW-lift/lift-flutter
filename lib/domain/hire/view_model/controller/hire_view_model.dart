import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/domain/hire/model/hire_company.dart';
import 'package:lift/domain/hire/model/hire_company_response.dart';
import 'package:lift/domain/hire/model/hire_detail_company.dart';
import 'package:lift/domain/hire/model/search_hire_request.dart';
import 'package:lift/domain/hire/repository/hire_repository.dart';
import 'package:lift/domain/member/model/member_model.dart';
import 'package:lift/domain/member/repository/member_repository.dart';

class HireViewModel extends GetxController {

  final HireRepository _api = HireRepositoryImpl();
  final MemberRepository _apiMember = MemberRepositoryImpl();

  final messageController = TextEditingController().obs;

  int  page = 1;
  final _size = 20;
  final region = "".obs;
  final career = "".obs;
  final stack = "".obs;
  final isLoading = false.obs;

  RxList<HireCompany> hireList = RxList<HireCompany>();

  final PagingController<int, HireCompany> pagingController =
      PagingController(firstPageKey: 1);

  Future<void> setupPagingController() async {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<List<HireCompany>> fetchHireList() async {
    ApiResponse apiResponse =
        await _api.fetchHires(request: SearchHireRequest(page, _size));
    HireCompanyResponse hireCompanyResponse = apiResponse.data;
    return hireCompanyResponse.data;
  }

  Future<HireDetailCompany> getHireInfo({required int id}) async{
    isLoading.value = true;
    ApiResponse apiResponse =
    await _api.getHireInfo(id: id);
    isLoading.value = false;
    return apiResponse.data;
  }

  Future<MemberModel> getProfile({required int id}) async  {
    ApiResponse apiResponse = await _apiMember.profile(id: id);
    return apiResponse.data;
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      page = pageKey;
      final newItems = await fetchHireList();
      if (newItems.length < _size) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(newItems, pageKey + 1);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  String getSelectedRegion() {
    return (region.value.isEmpty) ? "지역" : "지역 : ${region.value.trim()}";
  }

  String getSelectedCareer() {
    return (career.value.isEmpty) ? "경력" : "경력 : ${career.value.trim()}";
  }

  String getSelectedStack() {
    return (stack.value.isEmpty) ? "스택" : "스택 : ${stack.value.trim()}";
  }
}
