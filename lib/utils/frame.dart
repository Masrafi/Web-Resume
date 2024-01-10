import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  const Frame({super.key, required this.width, required this.height, required this.child, required this.alignment});
  final double width;
  final double height;
  final child;
  final alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SafeArea(
        child: Container(
        // width: width,
        // height: height,
         margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
        //border: Border.all(),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
         boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.03),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0,
                    0), // changes position of shadow
              ),
            ],
      ),
          child: child,
        ),
      ),
    );
  }
}
