import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

/// Pre-built shimmer effects for convenience.
class ShimmerWidget extends StatelessWidget {

  final double width;
  final double height;
  final double radius;

  const ShimmerWidget.rectangular(
      {this.width = double.infinity , this.height = double.infinity, required this.radius});

  const ShimmerWidget.circular(
      { this.width = double.infinity, this.height = double.infinity ,  this.radius = 50});
  const ShimmerWidget.text({
    required this.width , required this.height , required this.radius});

  /// Build shimmer with provided [child]
  static Widget buildWithChild(child){
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 500),
      baseColor :   Color(0xff434273),
      highlightColor:  Color(0xff303051),
      child: child,
    );
  }

  static Widget customRect(width, height, BorderRadius radius, child, frame){
    return frame != null ? child : Shimmer.fromColors(
    period: const Duration(milliseconds: 500),



      baseColor :   Color(0xff434273),
      highlightColor:  Color(0xff303051),

    child: Container(

      height: height,
      width: width,

      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: radius

      ),
      child: child,
    ),
  );
  }





  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    period: const Duration(milliseconds: 500),



    baseColor :   Color(0xff434273),
    highlightColor:  Color(0xff303051),

    child: Container(

      height: height,
      width: width,

      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(radius)

      ),
    ),
  );
}
