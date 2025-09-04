import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as Math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 9), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFD6C9),
      body: Center(
        child: AnimatedRadialCircles(),
      ),
    );
  }
}

class AnimatedRadialCircles extends StatefulWidget {
  const AnimatedRadialCircles({super.key});

  @override
  State<AnimatedRadialCircles> createState() => _AnimatedRadialCirclesState();
}

class _AnimatedRadialCirclesState extends State<AnimatedRadialCircles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 1;
    final double center = size / 2;
    final List<double> radii = [
      size * 0.17,
      size * 0.33,
      size * 0.49,
    ];
    final List<String> images = [
      'assets/images/Ellipse1.png',
      'assets/images/Ellipse2.png',
      'assets/images/Ellipse3.png',
    ];

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: ConcentricCirclesPainter(),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final double angle = _controller.value * 2 * Math.pi;
              final List<double> phaseOffsets = [0, 2, 4]; // phase offset for each image
              return Stack(
                children: List.generate(3, (i) {
                  final double theta = angle + phaseOffsets[i];
                  final double x = center + radii[i] * Math.cos(theta) - 16;
                  final double y = center + radii[i] * Math.sin(theta) - 16;
                  return Positioned(
                    left: x,
                    top: y,
                    child: Image.asset(
                      images[i],
                      width: 35,
                      height: 35,
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ConcentricCirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final Paint blackStroke = paint..color = Colors.black;

    // Draw three concentric circles
    for (int i = 1; i <= 3; i++) {
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width * 0.16 * i,
        blackStroke,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}