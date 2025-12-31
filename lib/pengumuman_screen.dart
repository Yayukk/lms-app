import 'package:flutter/material.dart';

class PengumumanScreen extends StatelessWidget {
  const PengumumanScreen({super.key});

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
                    'PENGUMUMAN',
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
                    // Pengumuman List Section
                    _buildAnnouncementList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Daftar Pengumuman',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),

        // Announcement Items
        _buildAnnouncementItem(
          'Pembukaan Kuliah Semester Genap 2024/2025',
          'By Admin Celoe - Senin, 2 Januari 2025, 08:00',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          'Perubahan Jadwal Ujian Tengah Semester',
          'By Admin Celoe - Jumat, 15 Maret 2025, 14:30',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          'Pendaftaran Kartu Rencana Studi (KRS)',
          'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          'Pembayaran UKT Semester Genap',
          'By Admin Celoe - Selasa, 15 Agustus 2025, 09:15',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          'Wisuda Periode April 2025',
          'By Admin Celoe - Kamis, 20 Februari 2025, 16:20',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          'Lowongan Magang Perusahaan Teknologi',
          'By Admin Celoe - Senin, 10 Maret 2025, 11:00',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          'Workshop Pengembangan Karir',
          'By Admin Celoe - Sabtu, 25 Januari 2025, 13:45',
        ),
      ],
    );
  }

  Widget _buildAnnouncementItem(String title, String authorAndDate) {
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
          // Left side - Speaker icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF8B0000).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.volume_up,
              color: Color(0xFF8B0000),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),

          // Right side - Title and author/date
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
                const SizedBox(height: 8),
                Text(
                  authorAndDate,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    height: 1.4,
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
