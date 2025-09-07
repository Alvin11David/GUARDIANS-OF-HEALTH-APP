import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width * 0.12;
    final double textSize = MediaQuery.of(context).size.height * 0.025;
    final double imageWidth = MediaQuery.of(context).size.width * 0.8; // 80% of screen width for responsiveness
    final double nameFontSize = MediaQuery.of(context).size.width * 0.05; // Responsive font size for "Dr. Bruce Wilberforce"
    final double barWidth = MediaQuery.of(context).size.width * 0.2; // 20% of screen width, smaller than text

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
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
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
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
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
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
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
            // Placeholder for other content
          ],
        ),
      ),
    );
  }
}