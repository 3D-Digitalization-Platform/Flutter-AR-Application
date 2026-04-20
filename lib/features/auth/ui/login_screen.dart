import 'package:flutter/material.dart';
import '../service/auth_feature_service.dart';
import 'widgets/auth_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthFeatureService _authService = AuthFeatureService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final user = await _authService.login(
        _emailController.text.trim(),
        _passwordController.text,
        rememberMe: _rememberMe,
      );

      if (user != null && mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Invalid email or password. Please try again.";
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔵 Background
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
                          const Row(
                            children: [
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

                          if (_errorMessage != null)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                _errorMessage!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),

                          // Email
                          commonField(
                            "User@gmail.com",
                            controller: _emailController,
                            hasError: _errorMessage != null,
                            keyboardType: TextInputType.emailAddress,
                          ),

                          const SizedBox(height: 12),

                          // Password
                          commonField(
                            "******",
                            isPassword: true,
                            controller: _passwordController,
                            hasError: _errorMessage != null,
                          ),

                          const SizedBox(height: 10),

                          // Remember + Forgot
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (v) {
                                  setState(() {
                                    _rememberMe = v ?? false;
                                  });
                                },
                              ),
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
                              onPressed: _isLoading ? null : _handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFF6C8FCB),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                              ),
                              child: _isLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Text("Log In"),
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
                                onPressed: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
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
