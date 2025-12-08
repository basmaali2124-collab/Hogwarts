import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    super.key,
    required this.context,
    required this.errorMessage,
  });

  final BuildContext context;
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.redAccent),
            const SizedBox(height: 20),
            const Text(
              'Failed to fetch data',
              style: TextStyle(
                fontFamily: 'Griffy',
                fontSize: 28,
                color: Color(0xFF5D4037),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                errorMessage, 
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton( style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B6F47),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.4),
                ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Back', style: TextStyle(
                    fontFamily: 'Griffy',
                    fontSize: 28,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),),
            ),
          ],
        ),
      ),
    );
  }
}
