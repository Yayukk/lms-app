import 'package:flutter/material.dart';

class NotifScreen extends StatelessWidget {
  const NotifScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              decoration: const BoxDecoration(
                color: Color(0xFF8B0000), // Maroon red
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'NOTIFIKASI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Content Section
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Notifikasi List Section
                    _buildNotificationList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notifikasi Terbaru',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),

        // Notification Items
        _buildNotificationItem(
          'Pengumpulan Tugas',
          'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
          '2 jam yang lalu',
        ),
        const SizedBox(height: 12),
        _buildNotificationItem(
          'Nilai Tugas Released',
          'Nilai untuk Tugas 1 - Analisis Kebutuhan Pengguna telah tersedia dan dapat dilihat di sistem.',
          '5 jam yang lalu',
        ),
        const SizedBox(height: 12),
        _buildNotificationItem(
          'Jadwal Kuliah Perubahan',
          'Kuliah Sistem Operasi hari Kamis diganti menjadi online melalui platform Zoom.',
          '1 hari yang lalu',
        ),
        const SizedBox(height: 12),
        _buildNotificationItem(
          'Diskusi Kelas',
          'Pembukaan forum diskusi untuk mata kuliah Pemrograman Bergawai akan dimulai besok.',
          '2 hari yang lalu',
        ),
        const SizedBox(height: 12),
        _buildNotificationItem(
          'Reminder Tugas',
          'Ingat untuk mengumpulkan Tugas 2 - Desain Antarmuka sebelum deadline besok malam.',
          '3 hari yang lalu',
        ),
      ],
    );
  }

  Widget _buildNotificationItem(String title, String description, String time) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side - Notification content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 11,
                    color: const Color(0xFF8B0000),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Right side - Book icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF8B0000).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.book, color: Color(0xFF8B0000), size: 20),
          ),
        ],
      ),
    );
  }
}
