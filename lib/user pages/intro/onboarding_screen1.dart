import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  bool _isGlowing = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.04,
              right: screenWidth * 0.04,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isGlowing = true;
                  });
                  Future.delayed(const Duration(milliseconds: 200), () {
                    setState(() {
                      _isGlowing = false;
                    });
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: _isGlowing ? Colors.white.withOpacity(0.2) : Colors.transparent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lufga',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.13,
              left: screenWidth * 0.05,
              child: Text(
                'AWARE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lufga',
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Positioned(
              top: screenHeight * 0.24,
              right: screenWidth * 0.05,
              child: Text(
                'NESS',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.05,
              right: screenWidth * 0.05,
              child: Image.asset(
                'assets/images/onboarding1.png',
                width: screenWidth * 0.6,
                height: screenHeight * 0.8,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
