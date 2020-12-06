part of './home_view.dart';

extension HomeImagesView on _HomeViewState {
  Widget get buildImageGrid {
    return SliverPadding(
      padding: EdgeInsets.all(15),
      sliver: Observer(builder: (_) {
        if (viewModel.loadingImages) {
          return buildSliverToBoxAdapterIndicator;
        } else {
          return buildSliverStaggeredGridBody;
        }
      }),
    );
  }

  SliverToBoxAdapter get buildSliverToBoxAdapterIndicator => SliverToBoxAdapter(child: LoadingIndicator());

  SliverStaggeredGrid get buildSliverStaggeredGridBody {
    return SliverStaggeredGrid.countBuilder(
      crossAxisCount: 2,
      itemCount: viewModel.images.length,
      itemBuilder: (BuildContext context, int index) => buildImageItem(index),
      staggeredTileBuilder: (int index) => buildStaggeredTile(viewModel.images[index]),
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
    );
  }

  StaggeredTile buildStaggeredTile(UnsplashImage image) {
    double aspectRatio = image.height.toDouble() / image.width.toDouble();
    double columnWidth = MediaQuery.of(context).size.width / 2;
    return StaggeredTile.extent(1, aspectRatio * columnWidth);
  }

  Widget buildImageItem(int index) {
    return FutureBuilder(
      future: viewModel.loadImage(index),
      builder: (context, snapshot) => ImageTileWidget(image: snapshot.data),
    );
  }
}
