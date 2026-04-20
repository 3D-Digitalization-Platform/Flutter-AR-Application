import 'package:flutter/material.dart';
import '../service/auth_feature_service.dart';
import 'widgets/auth_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthFeatureService _authService = AuthFeatureService();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Basic validation for Date
      final dob = DateTime.tryParse(_dobController.text);
      if (dob == null) {
        throw Exception("Invalid date format. Use YYYY-MM-DD");
      }

      final success = await _authService.signup(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        dateOfBirth: dob,
        phoneNumber: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account created! Please log in.")),
        );
        Navigator.pushReplacementNamed(context, '/');
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().contains("Exception:") 
            ? e.toString().split("Exception: ").last 
            : "Registration failed. Please check your data.";
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

                const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Already have an account? Log In",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 20),

                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                const SizedBox(height: 10),

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
                          Row(
                            children: [
                              Expanded(child: commonField("First Name", controller: _firstNameController, hasError: _errorMessage != null)),
                              const SizedBox(width: 10),
                              Expanded(child: commonField("Last Name", controller: _lastNameController, hasError: _errorMessage != null)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          commonField("Email", controller: _emailController, hasError: _errorMessage != null, keyboardType: TextInputType.emailAddress),
                          const SizedBox(height: 12),
                          commonField("Date of Birth (YYYY-MM-DD)", controller: _dobController, hasError: _errorMessage != null),
                          const SizedBox(height: 12),
                          commonField("Phone Number", controller: _phoneController, hasError: _errorMessage != null, keyboardType: TextInputType.phone),
                          const SizedBox(height: 12),
                          commonField("Password", isPassword: true, controller: _passwordController, hasError: _errorMessage != null),
                          const SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _handleSignUp,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6C8FCB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: _isLoading 
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Text("Sign Up", style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // OR
                          const Row(
                            children: [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("or"),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Google Button
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.g_mobiledata, size: 30), // temporary
                                SizedBox(width: 8),
                                Text("Sign up with Google"),
                              ],
                            ),
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
