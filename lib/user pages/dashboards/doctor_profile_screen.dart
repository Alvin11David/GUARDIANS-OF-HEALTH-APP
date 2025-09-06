import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFEFE6E6),
        child: Stack(
          children: [
            Column(
              children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20), // Fixed border radius of 20
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
              ),
            ],
          ),
          ]
        ),
        
      ),
    );
  }
}