import 'package:flutter/material.dart';
import 'pengumuman_detail_screen.dart';

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
                    _buildAnnouncementList(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementList(BuildContext context) {
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
          context,
          'Pembukaan Kuliah Semester Genap 2024/2025',
          'By Admin Celoe - Senin, 2 Januari 2025, 08:00',
          'Diinformasikan kepada seluruh mahasiswa bahwa kuliah semester genap 2024/2025 akan dimulai pada tanggal 15 Februari 2025. Mohon untuk mempersiapkan diri dan melengkapi administrasi sebelum tanggal tersebut.',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          context,
          'Perubahan Jadwal Ujian Tengah Semester',
          'By Admin Celoe - Jumat, 15 Maret 2025, 14:30',
          'Sehubungan dengan adanya bencana alam di wilayah Jawa Barat, maka jadwal ujian tengah semester untuk mata kuliah yang berada di wilayah tersebut akan dijadwalkan ulang. Detail jadwal akan diinformasikan lebih lanjut.',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          context,
          'Pendaftaran Kartu Rencana Studi (KRS)',
          'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
          'Diinformasikan kepada seluruh pengguna LMS, kami\ndari tim CeLOE akan melakukan maintenance pada tanggal 12\nJuni 2021, untuk meningkatkan layanan server dalam mengh-\nadapi ujian akhir semester (UAS).\n\nDengan adanya kegiatan maintenance tersebut maka\nsitus LMS (Ims.telkomuniversity.ac.id) tidak dapat diakses\nmulai pukul 00.00 s/d 06.00 WIB.\n\nDemikian informasi ini kami sampaikan, mohon maaf\natasketidaknyamanannya.\n\nHormat Kami,\nCeLOE Telkom University',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          context,
          'Pembayaran UKT Semester Genap',
          'By Admin Celoe - Selasa, 15 Agustus 2025, 09:15',
          'Pemberitahuan untuk seluruh mahasiswa bahwa pembayaran UKT (Uang Kuliah Tunggal) untuk semester genap 2024/2025 sudah dapat dilakukan. Mohon untuk melakukan pembayaran sesuai dengan ketentuan yang berlaku.',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          context,
          'Wisuda Periode April 2025',
          'By Admin Celoe - Kamis, 20 Februari 2025, 16:20',
          'Pendaftaran wisuda periode April 2025 sudah dibuka. Bagi mahasiswa yang sudah memenuhi persyaratan akademik, dapat mendaftar melalui portal mahasiswa dengan melengkapi dokumen yang diperlukan.',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          context,
          'Lowongan Magang Perusahaan Teknologi',
          'By Admin Celoe - Senin, 10 Maret 2025, 11:00',
          'Tim Career Center mengundang seluruh mahasiswa untuk mengikuti program magang di berbagai perusahaan teknologi terkemuka. Pendaftaran dibuka hingga tanggal 30 Maret 2025.',
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem(
          context,
          'Workshop Pengembangan Karir',
          'By Admin Celoe - Sabtu, 25 Januari 2025, 13:45',
          'Workshop pengembangan karir akan dilaksanakan pada tanggal 10 April 2025. Workshop ini akan membahas tentang skills yang diperlukan di era digital dan strategi mencari kerja di perusahaan teknologi.',
        ),
      ],
    );
  }

  Widget _buildAnnouncementItem(BuildContext context, String title, String authorAndDate, String content) {
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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PengumumanDetailScreen(
                title: title,
                authorAndDate: authorAndDate,
                content: content,
              ),
            ),
          );
        },
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
      ),
    );
  }
}
