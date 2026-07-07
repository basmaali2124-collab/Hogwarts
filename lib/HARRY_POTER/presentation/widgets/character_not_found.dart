import 'package:flutter/material.dart';

class CharacterNotFound extends StatelessWidget {
  const CharacterNotFound({
    super.key,
    required this.charName,
    required this.context,
  });

  final String charName;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 80, color: Color(0xFF8B6F47)),
            const SizedBox(height: 20),
            Text('“$charName”\nnot found in the wizarding world', textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'Griffy', fontSize: 28, color: Color(0xFF5D4037))),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8B6F47), padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              child: const Text('Return to Search', style: TextStyle(fontFamily: 'Griffy', fontSize: 22, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}




