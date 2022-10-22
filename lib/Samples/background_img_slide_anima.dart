import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Services/global_variables.dart';

class BackgroundImgAnimation extends StatefulWidget {
  const BackgroundImgAnimation({Key? key}) : super(key: key);

  @override
  State<BackgroundImgAnimation> createState() => _BackgroundImgAnimationState();
}

class _BackgroundImgAnimationState extends State<BackgroundImgAnimation>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 22));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///if image here, this how to display <2 seconds before going to cachednetworkimage???
          // Image.asset(
          //   'assets/images/HalfMoon.jpg',
          //   fit: BoxFit.fill,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          Opacity(
            opacity: 0.7,
            child: CachedNetworkImage(
              imageUrl: demoUrlImage,

              ///this placeholder option to splash logo or image prior to network image load
              // placeholder: (context, url) => Image.asset(
              //   'assets/images/HalfMoon.jpg',
              //   fit: BoxFit.fill,
              //   width: double.infinity,
              //   height: double.infinity,
              // ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: FractionalOffset(_animation.value, 0),
            ),
          ),
        ],
      ),
    );
  }
}
