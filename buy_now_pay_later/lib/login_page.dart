import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ White Background
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 App Logo
                Icon(Icons.lock, size: 60, color: Color(0xFFE67026)),

                SizedBox(height: 20),

                // 📧 Email Input
                buildTextField("Email", emailController, false, Icons.email),

                SizedBox(height: 12),

                // 🔒 Password Input
                buildTextField("Password", passwordController, true, Icons.lock),

                SizedBox(height: 10),

                // 🔗 Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {}, // Add Forgot Password Functionality
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0xFFE67026), fontSize: 14),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // 🚀 Login Button with Gradient
                ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.transparent, // Needed for gradient effect
                    shadowColor: Colors.black26,
                    elevation: 5,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFE67026), Color(0xFF00C2FF)], // ✅ Gradient Button
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(minWidth: 100, minHeight: 45),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // ✨ Sign-up Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Colors.black87)),
                    TextButton(
                      onPressed: () {}, // Add Sign-Up Navigation
                      child: Text("Sign up", style: TextStyle(color: Color(0xFF00C2FF), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🎯 Custom Input Field Widget
  Widget buildTextField(String hint, TextEditingController controller, bool isObscure, IconData icon) {
    return TextField(
      controller: controller,
      obscureText: isObscure ? !isPasswordVisible : false,
      decoration: InputDecoration(
        labelText: hint,
        prefixIcon: Icon(icon, color: Color(0xFFE67026)), // ✅ Icons use primary color
        suffixIcon: isObscure
            ? IconButton(
                icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Color(0xFF00C2FF)),
                onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
