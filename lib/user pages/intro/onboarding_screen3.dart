import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
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
                'DASHB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lufga',
                )
              )
            ),
            Positioned(
              bottom: screenHeight * 0.1, // Adjusted to avoid overlap
              left: screenWidth * 0.05,
              child: Image.asset(
                'assets/images/onboarding2.png',
                width: screenWidth * 0.5, // Reduced width
                height: screenHeight * 0.6, // Reduced height
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.1, // Adjusted to match
              right: screenWidth * 0.05,
              child: Image.asset(
                'assets/images/onboarding2.2.png',
                width: screenWidth * 0.5, // Reduced width
                height: screenHeight * 0.6, // Reduced height
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}