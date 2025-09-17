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

 

  bool isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  int _page = 1;
  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<ListPageModel?> fetchPostList(
    BuildContext context, {
    bool loadMore = false,
  }) async {
    if (_isLoadingMore || !_hasMore) return null;

    if (loadMore) {
      _isLoadingMore = true;
    } else {
      _page = 1;
      _hasMore = true;
      setLoading(true);
    }

    try {
      final response = await apiService.fetchAllList(
        context,
        page: _page,
      );

      if (response != null && response.marketplaceRequests != null) {
        if (loadMore && _listPageModel?.marketplaceRequests != null) {
          _listPageModel?.marketplaceRequests
              ?.addAll(response.marketplaceRequests!);
        } else {
          _listPageModel = response;
        }
        final pagination = response.pagination; 
        if (pagination == null || pagination.count == pagination.totalPages) {
          _hasMore = false;
        } else {
          _page++;
        }
      }

      return _listPageModel;
    } catch (e, trace) {
      debugPrint("Error while fetching post list: $trace");
      return null;
    } finally {
      if (loadMore) {
        _isLoadingMore = false;
      } else {
        setLoading(false);
      }
      notifyListeners();
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
