import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../home/model/unplash_image.dart';

class ImageTileWidget extends StatelessWidget {
  final UnsplashImage image;

  const ImageTileWidget({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: buildCachedNetworkImage(context),
      );
    } else {
      return buildImagePlaceHolder;
    }
  }

  Widget buildCachedNetworkImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "image.smallUrl",
      placeholder: (context, url) => buildImagePlaceHolder,
      errorWidget: (context, url, obj) => buildImageErrorWidget,
      fit: BoxFit.fitHeight,
    );
  }

  Widget get buildImagePlaceHolder => Container(color: Colors.grey[200]);

  Widget get buildImageErrorWidget {
    return Container(
      color: Colors.grey[200],
      child: Center(child: Icon(Icons.broken_image, color: Colors.grey[400])),
    );
  }
}
