
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/domain/community/model/community.dart';
import 'package:lift/domain/community/model/community_detail.dart';
import 'package:lift/domain/community/model/community_response.dart';
import 'package:lift/domain/community/model/search_community_request.dart';
import 'package:lift/domain/community/repository/community_repository.dart';

class CommunityViewModel extends GetxController {

  int  page = 1;
  final _size = 20;

  final isLoading = false.obs;

  final CommunityRepository _api = CommunityRepositoryImpl();

  // RxList<Community> hireList = RxList<Community>();
  final PagingController<int, Community> pagingController =
  PagingController(firstPageKey: 1);

  Future<List<Community>> fetchCommunityList() async {
    isLoading.value = true;
    ApiResponse apiResponse =
    await _api.fetchCommunity(request: SearchCommunityRequest(page, _size));
    CommunityResponse communityResponse = apiResponse.data;
    isLoading.value = false;
    return communityResponse.data;
  }

  Future<void> setupPagingController() async {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      page = pageKey;
      final newItems = await fetchCommunityList();
      if (newItems.length < _size) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(newItems, pageKey + 1);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<CommunityDetail> getCommunityDetail({required int id}) async  {
    ApiResponse apiResponse = await _api.communityDetail(id: id);
    return apiResponse.data;
  }

}
