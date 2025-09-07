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
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lufga',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.08,
              left: screenWidth * 0.05,
              child: Text(
                'AWARE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Positioned(
              top: screenHeight * 0.23,
              right: screenWidth * 0.01 + (30 * 2 * 0.6),
              child: Text(
                'SS',
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
                'assets/images/onboarding1.png',
                width: screenWidth * 0.6,
                height: screenHeight * 0.82,
                fit: BoxFit.contain,
              ),
            ),
            // "NE" on top of the image
            Positioned(
              top: screenHeight * 0.23,
              right: screenWidth * 0.41,
              child: Text(
                'NE',
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
            // Glassy rectangle with responsive right padding (moved to top layer)
            Positioned(
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: Container(
                width: 370,
                height: 390,
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 2, // Align with the top of the container's content area
                      left: (370 - 15 - 15 - 40) / 2.4 + 0, // Center within available width
                      child: Container(
                        width: 40, // Fixed circle diameter
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50, // Below the circle, adjusted for spacing
                      left: (370 - 15 - 15) / 6 + 0, // Center within available width (370 - 30 padding)
                      child: Text(
                        'The Silent Threat',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.06, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center, // Centered alignment
                      ),
                    ),
                    Positioned(
                      top: 100, // Below "The Silent Threat", adjusted for spacing
                      left: (370 - 15 - 15) / 30 + 0, // Center within available width (370 - 30 padding)
                      child: Text(
                        '"Antimicrobial resistance (AMR) is\nspreading quietly worldwide.\nAwareness is the first step\nto prevention."',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.05, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center, // Centered alignment
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}