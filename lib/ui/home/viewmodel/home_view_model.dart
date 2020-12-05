import 'package:flutter/material.dart';
import 'package:imagery/ui/home/model/unplash_image.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/base_view_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  TextEditingController searchController;

  @observable
  List<UnsplashImage> images = [];

  @observable
  bool loadingImages = false;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  init() {
    searchController = TextEditingController();
  }
}
