import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:media_store/media_store.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';

import '../../core/network/api.dart';
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
      return buildImage(context);
    } else {
      return buildImagePlaceHolder;
    }
  }

  Widget buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: buildCachedNetworkImage(context),
    );
  }

  Widget buildCachedNetworkImage(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (_) => Builder(
          builder: (context) => GestureDetector(
            onTap: () async {
              await downloadImage(context, image.downloadUrl).then((result) {
                Toast.show(result ? 'İndirme işlemi başarılı' : 'Yazma izni alınamadı', context);
              });
              Navigator.of(context).pop();
            },
            child: CachedNetworkImage(
              progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              width: image.width,
              height: image.height,
              imageUrl: image.fullUrl,
            ),
          ),
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: image.smallUrl,
        placeholder: (context, url) => buildImagePlaceHolder,
        errorWidget: (context, url, obj) => buildImageErrorWidget,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget get buildImagePlaceHolder => Container(color: Colors.grey[200]);

  Widget get buildImageErrorWidget {
    return Container(
      color: Colors.grey[200],
      child: Center(child: Icon(Icons.broken_image, color: Colors.grey[400])),
    );
  }

  Widget buildProgressIndicatorBuilder(downloadProgress) {
    return Center(child: CircularProgressIndicator(value: downloadProgress.progress));
  }

  Future<bool> downloadImage(context, String imgUrl) async {
    PermissionStatus storagePerm = await Permission.storage.request();
    if (storagePerm.isGranted) {
      Toast.show('İndirme işlemi başlatıldı...', context);

      final downloadLink = await API.getDownloadLink(imgUrl);
      final response = await http.get(downloadLink);
      Toast.show('İndirme işlemi bitmek üzere...', context);
      final result = await MediaStore.saveImage(Uint8List.fromList(response.bodyBytes));
      print(result);
      return true;
    } else {
      return false;
    }
  }
}
