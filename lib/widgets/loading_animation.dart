import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimation extends StatelessWidget {
  final double size;
  const LoadingAnimation({
    super.key,
    this.size = 70,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitWanderingCubes(
      size: size,
      color: Theme.of(context).primaryColor,
    );
  }
}
