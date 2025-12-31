import 'package:flutter/material.dart';

class NotifScreen extends StatelessWidget {
  const NotifScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.notifications, size: 80, color: Color(0xFF8B0000)),
              SizedBox(height: 16),
              Text(
                'Ini Halaman Notifikasi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8B0000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
