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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(child: AnimatedRadialCircles())),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                children:  [
                  Text(
                    'Guardians of Health',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Lufga',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Fighting Antimicrobial Resistance Together',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Lufga',
                    ),
                  ),
                ],
              ),),
        ],
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
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use the smaller of width or height to ensure responsiveness and fit within screen
    final double screenSize = Math.min(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    final double size = screenSize * 1; // Scale to 90% of smallest dimension
    final double center = size / 2;
    // Define radii as proportions of the size for larger circles
    final List<double> radii = [
      size * 0.25, // Innermost circle
      size * 0.45, // Middle circle
      size * 0.7, // Outermost circle
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
            painter: ConcentricCirclesPainter(radii: radii),
          ),
          Image.asset(
            'assets/logo/logo.png',
            width: size * 0.25,
            height: size * 0.25,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final double angle = _controller.value * 2 * Math.pi;
              final List<double> phaseOffsets = [
                0,
                2,
                4,
              ]; // Phase offset for each image
              return Stack(
                children: List.generate(3, (i) {
                  final double direction = (i == 1) ? 1.0 : -1.0;
                  final double theta = direction * angle + phaseOffsets[i];
                  // Position images exactly on their respective circles
                  final double x =
                      center +
                      radii[i] * Math.cos(theta) -
                      17.5; // Adjust for image size
                  final double y = center + radii[i] * Math.sin(theta) - 17.5;
                  return Positioned(
                    left: x,
                    top: y,
                    child: Image.asset(
                      images[i],
                      width: size * 0.1, // Scale image size relative to screen
                      height: size * 0.1,
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
  final List<double> radii;

  ConcentricCirclesPainter({required this.radii});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final Paint blackStroke = paint..color = Colors.black;

    // Draw concentric circles using provided radii
    for (double radius in radii) {
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        radius,
        blackStroke,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}