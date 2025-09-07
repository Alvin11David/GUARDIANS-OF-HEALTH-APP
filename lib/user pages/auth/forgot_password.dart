import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE6E6), // Light pinkish background from SignUpPage
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Decorative header with SVGs (inspired by SignUpPage)
            Stack(
              children: [
                Positioned(
                  top: 102,
                  left: 54,
                  child: SvgPicture.asset(
                    'assets/vectors/forgotpassword.svg',
                    width: 58,
                    height: 58,
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 40,
                  child: SvgPicture.asset(
                    'assets/vectors/forgotpassword.svg',
                    width: 45,
                    height: 45,
                  ),
                ),
                Positioned(
                  top: 220,
                  right: 10,
                  child: SvgPicture.asset(
                    'assets/vectors/forgotpassword.svg',
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
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Color(0xFF000000),
                      ),
                    ),
                    const Text(
                      '"Let\'s Get You Fixed"',
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
                        'Forgot Your Password?',
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
                    'Please enter your email address below to receive an OTP code.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Email Address",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter Your Email Address",
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                        color: Color(0xFF3FD317),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xFF3FD317),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xFF3FD317),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        // Mock OTP sending logic (replace with API call)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('OTP Sent!')),
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
                            "Send OTP",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Remember your password? ",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFF000000),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Navigate back to Sign In
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Color(0xFF3FD317),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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