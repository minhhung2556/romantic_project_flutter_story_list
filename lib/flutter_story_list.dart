library flutter_story_list;

import 'dart:math' as math;

import 'package:flutter/material.dart';

class StoryList extends StatefulWidget {
  final Widget addImage;
  final Widget addIcon;
  final Widget addText;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double height;
  final double addItemWidth;
  final double itemMargin;
  final Color backgroundColor;
  final Color borderColor;
  final Color addIconBackgroundColor;
  final Color addItemBackgroundColor;
  final double borderRadius;

  const StoryList({
    Key key,
    this.addImage,
    this.addIcon,
    this.addText,
    this.itemBuilder,
    this.itemCount = 0,
    this.height = 200,
    this.addItemWidth = 100,
    this.itemMargin = 8,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black12,
    this.addIconBackgroundColor = Colors.blue,
    this.addItemBackgroundColor = const Color(0xffefefef),
    this.borderRadius = 16,
  }) : super(key: key);

  @override
  _StoryListState createState() => _StoryListState();
}

const double _kBorderWidth = 2;
const double _kTextSpeed = 3;
const double _kBorderSpeed = 5;
const Offset _kCompactSizeFactor = Offset(0.5, 0.28);
const double _kIconSizeFactor = 0.45;
const double _kImageHeightFactor = 0.7;
const double _kAnimationMaxScrollExtentFactor = 0.2;

class _StoryListState extends State<StoryList> {
  ScrollController _scrollController;
  double _animationValue = 0.0;
  AlignmentTween _addIconAlignmentTween, _addImageAlignmentTween;
  SizeTween _addImageSizeTween, _addItemSizeTween, _addIconSizeTween;
  BorderRadiusTween _addImageBorderRadiusTween,
      _addIconBorderRadiusTween,
      _addItemBorderRadiusTween;
  EdgeInsetsTween _addIconMarginTween, _addItemPaddingTween;
  ColorTween _addItemColorTween, _addItemBorderColorTween;

  @override
  void initState() {
    var compactSize = Size(widget.addItemWidth * _kCompactSizeFactor.dx,
        widget.height * _kCompactSizeFactor.dy);
    var iconSize = widget.addItemWidth * _kIconSizeFactor;
    var iconCompactSize = compactSize.width * _kIconSizeFactor;

    _addImageBorderRadiusTween = BorderRadiusTween(
      begin: BorderRadius.only(
        topLeft: Radius.circular(widget.borderRadius),
        topRight: Radius.circular(widget.borderRadius),
        bottomLeft: Radius.zero,
        bottomRight: Radius.zero,
      ),
      end: BorderRadius.circular(compactSize.height),
    );
    _addImageAlignmentTween = AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.center,
    );
    _addIconAlignmentTween = AlignmentTween(
      begin: Alignment.bottomCenter,
      end: Alignment.bottomRight,
    );
    _addItemSizeTween = SizeTween(
      begin: Size(widget.addItemWidth, widget.height),
      end: Size(compactSize.height, compactSize.height),
    );
    _addImageSizeTween = SizeTween(
      begin: Size(widget.addItemWidth, widget.height * _kImageHeightFactor),
      end: Size(compactSize.height, compactSize.height),
    );
    _addIconSizeTween = SizeTween(
      begin: Size(iconSize, iconSize),
      end: Size(iconCompactSize, iconCompactSize),
    );
    _addIconBorderRadiusTween = BorderRadiusTween(
      begin: BorderRadius.circular(iconSize),
      end: BorderRadius.circular(iconCompactSize),
    );
    _addIconMarginTween = EdgeInsetsTween(
      begin: EdgeInsets.only(
          bottom: math.max(
              0,
              widget.height -
                  _addImageSizeTween.begin.height -
                  iconSize / 2 -
                  widget.itemMargin * 2 -
                  _kBorderWidth * 2)),
      end: EdgeInsets.zero,
    );
    _addItemBorderRadiusTween = BorderRadiusTween(
      begin: BorderRadius.circular(widget.borderRadius + _kBorderWidth),
      end: BorderRadius.only(
        topLeft: Radius.zero,
        bottomLeft: Radius.zero,
        topRight: Radius.circular(compactSize.height),
        bottomRight: Radius.circular(compactSize.height),
      ),
    );
    _addItemColorTween = ColorTween(
      begin: widget.addItemBackgroundColor,
      end: widget.backgroundColor,
    );
    _addItemBorderColorTween = ColorTween(
      begin: widget.borderColor,
      end: widget.backgroundColor,
    );
    _addItemPaddingTween = EdgeInsetsTween(
      begin: EdgeInsets.only(
          left: widget.itemMargin,
          top: widget.itemMargin,
          bottom: widget.itemMargin),
      end: EdgeInsets.zero,
    );

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      var _addItemAnimationMaxOffset =
          _scrollController.position.maxScrollExtent *
              _kAnimationMaxScrollExtentFactor;
      _animationValue =
          math.min(1, math.max(0, offset / _addItemAnimationMaxOffset));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var addItem = _buildAddItem(context);
    return Container(
      color: widget.backgroundColor,
      height: widget.height,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          ListView.builder(
            padding: EdgeInsets.only(
                top: widget.itemMargin,
                bottom: widget.itemMargin,
                right: widget.itemMargin),
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.itemCount + 1,
            itemBuilder: (context, index) => index == 0
                ? Container(
                    child: addItem,
                    foregroundDecoration:
                        BoxDecoration(color: widget.backgroundColor),
                  )
                : Container(
                    margin: EdgeInsets.only(left: widget.itemMargin),
                    decoration: BoxDecoration(
                      color: widget.borderColor,
                      borderRadius: _addItemBorderRadiusTween.begin,
                      border: Border.all(
                        color: _addItemBorderColorTween.begin,
                        width: _kBorderWidth,
                      ),
                    ),
                    child: ClipRRect(
                      child: widget.itemBuilder(context, index - 1),
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                  ),
          ),
          addItem,
        ],
      ),
    );
  }

  Widget _buildAddItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _addItemColorTween.transform(_animationValue),
        borderRadius: _addItemBorderRadiusTween.transform(_animationValue),
        border: Border.all(
          color: _addItemBorderColorTween
              .transform(math.min(1, _animationValue * _kBorderSpeed)),
          width: _kBorderWidth + _kBorderSpeed * _animationValue,
        ),
      ),
      width: _addItemSizeTween.transform(_animationValue).width,
      height: _addItemSizeTween.transform(_animationValue).height,
      margin: _addItemPaddingTween.transform(_animationValue),
      child: Stack(
        children: [
          Align(
            alignment: _addImageAlignmentTween.transform(_animationValue),
            child: SizedBox(
              width: _addImageSizeTween.transform(_animationValue).width,
              height: _addImageSizeTween.transform(_animationValue).height,
              child: ClipRRect(
                child: widget.addImage,
                borderRadius:
                    _addImageBorderRadiusTween.transform(_animationValue),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(_kBorderWidth),
              child: Opacity(
                child: widget.addText,
                opacity: math.max(0, 1 - _animationValue * _kTextSpeed),
              ),
            ),
          ),
          Align(
            alignment: _addIconAlignmentTween.transform(_animationValue),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    _addIconBorderRadiusTween.transform(_animationValue),
                color: widget.addIconBackgroundColor,
                border: Border.all(
                  width: _kBorderWidth,
                  color: widget.backgroundColor,
                ),
              ),
              constraints: BoxConstraints.tight(
                  _addIconSizeTween.transform(_animationValue)),
              margin: _addIconMarginTween.transform(_animationValue),
              child: widget.addIcon,
            ),
          ),
        ],
      ),
    );
  }
}
