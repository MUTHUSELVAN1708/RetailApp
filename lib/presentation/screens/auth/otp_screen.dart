import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

import 'package:retail_mobile/config/app_colors.dart';

import 'create_new_password.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;

  const OTPVerificationScreen({super.key, this.email = 'muthu@gmail.com'});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final int otpLength = 6;
  List<String> otp = List.filled(6, '');
  int _timerSeconds = 300; // 5 minutes
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  String get timerText {
    int minutes = _timerSeconds ~/ 60;
    int seconds = _timerSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                          color: AppColors.primaryButtonColor,
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    const Text(
                      'OTP Verification',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFAA1F32),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Instruction text
                Text(
                  'please enter the otp below to verify your identity.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: const Text(
                      'OTP',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                Center(
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    cursorColor: AppColors.lightPink,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryButtonColor,
                    ),
                    animationCurve: Curves.easeIn,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      fieldHeight: 45,
                      fieldWidth: 45,
                      activeFillColor: AppColors.whiteColor,
                      inactiveFillColor: AppColors.lightPink,
                      selectedFillColor: AppColors.whiteColor,
                      inactiveColor: AppColors.lightPink,
                      activeColor: AppColors.lightPink,
                      selectedColor: AppColors.lightPink,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    enableActiveFill: true,
                    onChanged: (value) {},
                    onCompleted: (value) {
                      print("Entered OTP: $value");
                    },
                  ),
                ),

                const SizedBox(height: 20),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.email,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          size: 12,
                          Icons.edit,
                          color: AppColors.primaryButtonColor,
                        ),
                      ],
                    ),
                    Text(
                      'Code expire in : $timerText',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Verify Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateNewPassword()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAA1F32),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Verify',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Resend OTP
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _timerSeconds = 300;
                      });
                      startTimer();
                    },
                    child: const Text(
                      'Resend OTP',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
