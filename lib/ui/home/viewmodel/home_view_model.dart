import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/base_view_model.dart';
import '../../../core/network/api.dart';
import '../../../core/network/unsplash_response.dart';
import '../model/unplash_image.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  TextEditingController searchController;

  @observable
  String keyword = "";

  @observable
  List<UnsplashImage> images = [];

  @observable
  bool loadingImages = false;

  @computed
  bool get isEmptyKeyword => (keyword.isEmpty || keyword == "") ? true : false;

  int page = 1;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  init() {
    loadImages();
    searchController = TextEditingController();
  }

  @action
  Future<UnsplashImage> loadImage(int index) async {
    if (index >= images.length - 2) {
      loadImages(keyword);
    }
    return index < images.length ? images[index] : null;
  }

  @action
  Future<void> loadImages([String keyword]) async {
    if (loadingImages) {
      return;
    }
    await Future.delayed(Duration(microseconds: 1));
    loadingImages = true;
    if (this.keyword != keyword) {
      this.images = [];
      this.keyword = keyword;
      page = 1;
    }

    List<UnsplashImage> images = [];
    if (keyword == null) {
      List<UnsplashResponse> list = await API.getRandomImages();
      for (var item in list) {
        images.add(UnsplashImage(
            id: item.id,
            width: item.width.toDouble(),
            height: item.height.toDouble(),
            smallUrl: item.urls.small,
            fullUrl: item.urls.full,
            downloadUrl: item.links.downloadLocation));
      }
    } else {
      List<UnsplashResponse> list = await API.searchImages(keyword, page: ++page);
      for (var item in list) {
        images.add(UnsplashImage(
            id: item.id,
            width: item.width.toDouble(),
            height: item.height.toDouble(),
            smallUrl: item.urls.small,
            fullUrl: item.urls.full,
            downloadUrl: item.links.downloadLocation));
      }
    }

    loadingImages = false;
    this.images.addAll(images);
  }

  @action
  void resetImages() {
    searchController.clear();
    images = [];
  }
}
