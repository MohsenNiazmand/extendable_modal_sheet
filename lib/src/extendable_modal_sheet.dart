import 'dart:ui';
import 'package:flutter/material.dart';

class ExtendableModalSheet extends StatefulWidget {
  const ExtendableModalSheet({
    required this.mainWidget,
    super.key,
    this.bottomWidget,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 1.0,
    this.turningRadiusPoint = 80,
    this.radiusChangeAnimationDuration = const Duration(milliseconds: 350),
    this.backgroundColor = Colors.white,
    this.cornersRadius = 24,
    this.contentPadding = EdgeInsets.zero,
    this.backdropFilter,
    this.dismissible = true,
    this.blendMode = BlendMode.srcOver,
    this.snap = false,
    this.snapAnimationDuration,
    this.snapSizes,
    this.shouldCloseOnMinExtent = true,
  });

  final Widget mainWidget;
  final Widget? bottomWidget;
  final double? initialChildSize;
  final double? minChildSize;
  final double? maxChildSize;
  final double? turningRadiusPoint;
  final Duration? radiusChangeAnimationDuration;
  final double? cornersRadius;
  final EdgeInsets? contentPadding;
  final ImageFilter? backdropFilter;
  final bool? dismissible;
  final BlendMode? blendMode;
  final bool? snap;
  final Duration? snapAnimationDuration;
  final List<double>? snapSizes;
  final bool? shouldCloseOnMinExtent;
  final Color? backgroundColor;

  @override
  State<ExtendableModalSheet> createState() => _ExtendableModalSheetState();
}

class _ExtendableModalSheetState extends State<ExtendableModalSheet>
    with SingleTickerProviderStateMixin {
  final DraggableScrollableController scrollController =
      DraggableScrollableController();
  bool rounded = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_handleScrollable);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void _handleScrollable() {
    if ((MediaQuery.sizeOf(context).height - scrollController.pixels) <
        (widget.turningRadiusPoint!)) {
      setState(() {
        rounded = false;
      });
    } else {
      setState(() {
        rounded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filter =
        widget.backdropFilter ?? ImageFilter.blur(sigmaX: 6, sigmaY: 6);
    return BackdropFilter(
      filter: filter,
      blendMode: widget.blendMode!,
      child: DraggableScrollableSheet(
        controller: scrollController,
        expand: !widget.dismissible!,
        snap: widget.snap!,
        snapSizes: widget.snapSizes,
        snapAnimationDuration: widget.snapAnimationDuration,
        initialChildSize: widget.initialChildSize!,
        minChildSize: widget.minChildSize!,
        maxChildSize: widget.maxChildSize!,
        shouldCloseOnMinExtent: widget.shouldCloseOnMinExtent!,
        builder: (BuildContext context, ScrollController scrollController) =>
            AnimatedContainer(
                padding: widget.contentPadding,
                decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: !rounded
                        ? BorderRadius.zero
                        : BorderRadius.only(
                            topRight: Radius.circular(widget.cornersRadius!),
                            topLeft: Radius.circular(widget.cornersRadius!))),
                duration: widget.radiusChangeAnimationDuration!,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: widget.mainWidget,
                      ),
                    ),
                    widget.bottomWidget ?? const SizedBox()
                  ],
                )),
      ),
    );
  }
}
