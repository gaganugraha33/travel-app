import 'dart:ui';

import 'package:flutter/material.dart';

class BgBlur extends StatelessWidget {
  final double blur, opacity;
  final Widget child;

  const BgBlur({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Colors.black.withOpacity(opacity)),
              color: Colors.black.withOpacity(opacity)),
          child: child,
        ),
      ),
    );
  }
}
