import 'package:flutter/material.dart';
   
class CurrentSpeed extends StatelessWidget {

  final int speed;

  const CurrentSpeed({
    Key? key,
    required this.speed,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white.withOpacity(0),
              ], 
            ).createShader(Rect.fromLTWH(0,0, bounds.width, bounds.height));
          },
          child: Text(
            "$speed",
            style: const TextStyle(
              fontSize: 96,
              fontWeight: FontWeight.w500,
              height: 0.96,
            ),
          ),
        ),

        const Text(
          "km/h",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white30,
          ),
        )
      ],
    );
  }
}
