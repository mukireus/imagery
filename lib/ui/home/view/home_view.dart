import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/base/base_view.dart';
import '../../components/image_tile_widget.dart';
import '../../components/loading_indicator.dart';
import '../../components/sliver_app_bar.dart';
import '../model/unplash_image.dart';
import '../viewmodel/home_view_model.dart';

part 'home_images_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        model.init();
        model.setContext(context);
        viewModel = model;
      },
      builder: (context, value) => Scaffold(body: buildBody),
      model: HomeViewModel(),
    );
  }

  CustomScrollView get buildBody {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        buildSliverAppBar,
        buildImageGrid,
      ],
    );
  }

  Widget get buildSliverAppBar {
    return SliverSearchBar(
      title: buildTitleSearch,
      resetImages: viewModel.resetImages,
    );
  }

  Widget get buildTitleSearch {
    return TextField(
      keyboardType: TextInputType.text,
      controller: viewModel.searchController,
      decoration: InputDecoration(hintText: 'Ara...', border: InputBorder.none),
      onSubmitted: (String keyword) => viewModel.loadImages(keyword),
    );
  }
}
