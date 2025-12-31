import 'package:flutter/material.dart';
import 'quiz_review_screen.dart';

class QuizQuestionsScreen extends StatefulWidget {
  final String quizTitle;
  final String classCode;

  const QuizQuestionsScreen({
    super.key,
    required this.quizTitle,
    required this.classCode,
  });

  @override
  _QuizQuestionsScreenState createState() => _QuizQuestionsScreenState();
}

class _QuizQuestionsScreenState extends State<QuizQuestionsScreen> {
  int currentQuestionIndex = 0;
  int totalQuestions = 10;
  List<int> selectedAnswers = List.filled(10, -1);
  int timeRemaining = 15 * 60; // 15 minutes in seconds
  bool isTimerRunning = true;
  late int startTime;

  // Sample questions
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Radio button dapat digunakan untuk menentukan ?',
      'options': [
        'Pilihan tunggal yang mutually exclusive',
        'Pilihan ganda',
        'Input teks',
        'Upload file',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Apa fungsi utama dari sistem operasi?',
      'options': [
        'Mengelola hardware dan software',
        'Membuat program',
        'Mengedit gambar',
        'Menjalankan games',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Manakah yang bukan merupakan jenis sistem operasi?',
      'options': ['Windows', 'Linux', 'Photoshop', 'macOS'],
      'correctAnswer': 2,
    },
    {
      'question': 'Apa yang dimaksud dengan multitasking?',
      'options': [
        'Menjalankan beberapa program secara bersamaan',
        'Menggunakan beberapa monitor',
        'Membuat program yang besar',
        'Menginstall software',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Virtual memory berfungsi untuk?',
      'options': [
        'Memperluas kapasitas RAM',
        'Menghemat space hardisk',
        'Mempercepat processor',
        'Mengurangi konsumsi daya',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Manakah yang merupakan contoh file system?',
      'options': [
        'NTFS, FAT32, ext4',
        'HTTP, FTP, SMTP',
        'HTML, CSS, JavaScript',
        'MP3, JPG, PDF',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Proses boot pada komputer dimulai dari?',
      'options': [
        'BIOS/UEFI',
        'Windows Explorer',
        'Microsoft Office',
        'Web Browser',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Apa fungsi dari kernel dalam sistem operasi?',
      'options': [
        'Mengelola resource sistem',
        'Membuat tampilan GUI',
        'Menjalankan aplikasi',
        'Mengakses internet',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Deadlock terjadi ketika?',
      'options': [
        'Dua atau lebih proses saling menunggu',
        'Komputer terlalu panas',
        'Memory penuh',
        'Internet lambat',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Manakah yang bukan scheduling algorithm?',
      'options': [
        'FCFS, SJF, Round Robin',
        'Priority Scheduling',
        'Photo Editing',
        'Multilevel Queue',
      ],
      'correctAnswer': 2,
    },
  ];

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    _startTimer();
  }

  void _startTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted && isTimerRunning) {
        setState(() {
          if (timeRemaining > 0) {
            timeRemaining--;
          } else {
            _showTimeUpDialog();
          }
        });
      }
      return mounted && isTimerRunning && timeRemaining > 0;
    });
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text('Waktu Habis!'),
          content: const Text(
            'Waktu untuk mengerjakan kuis telah habis. Quiz akan otomatis disubmit.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _submitQuiz();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B0000),
              ),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _submitQuiz() {
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i]['correctAnswer']) {
        correctAnswers++;
      }
    }

    double score = (correctAnswers / questions.length) * 100;

    // Stop timer
    setState(() {
      isTimerRunning = false;
    });

    // Navigate to review screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:
            (context) => QuizReviewScreen(
              quizTitle: widget.quizTitle,
              classCode: widget.classCode,
              answers: List.from(selectedAnswers),
              questions: List.from(questions),
              startTime: startTime,
              endTime: DateTime.now().millisecondsSinceEpoch ~/ 1000,
              score: score,
            ),
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header with Timer
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              decoration: const BoxDecoration(
                color: Color(0xFF8B0000), // Maroon red
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.classCode,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.quizTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Quis',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.timer, color: Colors.white, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          _formatTime(timeRemaining),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Question Navigation (1-10 circles)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Progress Soal',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(totalQuestions, (index) {
                      bool isCompleted = selectedAnswers[index] != -1;
                      bool isCurrent = index == currentQuestionIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentQuestionIndex = index;
                          });
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color:
                                isCompleted
                                    ? Colors.green
                                    : isCurrent
                                    ? const Color(0xFF8B0000)
                                    : Colors.grey[300],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  isCurrent
                                      ? const Color(0xFF8B0000)
                                      : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color:
                                    isCompleted || isCurrent
                                        ? Colors.white
                                        : Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            // Question Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Number
                    Text(
                      'Soal Nomor ${currentQuestionIndex + 1} / $totalQuestions',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Question Text
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Text(
                        questions[currentQuestionIndex]['question'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Answer Options
                    Column(
                      children: List.generate(4, (index) {
                        String optionText = String.fromCharCode(
                          65 + index,
                        ); // A, B, C, D
                        bool isSelected =
                            selectedAnswers[currentQuestionIndex] == index;

                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAnswers[currentQuestionIndex] = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? const Color(
                                          0xFF8B0000,
                                        ).withOpacity(0.1)
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? const Color(0xFF8B0000)
                                          : Colors.grey[300]!,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            isSelected
                                                ? const Color(0xFF8B0000)
                                                : Colors.grey[400]!,
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(
                                      child:
                                          isSelected
                                              ? Container(
                                                width: 10,
                                                height: 10,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF8B0000),
                                                ),
                                              )
                                              : null,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    '$optionText. ${questions[currentQuestionIndex]['options'][index]}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight:
                                          isSelected
                                              ? FontWeight.w600
                                              : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),

            // Navigation Buttons
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border(top: BorderSide(color: Colors.grey[200]!)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous Button
                  if (currentQuestionIndex > 0)
                    SizedBox(
                      width: 120,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            currentQuestionIndex--;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF8B0000),
                          side: const BorderSide(color: Color(0xFF8B0000)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Sebelumnya'),
                      ),
                    )
                  else
                    const SizedBox(width: 120),

                  // Next/Finish Button
                  SizedBox(
                    width: 120,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentQuestionIndex < totalQuestions - 1) {
                          setState(() {
                            currentQuestionIndex++;
                          });
                        } else {
                          // Last question - show submit confirmation
                          _showSubmitConfirmation();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B0000),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        currentQuestionIndex < totalQuestions - 1
                            ? 'Selanjutnya'
                            : 'Selesai',
                      ),
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

  void _showSubmitConfirmation() {
    int unanswered = selectedAnswers.where((answer) => answer == -1).length;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text('Submit Quiz'),
          content: Text(
            unanswered > 0
                ? 'Anda masih memiliki $unanswered soal yang belum dijawab. Yakin ingin submit?'
                : 'Apakah Anda yakin ingin submit quiz ini?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _submitQuiz();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B0000),
              ),
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    isTimerRunning = false;
    super.dispose();
  }
}
