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
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
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
                  fontSize: 80,
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
              bottom: screenHeight * 0.20,
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
            Positioned(
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: Container(
                width: 370,
                height: 390,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top:
                          2, // Align with the top of the container's content area
                      left:
                          (370 - 15 - 15 - 40) / 2.4 +
                          0, // Center within available width
                      child: Container(
                        width: 40, // Fixed circle diameter
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '2',
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
                      left:
                          (370 - 15 - 15) / 6 +
                          0, // Center within available width (370 - 30 padding)
                      child: Text(
                        'Connect With Experts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.06, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center, // Centered alignment
                      ),
                    ),
                    Positioned(
                      top:
                          115, // Below "The Silent Threat", adjusted for spacing
                      left:
                          (370 - 15 - 15) / 30 +
                          0, // Center within available width (370 - 30 padding)
                      child: Text(
                        '"Get trusted answers from healthcare\n professionals and access\n verified information\n instatntly"',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.05, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center, // Centered alignment
                      ),
                    ),
                    // Page indicator
                    Positioned(
                      top: 250, // Below the last text, adjusted for spacing
                      left:
                          (370 - 15 - 15 - 60) / 3 +
                          23, // Center within available width (60 is total width of 3 dots)
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10), 
                          Container(
                            width: 20,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Spacing between dots
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // White rectangle below the indicator with "Next" text and icons
                    Positioned(
                      top:
                          300, // Below the page indicator, adjusted for spacing
                      left:
                          (370 - 15 - 15 - 230) / 3.5 +
                          0, // Center within available width (370 - 30 padding)
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/OnboardingScreen3');
                        },
                        child: Container(
                          width: 230, // Fixed width as requested
                          height: 50, // Fixed height as requested
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              30,
                            ), // 30 border radius as requested
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 40), // Shift "Next" to the right
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20, // Fixed font size for consistency
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 2), // Right padding of 2
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.fast_forward,
                                      color: Colors.green,
                                      size: 30, // Fixed size for consistency
                                    ),
                                    const SizedBox(width: 5), // Spacing between icons
                                    Icon(
                                      Icons.fast_forward,
                                      color: Colors.green,
                                      size: 30, // Fixed size for consistency
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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