import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.1,
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Center(
          child: SpinKitFadingCube(
            size: 30.0,
            color: Theme.of(context).primaryColor,
            // itemBuilder: (BuildContext context, int index) {
            //   return DecoratedBox(
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: index.isEven
            //           ? Color(0xFFfff0e3)
            //           : Color(0xFFe0f7fc),
            //     ),
            //   );
            // },
          ),
        ),
      ],
    );
  }
}
