import 'package:flutter/material.dart';
import 'installment_plan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 📌 Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/home_background.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 📌 Dark Overlay for Readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          // 📌 Smaller Rectangular Logo in Upper Left Corner
          Positioned(
            top: 40, // Adjusted for padding
            left: 20, // Adjusted for padding
            child: Container(
              width: 100, // Reduced width
              height: 40, // Reduced height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), // Optional: Slight rounding
                border: Border.all(color: Colors.white, width: 2), // Optional border
              ),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain, // Ensures image fits within the rectangle
              ),
            ),
          ),

          // 📌 Main Content
          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60), // Push content slightly down

                  // 🔹 Title
                  Text(
                    "Buy Now, Pay Later",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),

                  // 🔹 Subtitle
                  Text(
                    "Shop with ease and pay in installments. No hassle, no worries!",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),

                  // 🔹 Buttons
                  _customButton(
                    text: "Start",
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InstallmentPlanPage())),
                    color: Color(0xFF00C2FF),
                  ),
                  SizedBox(height: 10),
                  _customButton(
                    text: "Learn More",
                    onTap: () {
                      // Add an info page or pop-up later
                    },
                    color: Color(0xFFE67026),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Custom Button Widget
  Widget _customButton({required String text, required VoidCallback onTap, required Color color}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadowColor: Colors.black,
        elevation: 5,
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
