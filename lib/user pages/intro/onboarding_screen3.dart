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
                'DASHB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lufga',
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.23,
              right: screenWidth * 0.01 + (30 * 2 * 0.6), 
              child: Text(
                'RD',
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
              bottom: screenHeight * 0.1, // Adjusted to avoid overlap
              left: screenWidth * 0.05,
              child: Image.asset(
                'assets/images/onboarding3.png',
                width: screenWidth * 0.6, // Reduced width
                height: screenHeight * 0.99, // Reduced height
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: screenHeight * 0.23,
              right: screenWidth * 0.41, // Start at the same left position as the original "NESS"
              child: Text(
                'OA',
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
                            '3',
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
                        'Track & Take Action',
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
                        '"See AMR trends in real time, join\n awareness events, and share\n innovatie solutions to protect\n our health."',
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
                          // Spacing between dots
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
                          Navigator.pushNamed(context, '/UserdashboardScreen');
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