import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as Math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {}); // Ensure the widget rebuilds on each animation tick
    })..forward();
    
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/OnboardingScreen1');
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFD6C9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Center(child: AnimatedRadialCircles())),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
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
                SizedBox(height: 16),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    value: _progressController.value,
                    backgroundColor: Colors.black, // Simplified to pure black for clarity
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Pure white for contrast
                    strokeWidth: 5,
                  ),
                ),
              ],
            ),
          ),
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
    final double screenSize = Math.min(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    final double size = screenSize * 1;
    final double center = size / 2;
    final List<double> radii = [
      size * 0.25, // Innermost circle
      size * 0.45, // Middle circle
      size * 0.7,  // Outermost circle
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
              final List<double> phaseOffsets = [0, 2, 4];
              return Stack(
                children: List.generate(3, (i) {
                  final double direction = (i == 1) ? 1.0 : -1.0;
                  final double theta = direction * angle + phaseOffsets[i];
                  final double x = center + radii[i] * Math.cos(theta) - 17.5;
                  final double y = center + radii[i] * Math.sin(theta) - 17.5;
                  return Positioned(
                    left: x,
                    top: y,
                    child: Image.asset(
                      images[i],
                      width: size * 0.1,
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