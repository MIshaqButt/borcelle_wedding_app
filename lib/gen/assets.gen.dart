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
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/BalooDa2-Bold.ttf
  String get balooDa2Bold => 'assets/fonts/BalooDa2-Bold.ttf';

  /// File path: assets/fonts/BalooDa2-ExtraBold.ttf
  String get balooDa2ExtraBold => 'assets/fonts/BalooDa2-ExtraBold.ttf';

  /// File path: assets/fonts/BalooDa2-Medium.ttf
  String get balooDa2Medium => 'assets/fonts/BalooDa2-Medium.ttf';

  /// File path: assets/fonts/BalooDa2-Regular.ttf
  String get balooDa2Regular => 'assets/fonts/BalooDa2-Regular.ttf';

  /// File path: assets/fonts/BalooDa2-SemiBold.ttf
  String get balooDa2SemiBold => 'assets/fonts/BalooDa2-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
    balooDa2Bold,
    balooDa2ExtraBold,
    balooDa2Medium,
    balooDa2Regular,
    balooDa2SemiBold,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add.svg
  SvgGenImage get add => const SvgGenImage('assets/icons/add.svg');

  /// File path: assets/icons/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/icons/apple.svg');

  /// File path: assets/icons/comment.svg
  SvgGenImage get comment => const SvgGenImage('assets/icons/comment.svg');

  /// File path: assets/icons/down_arrow.svg
  SvgGenImage get downArrow => const SvgGenImage('assets/icons/down_arrow.svg');

  /// File path: assets/icons/file.svg
  SvgGenImage get file => const SvgGenImage('assets/icons/file.svg');

  /// File path: assets/icons/forward_arrow.svg
  SvgGenImage get forwardArrow =>
      const SvgGenImage('assets/icons/forward_arrow.svg');

  /// File path: assets/icons/friends.svg
  SvgGenImage get friends => const SvgGenImage('assets/icons/friends.svg');

  /// File path: assets/icons/google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/google.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/like.svg
  SvgGenImage get like => const SvgGenImage('assets/icons/like.svg');

  /// File path: assets/icons/like_comment_bar.svg
  SvgGenImage get likeCommentBar =>
      const SvgGenImage('assets/icons/like_comment_bar.svg');

  /// File path: assets/icons/message.svg
  SvgGenImage get message => const SvgGenImage('assets/icons/message.svg');

  /// File path: assets/icons/mic.svg
  SvgGenImage get mic => const SvgGenImage('assets/icons/mic.svg');

  /// File path: assets/icons/mic_profile.svg
  SvgGenImage get micProfile =>
      const SvgGenImage('assets/icons/mic_profile.svg');

  /// File path: assets/icons/more.svg
  SvgGenImage get more => const SvgGenImage('assets/icons/more.svg');

  /// File path: assets/icons/navigation.svg
  SvgGenImage get navigation =>
      const SvgGenImage('assets/icons/navigation.svg');

  /// File path: assets/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icons/notification.svg');

  /// File path: assets/icons/upload.svg
  SvgGenImage get upload => const SvgGenImage('assets/icons/upload.svg');

  /// File path: assets/icons/verification.svg
  SvgGenImage get verification =>
      const SvgGenImage('assets/icons/verification.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    add,
    apple,
    comment,
    downArrow,
    file,
    forwardArrow,
    friends,
    google,
    home,
    like,
    likeCommentBar,
    message,
    mic,
    micProfile,
    more,
    navigation,
    notification,
    upload,
    verification,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/hands_background.jpg
  AssetGenImage get handsBackground =>
      const AssetGenImage('assets/images/hands_background.jpg');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/onboarding_first.png
  AssetGenImage get onboardingFirst =>
      const AssetGenImage('assets/images/onboarding_first.png');

  /// File path: assets/images/onboarding_second.png
  AssetGenImage get onboardingSecond =>
      const AssetGenImage('assets/images/onboarding_second.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    handsBackground,
    logo,
    onboardingFirst,
    onboardingSecond,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
