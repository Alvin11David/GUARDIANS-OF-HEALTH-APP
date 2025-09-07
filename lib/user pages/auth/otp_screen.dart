import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE6E6), // Light pinkish background from SignUpPage
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Decorative header with SVGs and checkmarks
            Stack(
              children: [
                Positioned(
                  top: 102,
                  left: 54,
                  child: SvgPicture.asset(
                    'assets/vectors/greenvirus.svg',
                    width: 58,
                    height: 58,
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 40,
                  child: SvgPicture.asset(
                    'assets/vectors/greenvirus.svg',
                    width: 45,
                    height: 45,
                  ),
                ),
                Positioned(
                  top: 220,
                  right: 10,
                  child: SvgPicture.asset(
                    'assets/vectors/greenvirus.svg',
                    width: 36,
                    height: 36,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 62),
                    Center(
                      child: Image.asset(
                        'assets/logo/logo.png', // Replace with your DNA logo
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "OTP Verification",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Color(0xFF000000),
                      ),
                    ),
                    const Text(
                      '"You are almost there"',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
                // Green checkmark icons (Positioned to match image)
                const Positioned(
                  top: 40,
                  left: 20,
                  child: Icon(Icons.check_circle, color: Color(0xFF3FD317), size: 32),
                ),
                const Positioned(
                  top: 80,
                  right: 20,
                  child: Icon(Icons.check_circle, color: Color(0xFF3FD317), size: 32),
                ),
                const Positioned(
                  top: 140,
                  right: 60,
                  child: Icon(Icons.check_circle, color: Color(0xFF3FD317), size: 24),
                ),
              ],
            ),
            // Main content container with curved design
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(140),
                  bottomRight: Radius.circular(140),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 38),
                  const Row(
                    children: [
                      Icon(Icons.lock_outline, color: Color(0xFF9E9E9E), size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Verify Your Email',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          color: Color(0xFF424242),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please enter the 4 digit code we have sent to [email].',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // 4-digit OTP input (simulated with TextFields)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        width: 50,
                        height: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFF3FD317)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFF3FD317)),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                  // Resend button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton(
                      onPressed: () {
                        // Mock resend logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('OTP Resent!')),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF3FD317), width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.refresh, color: Color(0xFF3FD317), size: 20),
                          SizedBox(width: 8),
                          Text(
                            "Resend",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3FD317),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Verify Now button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        // Mock verify logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Verification Successful!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00C853),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Verify Now",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Back to Sign In link
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Back to Sign In",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3FD317),
                        ),
                      ),
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