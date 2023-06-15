import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:great_wall/common/styles/appTheme/app_theme_helper.dart';
import 'package:great_wall/presentation/common/shimmer_container.dart';

class ImageComponent extends StatefulWidget {
  const ImageComponent(
    this.imageUrl, {
    Key? key,
    this.httpHeaders,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.errorWidget,
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.fadeOutCurve = Curves.easeOut,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeInCurve = Curves.easeIn,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.useOldImageOnUrlChange = false,
    this.color,
    this.filterQuality = FilterQuality.low,
    this.colorBlendMode,
    this.placeholderFadeInDuration,
    this.memCacheWidth,
    this.memCacheHeight,
    this.cacheKey,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.blurHash,
    this.autoDownload = true,
    this.heroTag,
  }) : super(key: key);

  final String imageUrl;
  final String? cacheKey;
  final ImageWidgetBuilder? imageBuilder;
  final PlaceholderWidgetBuilder? placeholder;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final Duration? placeholderFadeInDuration;
  final Duration? fadeOutDuration;
  final Curve fadeOutCurve;
  final Duration fadeInDuration;
  final Curve fadeInCurve;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment alignment;
  final ImageRepeat repeat;
  final bool matchTextDirection;
  final Map<String, String>? httpHeaders;
  final bool useOldImageOnUrlChange;
  final Color? color;
  final BlendMode? colorBlendMode;
  final FilterQuality filterQuality;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;
  final bool autoDownload;
  final String? blurHash;
  final String? heroTag;

  @override
  State<ImageComponent> createState() => _ImageComponentState();
}

class _ImageComponentState extends State<ImageComponent> {
  @override
  void initState() {
    super.initState();
  }

  Widget _defaultErrorWidget(BuildContext context, String url, err) =>
      Container(
        color: context.colorScheme.surface,
        alignment: Alignment.center,
      );

  Widget _defaultPlaceholder(context, url) => const ShimmerContainer();

  @override
  Widget build(BuildContext context) => widget.imageUrl.isEmpty
      ? _defaultErrorWidget(context, '', '')
      : CachedNetworkImage(
          imageUrl: widget.imageUrl,
          httpHeaders: widget.httpHeaders,
          imageBuilder: widget.imageBuilder,
          placeholder: widget.placeholder ?? _defaultPlaceholder,
          errorWidget: widget.errorWidget ?? _defaultErrorWidget,
          progressIndicatorBuilder: widget.progressIndicatorBuilder,
          fadeOutDuration: widget.fadeOutDuration,
          fadeOutCurve: widget.fadeOutCurve,
          fadeInDuration: widget.fadeInDuration,
          fadeInCurve: widget.fadeInCurve,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
          alignment: widget.alignment,
          repeat: widget.repeat,
          matchTextDirection: widget.matchTextDirection,
          useOldImageOnUrlChange: widget.useOldImageOnUrlChange,
          color: widget.color,
          filterQuality: widget.filterQuality,
          colorBlendMode: widget.colorBlendMode,
          placeholderFadeInDuration: widget.placeholderFadeInDuration,
          memCacheWidth: widget.memCacheWidth,
          memCacheHeight: widget.memCacheHeight,
          cacheKey: widget.cacheKey,
          maxWidthDiskCache: widget.maxWidthDiskCache,
          maxHeightDiskCache: widget.maxHeightDiskCache,
        );
}
