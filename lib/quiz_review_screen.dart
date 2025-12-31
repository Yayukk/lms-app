import 'package:flutter/material.dart';
import 'quiz_question_detail_screen.dart';

class QuizReviewScreen extends StatefulWidget {
  final String quizTitle;
  final String classCode;
  final List<int> answers;
  final List<Map<String, dynamic>> questions;
  final int startTime;
  final int endTime;
  final double score;

  const QuizReviewScreen({
    super.key,
    required this.quizTitle,
    required this.classCode,
    required this.answers,
    required this.questions,
    required this.startTime,
    required this.endTime,
    required this.score,
  });

  @override
  _QuizReviewScreenState createState() => _QuizReviewScreenState();
}

class _QuizReviewScreenState extends State<QuizReviewScreen> {
  @override
  Widget build(BuildContext context) {
    // Calculate completion time
    int completionTimeInSeconds = widget.endTime - widget.startTime;
    int minutes = completionTimeInSeconds ~/ 60;
    int seconds = completionTimeInSeconds % 60;
    String completionTime = '${minutes}m ${seconds}s';

    // Format timestamps manually
    DateTime startDateTime = DateTime.fromMillisecondsSinceEpoch(
      widget.startTime * 1000,
    );
    DateTime endDateTime = DateTime.fromMillisecondsSinceEpoch(
      widget.endTime * 1000,
    );

    String formatDateTime(DateTime dateTime) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      return '${twoDigits(dateTime.day)}/${twoDigits(dateTime.month)}/${dateTime.year} ${twoDigits(dateTime.hour)}:${twoDigits(dateTime.minute)}';
    }

    String startTimeFormatted = formatDateTime(startDateTime);
    String endTimeFormatted = formatDateTime(endDateTime);

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
                        const Text(
                          'Review Kuis',
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

            // Content Section
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quiz Summary
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ringkasan Kuis',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),

                          _buildSummaryRow('Dimulai pada:', startTimeFormatted),
                          const SizedBox(height: 8),
                          _buildSummaryRow('Status:', 'Selesai'),
                          const SizedBox(height: 8),
                          _buildSummaryRow('Selesai pada:', endTimeFormatted),
                          const SizedBox(height: 8),
                          _buildSummaryRow(
                            'Waktu penyelesaian:',
                            completionTime,
                          ),
                          const SizedBox(height: 8),
                          _buildSummaryRow(
                            'Nilai:',
                            '${widget.score.toStringAsFixed(1)}/100',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Questions Review
                    const Text(
                      'Review Jawaban',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Questions List
                    Column(
                      children: List.generate(widget.questions.length, (index) {
                        int userAnswer = widget.answers[index];
                        int correctAnswer =
                            widget.questions[index]['correctAnswer'];
                        bool isCorrect = userAnswer == correctAnswer;
                        String answerText =
                            userAnswer >= 0
                                ? '${String.fromCharCode(65 + userAnswer)}. ${widget.questions[index]['options'][userAnswer]}'
                                : 'Tidak dijawab';

                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isCorrect ? Colors.green : Colors.red,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Question Header
                              Row(
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color:
                                          isCorrect ? Colors.green : Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      isCorrect ? Icons.check : Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Pertanyaan ${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              // Question Text
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  widget.questions[index]['question'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),

                              // User Answer
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color:
                                      isCorrect
                                          ? Colors.green.withOpacity(0.1)
                                          : Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color:
                                        isCorrect ? Colors.green : Colors.red,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jawaban tersimpan',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      answerText,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            isCorrect
                                                ? Colors.green[700]
                                                : Colors.red[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Correct Answer (if wrong)
                              if (!isCorrect) ...[
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.green),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jawaban benar',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green[700],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${String.fromCharCode(65 + correctAnswer)}. ${widget.questions[index]['options'][correctAnswer]}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],

                              // View Question Link
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => QuizQuestionDetailScreen(
                                            quizTitle: widget.quizTitle,
                                            classCode: widget.classCode,
                                            question: widget.questions[index],
                                            questionIndex: index,
                                            totalQuestions:
                                                widget.questions.length,
                                            userAnswer: userAnswer,
                                            showCorrectAnswer: true,
                                          ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Lihat Soal',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: const Color(0xFF8B0000),
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 32),

                    // Action Buttons
                    Column(
                      children: [
                        // Back to Class Button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pop(); // Back to quiz screen
                              Navigator.of(
                                context,
                              ).pop(); // Back to class dashboard
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8B0000),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Kembali ke Kelas',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
