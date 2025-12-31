import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class ClassDashboardScreen extends StatefulWidget {
  final String courseName;
  final String classCode;
  final String year;

  const ClassDashboardScreen({
    super.key,
    required this.courseName,
    required this.classCode,
    required this.year,
  });

  @override
  _ClassDashboardScreenState createState() => _ClassDashboardScreenState();
}

class _ClassDashboardScreenState extends State<ClassDashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header Section with Navbar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              decoration: const BoxDecoration(
                color: Color(0xFF8B0000), // Maroon red
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.year,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.courseName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.classCode,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Options Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = 0;
                        });
                        _tabController.animateTo(0);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              _selectedTabIndex == 0
                                  ? const Color(0xFF8B0000)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Materi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                _selectedTabIndex == 0
                                    ? Colors.white
                                    : Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = 1;
                        });
                        _tabController.animateTo(1);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              _selectedTabIndex == 1
                                  ? const Color(0xFF8B0000)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Tugas & Quis',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                _selectedTabIndex == 1
                                    ? Colors.white
                                    : Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content Area
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_buildMateriContent(), _buildTugasContent()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMateriContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Materi Pembelajaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Sample Materi Items
          _buildMateriItem(
            'Modul 1: Pengenalan Sistem Operasi',
            'Selasa, 15 Februari 2025',
          ),
          const SizedBox(height: 12),
          _buildMateriItem(
            'Modul 2: Arsitektur Sistem Operasi',
            'Kamis, 17 Februari 2025',
          ),
          const SizedBox(height: 12),
          _buildMateriItem(
            'Modul 3: Proses dan Thread',
            'Selasa, 22 Februari 2025',
          ),
          const SizedBox(height: 12),
          _buildMateriItem(
            'Modul 4: Manajemen Memori',
            'Kamis, 24 Februari 2025',
          ),
        ],
      ),
    );
  }

  Widget _buildMateriItem(String title, String date) {
    return GestureDetector(
      onTap: () {
        _showMaterialBottomSheet(context, title, date);
      },
      child: Container(
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
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF8B0000).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.check,
                color: Color(0xFF8B0000),
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildTugasContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tugas dan Quis',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Sample Tugas Items
          _buildTugasItem(
            'Tugas 1: Analisis Sistem Operasi',
            'Jumat, 26 Februari 2025',
            'Tugas',
            Colors.orange,
          ),
          const SizedBox(height: 12),
          _buildTugasItem(
            'Quis 1: Konsep Dasar SO',
            'Senin, 28 Februari 2025',
            'Quis',
            Colors.blue,
          ),
          const SizedBox(height: 12),
          _buildTugasItem(
            'Tugas 2: Implementasi Process',
            'Jumat, 4 Maret 2025',
            'Tugas',
            Colors.orange,
          ),
          const SizedBox(height: 12),
          _buildTugasItem(
            'Ujian Tengah Semester',
            'Senin, 7 Maret 2025',
            'UTS',
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildTugasItem(
    String title,
    String dueDate,
    String type,
    Color color,
  ) {
    final isQuiz = type.toLowerCase() == 'quis';

    return GestureDetector(
      onTap: () {
        if (isQuiz) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => QuizScreen(
                    quizTitle: title,
                    dueDate: dueDate,
                    classCode: widget.classCode,
                  ),
            ),
          );
        }
      },
      child: Container(
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
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF8B0000).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.check,
                color: Color(0xFF8B0000),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                type,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Batas Waktu: $dueDate',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void _showMaterialBottomSheet(
    BuildContext context,
    String title,
    String date,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Bottom Sheet Handle
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.close, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),

              // Description
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Konsep dasar User Interface Design akan dipelajari bagaimana\nmembangun sebuah Interaction Design pada antarmuka.\nInteraction ini sangat penting untuk aplikasi berkomunikasi dengan\npengguna. Lalu dipelajari juga poin-poin penting pada interaction\ndesign seperti visibility, feedback, limitation, consistency dan\naffordance. Dan terakhir materi conceptual dan perceptual design\ninteraction akan memberikan gambaran bagaimana bentuk dari\nInteraction.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Options Tabs
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // Switch to materi tab logic
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Lampiran Materi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8B0000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // Switch to tugas tab logic
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Tugas & Quis',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Content Area
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Materi Content
                      _buildMateriContentList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMateriContentList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Materi Pembelajaran',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),

        // Sample Materi Items
        _buildMateriContentItem(
          Icons.link,
          'Slide Presentasi User Interface Design',
          'Format: PDF | Size: 2.5 MB',
        ),
        const SizedBox(height: 12),
        _buildMateriContentItem(
          Icons.video_library,
          'Video Tutorial: Interaction Design Principles',
          'Duration: 15:30 | Format: MP4',
        ),
        const SizedBox(height: 12),
        _buildMateriContentItem(
          Icons.insert_drive_file,
          'Contoh Case Study Aplikasi Mobile',
          'Format: ZIP | Size: 5.2 MB',
        ),
        const SizedBox(height: 12),
        _buildMateriContentItem(
          Icons.link,
          'Referensi Artikel: UX Design Best Practices',
          'External Link | Reading Time: 10 min',
        ),

        const SizedBox(height: 24),

        const Text(
          'Tugas & Quis',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),

        // Sample Tugas Items
        _buildTugasContentItem(
          Icons.assignment,
          'Tugas 1: Analisis Interface Aplikasi',
          'Buatlah analisis interface dari 3 aplikasi mobile populer dan identifikasi prinsip UI/UX yang digunakan.',
        ),
        const SizedBox(height: 12),
        _buildTugasContentItem(
          Icons.quiz,
          'Quis 1: Konsep Dasar User Interface',
          'Test pemahaman tentang konsep dasar user interface design dan interaction principles.',
        ),
      ],
    );
  }

  Widget _buildMateriContentItem(IconData icon, String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF8B0000).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: const Color(0xFF8B0000), size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTugasContentItem(
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF8B0000).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: const Color(0xFF8B0000), size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
