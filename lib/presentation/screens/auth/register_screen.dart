import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/database/shared_prefs.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _rememberMe = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void toggleAuthMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadStoredCredentials();
  }

  Future<void> _loadStoredCredentials() async {
    final credentials = await SharedPrefs.getStoredCredentials();
    final isLoggedIn = await SharedPrefs.isUserLoggedIn();

    if (isLoggedIn) {
      setState(() {
        _usernameController.text = credentials['username'] ?? '';
        _passwordController.text = credentials['password'] ?? '';
        _rememberMe = true;
      });
    }
  }

  Future<void> _handleLogin() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      await SharedPrefs.saveCredentials(
        username: username,
        password: password,
        rememberMe: _rememberMe,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Row with Title and Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isLogin
                        ? 'Login to your account'
                        : 'Sign up for an account',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Text(
                isLogin
                    ? 'Hello welcome back to account'
                    : 'Welcome! create your account to get started.',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 24),

              // Login/Register Toggle
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (!isLogin) toggleAuthMode();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: isLogin ? Colors.grey[200] : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: isLogin ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (isLogin) toggleAuthMode();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: !isLogin ? Colors.grey[200] : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: !isLogin ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Username/Email Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: isLogin ? 'Email' : 'Email',
                  hintText: 'Enter email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Password Field
              TextFormField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),

              // Confirm Password Field (only for signup)
              if (!isLogin) ...[
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ],

              if (isLogin) ...[
                const SizedBox(height: 16),
                // Remember Me and Forgot Password Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: _rememberMe,
                            onChanged: (value) =>
                                setState(() => _rememberMe = value),
                            activeTrackColor: AppColors.primaryButtonColor,
                          ),
                        ),
                        const Text(
                          'Remember Me',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: const Text(
                        'forgot password',
                        style: TextStyle(
                          color: Color(0xFFAA1F32),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 24),

              // Continue Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAA1F32),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Login/Signup Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isLogin
                        ? 'Didn\'t have an account? '
                        : 'Already have an account? ',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: toggleAuthMode,
                    child: Text(
                      isLogin ? 'Sign Up' : 'Log in',
                      style: const TextStyle(color: Color(0xFFAA1F32)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
