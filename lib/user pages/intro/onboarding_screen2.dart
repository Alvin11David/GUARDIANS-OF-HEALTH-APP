import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
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
                'MOBILE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lufga',
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Positioned(
              top: screenHeight * 0.23,
              right: screenWidth * 0.01 + (30 * 2 * 0.6), 
              child: Text(
                'AT',
                style: TextStyle(
                  fontSize: 81,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5
                    ..color = Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.05,
              right: screenWidth * 0.05,
              child: Image.asset(
                'assets/images/onboarding2.2.png',
                width: screenWidth * 0.6,
                height: screenHeight * 0.82,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: screenHeight * 0.23,
              right: screenWidth * 0.41, // Start at the same left position as the original "NESS"
              child: Text(
                'CH',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5
                    ..color = Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
