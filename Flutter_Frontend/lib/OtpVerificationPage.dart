import 'package:flutter/material.dart';
import 'api_service.dart';

class OtpVerificationPage extends StatefulWidget {
  final String emailOrPhone;

  const OtpVerificationPage({super.key, required this.emailOrPhone});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController otpController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text("Enter the OTP sent to your phone"),
            const SizedBox(height: 20),
            TextField(
              controller: otpController,
              decoration: const InputDecoration(
                labelText: "OTP",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      setState(() => isLoading = true);

                      final otp = otpController.text.trim();
                      final res = await ApiService.verifyOtp(widget.emailOrPhone, otp);

                      setState(() => isLoading = false);

                      if (res.statusCode == 200) {
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("❌ Invalid OTP")),
                        );
                      }
                    },
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
