import 'package:flutter/material.dart';
import 'package:market_place_task/base/base_view_model.dart';
import 'package:market_place_task/model/list_page_model.dart';
import 'package:market_place_task/model/single_post_model.dart';

class ListViewModel extends BaseViewModel {
  ListPageModel? _listPageModel;
  ListPageModel? get listPageModel => _listPageModel;
  SinglePostModel? _singlePostModel;
  SinglePostModel? get singlePostModel => _singlePostModel;

  String searchQuery = '';
  int groupCount = 0;
  bool _isSearchLoading = false;
  bool get isSearchLoading => _isSearchLoading;

  void setSearchLoading(bool value) {
    _isSearchLoading = value;
    notifyListeners();
  }

  void setGroupCount(int value) {
    groupCount = value;
    notifyListeners();
  }

  void resetPagination() {
    _listPageModel = null;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    resetPagination();
    notifyListeners();
  }

  Future<ListPageModel?> fetchCategories(BuildContext context) async {
    setLoading(true);
    notifyListeners();
    try {
      _listPageModel = await apiService.fetchAllList(context, page: 1);
      debugPrint(
        "categiry response is ${_listPageModel?.marketplaceRequests?.length}",
      );
      setLoading(false);
      notifyListeners();

      return _listPageModel;
    } catch (e, trace) {
      setLoading(false);
      debugPrint("Error while fetching categories : $trace");
      return null;
    }
  }

  Future<SinglePostModel?> fetchSinglePost(
    BuildContext context,
    String? id,
  ) async {
    setLoading(true);
    notifyListeners();
    try {
      _singlePostModel = await apiService.fetchSingleList(context, id);
      debugPrint(
        "categiry response is ${_singlePostModel?.webMarketplaceRequests?.userDetails?.name}",
      );
      setLoading(false);
      notifyListeners();

      return _singlePostModel;
    } catch (e, trace) {
      setLoading(false);
      debugPrint("Error while fetching categories : $trace");
      return null;
    }
  }
}
