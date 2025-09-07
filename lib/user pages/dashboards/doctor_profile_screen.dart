import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class DoctorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width * 0.12;
    final double textSize = MediaQuery.of(context).size.height * 0.025;
    final double imageWidth = MediaQuery.of(context).size.width * 0.8; // 80% of screen width for responsiveness
    final double nameFontSize = MediaQuery.of(context).size.width * 0.05; // Responsive font size for "Dr. Bruce Wilberforce"
    final double barWidth = MediaQuery.of(context).size.width * 0.2; // 20% of screen width, smaller than text
    final double margin = MediaQuery.of(context).size.width * 0.1; // Left and right margins for "Dr. Bruce Wilberforce"
    final double contentWidth = imageWidth; // Width within the margins, matching "Dr. Bruce Wilberforce"
    final double infoBoxHeight = MediaQuery.of(context).size.height * 0.06; // Approximately 100px scaled responsively
    final double getInTouchFontSize = MediaQuery.of(context).size.width * 0.045; // Responsive font size for "Get In Touch"
    final double iconSizeResponsive = MediaQuery.of(context).size.width * 0.14; // Increased responsive icon size

    return Scaffold(
      backgroundColor: Color(0xFFEFE6E6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: iconSize,
                  height: iconSize,
                  margin: EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8), // Smooth edges, not fully circular
                  ),
                  child: IconButton(
                    icon: Icon(Icons.chevron_left, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: iconSize,
                      height: iconSize,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFEFE6E6), // Same as background color
                        border: Border.all(color: Colors.white, width: 2), // White outline
                        borderRadius: BorderRadius.circular(iconSize / 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.notifications_none, color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: iconSize,
                      height: iconSize,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(iconSize / 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/DrProfilePic.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 8),
              child: Text(
                'PROFILE',
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Bold black
                  letterSpacing: 0.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 2,
                left: margin,
                right: margin,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/DrBigPic.png',
                  width: imageWidth,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: margin,
                right: margin,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Dr. Bruce Wilberforce',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: nameFontSize, // responsive font size
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 4, // Small padding to place bar below middle of text
                left: margin,
                right: margin,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/blueBar.png',
                  width: barWidth, // 20% of screen width, smaller than text
                  height: 8 * (barWidth / 70), // Maintain aspect ratio (70x8)
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8, // Small padding below blue bar
                left: margin,
                right: margin,
              ),
              child: Container(
                width: contentWidth, // Matches the width within the margins
                height: infoBoxHeight,
                color: Colors.transparent, // Colorless text box
                child: Center(
                  child: Text(
                    'BDS. MDS - Infectious Disease Specialist and Oral Implantology. 16 Years Experience',
                    textAlign: TextAlign.center,
                    softWrap: true, // Allow natural wrapping
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.035, // Responsive font size
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8, // Small padding below info text
                left: margin,
                right: margin,
              ),
              child: Center(
                child: Text(
                  'Get In Touch',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getInTouchFontSize, // Responsive font size
                  ).merge(GoogleFonts.poppins()), // Apply Poppins font
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Spacer(), // Pushes the icons to the bottom
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0), // Added vertical padding to ensure space
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, // Adjusted for more flexible spacing
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 32.0, // Same left space as email icon
                            bottom: 32.0, // Consistent with the down margin
                            right: 15.0, // Increased extra space to the right of email icon
                          ),
                          child: Container(
                            width: iconSizeResponsive,
                            height: iconSizeResponsive,
                            decoration: BoxDecoration(
                              color: Colors.white, // White background
                              shape: BoxShape.circle, // Circular shape
                              border: Border.all(
                                color: Colors.green, // Green outline
                                width: 2.0, // Outline thickness
                              ),
                            ),
                            child: Icon(
                              Icons.email,
                              color: Colors.black, // Black icon
                              size: iconSizeResponsive * 0.8, // Increased icon size
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 32.0, // Consistent with the down margin
                            left: 15.0, // Increased extra space to the left of phone icon
                            right: 15.0, // Increased extra space to the right of phone icon
                          ),
                          child: Container(
                            width: iconSizeResponsive,
                            height: iconSizeResponsive,
                            decoration: BoxDecoration(
                              color: Colors.white, // White background
                              shape: BoxShape.circle, // Circular shape
                              border: Border.all(
                                color: Colors.green, // Green outline
                                width: 2.0, // Outline thickness
                              ),
                            ),
                            child: Icon(
                              Icons.phone, // Phone call icon
                              color: Colors.black, // Black icon
                              size: iconSizeResponsive * 0.8, // Same size as email icon
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.0, // Increased extra space to the left of message icon
                            right: 32.0, // Same space from right margin as email from left
                            bottom: 32.0, // Consistent with the down margin
                          ),
                          child: Container(
                            width: iconSizeResponsive,
                            height: iconSizeResponsive,
                            decoration: BoxDecoration(
                              color: Colors.white, // White background
                              shape: BoxShape.circle, // Circular shape
                              border: Border.all(
                                color: Colors.green, // Green outline
                                width: 2.0, // Outline thickness
                              ),
                            ),
                            child: Icon(
                              Icons.message, // Message icon
                              color: Colors.black, // Black icon, kept dark
                              size: iconSizeResponsive * 0.7, // Reduced size for thinner appearance
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}