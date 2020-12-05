// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$imagesAtom = Atom(name: '_HomeViewModelBase.images');

  @override
  List<UnsplashImage> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(List<UnsplashImage> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$loadingImagesAtom = Atom(name: '_HomeViewModelBase.loadingImages');

  @override
  bool get loadingImages {
    _$loadingImagesAtom.reportRead();
    return super.loadingImages;
  }

  @override
  set loadingImages(bool value) {
    _$loadingImagesAtom.reportWrite(value, super.loadingImages, () {
      super.loadingImages = value;
    });
  }

  @override
  String toString() {
    return '''
images: ${images},
loadingImages: ${loadingImages}
    ''';
  }
}
