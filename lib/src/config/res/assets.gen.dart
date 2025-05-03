/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:lottie/lottie.dart' as _lottie;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/api_error.json
  LottieGenImage get apiError =>
      const LottieGenImage('assets/lottie/api_error.json');

  /// File path: assets/lottie/done.json
  LottieGenImage get done => const LottieGenImage('assets/lottie/done.json');

  /// File path: assets/lottie/empty_box.json
  LottieGenImage get emptyBox =>
      const LottieGenImage('assets/lottie/empty_box.json');

  /// File path: assets/lottie/empty_cart.json
  LottieGenImage get emptyCart =>
      const LottieGenImage('assets/lottie/empty_cart.json');

  /// File path: assets/lottie/error.json
  LottieGenImage get error => const LottieGenImage('assets/lottie/error.json');

  /// File path: assets/lottie/logout.json
  LottieGenImage get logout =>
      const LottieGenImage('assets/lottie/logout.json');

  /// File path: assets/lottie/manazel_logo.json
  LottieGenImage get manazelLogo =>
      const LottieGenImage('assets/lottie/manazel_logo.json');

  /// File path: assets/lottie/no_data.json
  LottieGenImage get noData =>
      const LottieGenImage('assets/lottie/no_data.json');

  /// File path: assets/lottie/no_internet.json
  LottieGenImage get noInternet =>
      const LottieGenImage('assets/lottie/no_internet.json');

  /// File path: assets/lottie/success.json
  LottieGenImage get success =>
      const LottieGenImage('assets/lottie/success.json');

  /// File path: assets/lottie/successfull_order.json
  LottieGenImage get successfullOrder =>
      const LottieGenImage('assets/lottie/successfull_order.json');

  /// List of all assets
  List<LottieGenImage> get values => [
    apiError,
    done,
    emptyBox,
    emptyCart,
    error,
    logout,
    manazelLogo,
    noData,
    noInternet,
    success,
    successfullOrder,
  ];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/manazel_primary_logo_name.png
  AssetGenImage get manazelPrimaryLogoName =>
      const AssetGenImage('assets/png/manazel_primary_logo_name.png');

  /// File path: assets/png/manazel_white_logo.png
  AssetGenImage get manazelWhiteLogo =>
      const AssetGenImage('assets/png/manazel_white_logo.png');

  /// File path: assets/png/manazel_white_logo_name.png
  AssetGenImage get manazelWhiteLogoName =>
      const AssetGenImage('assets/png/manazel_white_logo_name.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    manazelPrimaryLogoName,
    manazelWhiteLogo,
    manazelWhiteLogoName,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/america_flag.svg
  SvgGenImage get americaFlag =>
      const SvgGenImage('assets/svg/america_flag.svg');

  /// File path: assets/svg/british_flag.svg
  SvgGenImage get britishFlag =>
      const SvgGenImage('assets/svg/british_flag.svg');

  /// File path: assets/svg/camera.svg
  SvgGenImage get camera => const SvgGenImage('assets/svg/camera.svg');

  /// File path: assets/svg/location_pin.svg
  SvgGenImage get locationPin =>
      const SvgGenImage('assets/svg/location_pin.svg');

  /// File path: assets/svg/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/svg/logo.svg');

  /// File path: assets/svg/saudi_cricular_flag.svg
  SvgGenImage get saudiCricularFlag =>
      const SvgGenImage('assets/svg/saudi_cricular_flag.svg');

  /// File path: assets/svg/saudi_square_flag.svg
  SvgGenImage get saudiSquareFlag =>
      const SvgGenImage('assets/svg/saudi_square_flag.svg');

  /// File path: assets/svg/upload-image.svg
  SvgGenImage get uploadImage =>
      const SvgGenImage('assets/svg/upload-image.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    americaFlag,
    britishFlag,
    camera,
    locationPin,
    logo,
    saudiCricularFlag,
    saudiSquareFlag,
    uploadImage,
  ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar.json
  String get ar => 'assets/translations/ar.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/lang.json
  String get lang => 'assets/translations/lang.json';

  /// List of all assets
  List<String> get values => [ar, en, lang];
}

class AppAssets {
  const AppAssets._();

  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName, {this.flavors = const {}});

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, _lottie.LottieComposition?)?
    frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
    _lottie.LottieDecoder? decoder,
    _lottie.RenderCache? renderCache,
    bool? backgroundLoading,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
      decoder: decoder,
      renderCache: renderCache,
      backgroundLoading: backgroundLoading,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
