import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String language;
  final Color accentColor;
  final bool isDarkMode;

  const LoginPage({
    super.key,
    required this.language,
    this.accentColor = const Color(0xFF00897B), // default teal
    this.isDarkMode = false,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final accentColor = widget.accentColor;
    final isDarkMode = widget.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image on top
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    'assets/gra.png', // Replace with your image asset path
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 30),

                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome back! Please login to your account.',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Only Google login button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(
                      icon: Icons.g_mobiledata,
                      label: 'Google',
                      color: Colors.redAccent,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          color: isDarkMode ? Colors.grey[400] : Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Email/phone input
                _inputField(
                  label: 'Email or Phone Number',
                  keyboardType: TextInputType.emailAddress,
                  isDarkMode: isDarkMode,
                ),
                const SizedBox(height: 16),

                // Password input with toggle visibility
                TextFormField(
                  obscureText: !_passwordVisible,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                    ),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[900] : Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () =>
                          setState(() => _passwordVisible = !_passwordVisible),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Login button
                ElevatedButton(
                  onPressed: () {
                    // handle login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: isDarkMode ? Colors.grey[400] : Colors.black87,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // navigate to sign up
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: accentColor),
                      ),
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

  Widget _inputField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool isDarkMode = false,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
        ),
        filled: true,
        fillColor: isDarkMode ? Colors.grey[900] : Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
