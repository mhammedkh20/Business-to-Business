import 'dart:io';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class FullScreenWidget extends StatelessWidget {
  const FullScreenWidget({
    required this.child,
    this.image,
    this.imageAssets,
    required this.heroTag,
    this.backgroundColor = Colors.black,
    this.backgroundIsTransparent = true,
    this.disposeLevel,
  });

  final int heroTag;
  final File? image;
  final String? imageAssets;
  final Widget child;
  final Color backgroundColor;
  final bool backgroundIsTransparent;
  final DisposeLevel? disposeLevel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) {
              return FullScreenPage(
                  image: image,
                  heroTag: heroTag,
                  child: child,
                  imageAssets: imageAssets);
            },
          ),
        );
      },
      child: child,
    );
  }
}

enum DisposeLevel { High, Medium, Low }

class FullScreenPage extends StatefulWidget {
  FullScreenPage({
    required this.image,
    required this.heroTag,
    this.imageAssets,
    this.child,
    this.backgroundColor = Colors.black,
    this.backgroundIsTransparent = true,
    this.disposeLevel = DisposeLevel.Medium,
    this.onSend,
  });

  final File? image;
  final String? imageAssets;
  final Color backgroundColor;
  final bool backgroundIsTransparent;
  final DisposeLevel? disposeLevel;
  final Function()? onSend;
  final int heroTag;
  final Widget? child;

  @override
  _FullScreenPageState createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {
  double? initialPositionY = 0;

  double? currentPositionY = 0;

  double positionYDelta = 0;

  double opacity = 1;

  double disposeLimit = 150;

  late Duration animationDuration;

  @override
  void initState() {
    super.initState();
    setDisposeLevel();
    animationDuration = Duration.zero;
  }

  setDisposeLevel() {
    setState(() {
      if (widget.disposeLevel == DisposeLevel.High)
        disposeLimit = 300;
      else if (widget.disposeLevel == DisposeLevel.Medium)
        disposeLimit = 200;
      else
        disposeLimit = 100;
    });
  }

  void _startVerticalDrag(details) {
    print(details.globalPosition.dy);
    setState(() {
      initialPositionY = details.globalPosition.dy;
    });
  }

  void _whileVerticalDrag(details) {
    setState(() {
      currentPositionY = details.globalPosition.dy;
      positionYDelta = currentPositionY! - initialPositionY!;
      setOpacity();
    });
  }

  setOpacity() {
    double tmp = positionYDelta < 0
        ? 1 - ((positionYDelta / 1000) * -1)
        : 1 - (positionYDelta / 1000);
    print(tmp);

    if (tmp > 1)
      opacity = 1;
    else if (tmp < 0)
      opacity = 0;
    else
      opacity = tmp;

    if (positionYDelta > disposeLimit || positionYDelta < -disposeLimit) {
      opacity = 0.5;
    }
  }

  _endVerticalDrag(DragEndDetails details) {
    if (positionYDelta > disposeLimit || positionYDelta < -disposeLimit) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        animationDuration = Duration(milliseconds: 300);
        opacity = 1;
        positionYDelta = 0;
      });

      Future.delayed(animationDuration).then((_) {
        setState(() {
          animationDuration = Duration.zero;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.heroTag);
    return Scaffold(
      backgroundColor: widget.backgroundIsTransparent
          ? Colors.transparent
          : widget.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.TRANSPARENT,
        iconTheme: const IconThemeData(color: AppColors.WHITE),
      ),
      body: GestureDetector(
        // onVerticalDragStart: (details) => _startVerticalDrag(details),
        // onVerticalDragUpdate: (details) => _whileVerticalDrag(details),
        // onVerticalDragEnd: (details) => _endVerticalDrag(details),
        child: Container(
          color: widget.backgroundColor.withOpacity(opacity),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: animationDuration,
                curve: Curves.fastOutSlowIn,
                top: 0 + positionYDelta,
                bottom: 0 - positionYDelta,
                left: 0,
                right: 0,
                child: getImage(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: widget.onSend != null
          ? FloatingActionButton(
              onPressed: widget.onSend,
              child: const Icon(
                Icons.send,
                color: AppColors.WHITE,
              ),
            )
          : null,
    );
  }

  Widget getImage() {
    if (widget.imageAssets != null) {
      return Hero(
        tag: "${widget.heroTag}",
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: InteractiveViewer(
            child: Image.asset(
              widget.imageAssets!,
            ),
          ),
        ),
      );
    }

    if (widget.image == null) {
      return widget.child!;
    } else {
      return Hero(
        tag: "${widget.heroTag}",
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: InteractiveViewer(
            child: Image.file(
              widget.image!,
              height: 100.r,
              width: 100.r,
            ),
          ),
        ),
      );
    }
  }
}
