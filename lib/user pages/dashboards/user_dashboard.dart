import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date

class UserdashboardScreen extends StatefulWidget {
  const UserdashboardScreen({super.key});

  @override
  State<UserdashboardScreen> createState() => UserdashboardScreenState();
}

class UserdashboardScreenState extends State<UserdashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Get current day of month (like "11")
    String currentDay = DateFormat('d').format(DateTime.now());

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            width: screenWidth,
            height: screenHeight,
            color: const Color(0xFFEFE6E6),
          ),

          // Grid icon (left side)
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.02,
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.005),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: screenWidth * 0.045,
                        height: screenWidth * 0.045,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.005),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.005),
                      Container(
                        width: screenWidth * 0.04,
                        height: screenWidth * 0.04,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.005),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.005),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: screenWidth * 0.04,
                        height: screenWidth * 0.04,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.005),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.005),
                      Container(
                        width: screenWidth * 0.04,
                        height: screenWidth * 0.04,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.005),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Profile image (right top)
          Positioned(
            top: screenHeight * 0.05,
            right: screenWidth * 0.02,
            child: Container(
              width: screenWidth * 0.13,
              height: screenWidth * 0.13,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: screenWidth * 0.005,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/Ellipse3.png',
                width: screenWidth * 0.09,
                height: screenWidth * 0.09,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Notifications icon
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.65,
            child: Container(
              width: screenWidth * 0.13,
              height: screenWidth * 0.13,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: screenWidth * 0.005,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
                size: screenWidth * 0.07,
              ),
            ),
          ),

          // Greeting
          Positioned(
            top: screenHeight * 0.13,
            left: screenWidth * 0.02,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hello, ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lufga',
                    ),
                  ),
                  TextSpan(
                    text: 'user',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lufga',
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Subtitle text
          Positioned(
            top: screenHeight * 0.19,
            left: screenWidth * 0.02,
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.01),
              color: Colors.white.withOpacity(0.3),
              child: Text(
                'Ready to learn, or get help?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05,
                  fontFamily: 'Lufga',
                ),
              ),
            ),
          ),

          // Yellow rounded rectangle (right side) with "Thu" + black circle + date
          Positioned(
            top: screenHeight * 0.13,
            right: screenWidth * 0.02,
            child: Container(
              width: screenWidth * 0.15,
              height: screenHeight * 0.13,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFF44),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.02),
                    child: Text(
                      'Thu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lufga',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenWidth * 0.02),
                    child: Container(
                      width: screenWidth * 0.13,
                      height: screenWidth * 0.13,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          currentDay, // Show current date here
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lufga',
                          ),
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
    );
  }
}
