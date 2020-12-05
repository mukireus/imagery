import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/base/base_view.dart';
import '../../components/image_tile_widget.dart';
import '../model/unplash_image.dart';
import '../viewmodel/home_view_model.dart';

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
      builder: (context, value) => buildScaffold,
      model: HomeViewModel(),
    );
  }

  Scaffold get buildScaffold {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          buildSliverAppBar,
          buildImageGrid,
        ],
      ),
    );
  }

  SliverAppBar get buildSliverAppBar {
    return SliverAppBar(
      title: buildTitleSearch,
      backgroundColor: Colors.white,
      actions: [buildIconButtonReset],
    );
  }

  Widget get buildTitleSearch {
    return TextField(
      keyboardType: TextInputType.text,
      controller: viewModel.searchController,
      decoration: InputDecoration(hintText: 'Ara...', border: InputBorder.none),
      onSubmitted: (String keyword) => null,
      // TODO onSubmitted
    );
  }

  Widget get buildIconButtonReset {
    return IconButton(
      icon: Icon(Icons.close), color: Colors.black87, onPressed: () => null,
      // TODO onSubmitted
    );
  }

  Widget get buildImageGrid {
    return SliverPadding(
      padding: EdgeInsets.all(15),
      sliver: Observer(builder: (_) {
        return
            // ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
            SliverStaggeredGrid.countBuilder(
          crossAxisCount: 2,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => buildImageItem(index),
          staggeredTileBuilder: (int index) => buildStaggeredTile(viewModel.images[index]),
          mainAxisSpacing: 10,
          crossAxisSpacing: 5,
        );
      }),
    );
  }

  StaggeredTile buildStaggeredTile(UnsplashImage image) {
    // double aspectRatio = image.height.toDouble() / image.width.toDouble();
    double columnWidth = MediaQuery.of(context).size.width / 2;
    // return StaggeredTile.extent(1, aspectRatio * columnWidth);
    return StaggeredTile.extent(1, 2 * columnWidth);
  }

  Widget buildImageItem(int index) {
    return FutureBuilder(
      // future: viewModel.loadImage(index),
      builder: (context, snapshot) => ImageTileWidget(image: snapshot.data),
    );
  }
}
