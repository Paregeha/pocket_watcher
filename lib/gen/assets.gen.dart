// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/big_logo.png
  AssetGenImage get bigLogo =>
      const AssetGenImage('assets/images/big_logo.png');

  /// File path: assets/images/logo_image.png
  AssetGenImage get logoImage =>
      const AssetGenImage('assets/images/logo_image.png');

  /// File path: assets/images/medium_logo.png
  AssetGenImage get mediumLogo =>
      const AssetGenImage('assets/images/medium_logo.png');

  /// File path: assets/images/on_boarding_1.png
  AssetGenImage get onBoarding1 =>
      const AssetGenImage('assets/images/on_boarding_1.png');

  /// File path: assets/images/on_boarding_2.png
  AssetGenImage get onBoarding2 =>
      const AssetGenImage('assets/images/on_boarding_2.png');

  /// File path: assets/images/on_boarding_3.png
  AssetGenImage get onBoarding3 =>
      const AssetGenImage('assets/images/on_boarding_3.png');

  /// File path: assets/images/on_boarding_4.png
  AssetGenImage get onBoarding4 =>
      const AssetGenImage('assets/images/on_boarding_4.png');

  /// File path: assets/images/small_logo.png
  AssetGenImage get smallLogo =>
      const AssetGenImage('assets/images/small_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    bigLogo,
    logoImage,
    mediumLogo,
    onBoarding1,
    onBoarding2,
    onBoarding3,
    onBoarding4,
    smallLogo,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
