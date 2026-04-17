import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔵 الخلفية
          Container(
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8EAEDB),
                  Color(0xFF6C8FCB),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),

                // 📝 Title
                const Text(
                  "Sign in to your Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Enter your email and password to log in",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 20),

                // 📦 Card
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // 🔘 Google Button
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: Colors.grey.shade300),
                            ),
                            child: const Center(
                              child: Text("Continue with Google"),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // OR
                          Row(
                            children: const [
                              Expanded(child: Divider()),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Or log in with"),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Email
                          field("User@gmail.com"),

                          const SizedBox(height: 12),

                          // Password
                          field("******", isPassword: true),

                          const SizedBox(height: 10),

                          // Remember + Forgot
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (v) {}),
                              const Text("Remember me"),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const Text("Forgot Password ?"),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFF6C8FCB),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text("Log In"),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Sign Up
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              const Text(
                                  "Don't have an account? "),
                              TextButton(
                                onPressed: () {},
                                child: const Text("Sign Up"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 TextField
Widget field(String hint, {bool isPassword = false}) {
  return TextField(
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF5F6FA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}