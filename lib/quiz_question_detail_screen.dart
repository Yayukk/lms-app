import 'package:flutter/material.dart';

class QuizQuestionDetailScreen extends StatefulWidget {
  final String quizTitle;
  final String classCode;
  final Map<String, dynamic> question;
  final int questionIndex;
  final int totalQuestions;
  final int userAnswer;
  final bool showCorrectAnswer;

  const QuizQuestionDetailScreen({
    super.key,
    required this.quizTitle,
    required this.classCode,
    required this.question,
    required this.questionIndex,
    required this.totalQuestions,
    required this.userAnswer,
    required this.showCorrectAnswer,
  });

  @override
  _QuizQuestionDetailScreenState createState() => _QuizQuestionDetailScreenState();
}

class _QuizQuestionDetailScreenState extends State<QuizQuestionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    int correctAnswer = widget.question['correctAnswer'];
    bool isCorrect = widget.userAnswer == correctAnswer;
    String userAnswerText = widget.userAnswer >= 0
        ? '${String.fromCharCode(65 + widget.userAnswer)}. ${widget.question['options'][widget.userAnswer]}'
        : 'Tidak dijawab';

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
                        Text(
                          'Detail Soal',
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Header
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: isCorrect ? Colors.green : Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isCorrect ? Icons.check : Icons.close,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Soal Nomor ${widget.questionIndex + 1} dari ${widget.totalQuestions}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                isCorrect ? 'Benar' : 'Salah',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isCorrect ? Colors.green[700] : Colors.red[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Question Text
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Text(
                        widget.question['question'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Answer Options
                    const Text(
                      'Pilihan Jawaban',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Column(
                      children: List.generate(4, (index) {
                        String optionText = String.fromCharCode(65 + index); // A, B, C, D
                        bool isUserAnswer = widget.userAnswer == index;
                        bool isCorrectAnswer = correctAnswer == index;
                        bool showHighlight = widget.showCorrectAnswer || isUserAnswer;

                        Color borderColor;
                        Color backgroundColor;
                        Color textColor;

                        if (showHighlight) {
                          if (isCorrectAnswer) {
                            borderColor = Colors.green;
                            backgroundColor = Colors.green.withOpacity(0.1);
                            textColor = Colors.green[700]!;
                          } else if (isUserAnswer && !isCorrectAnswer) {
                            borderColor = Colors.red;
                            backgroundColor = Colors.red.withOpacity(0.1);
                            textColor = Colors.red[700]!;
                          } else {
                            borderColor = Colors.grey[300]!;
                            backgroundColor = Colors.grey[50]!;
                            textColor = Colors.black87;
                          }
                        } else {
                          borderColor = Colors.grey[300]!;
                          backgroundColor = Colors.white;
                          textColor = Colors.black87;
                        }

                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: borderColor,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: borderColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: isCorrectAnswer
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.green,
                                            size: 14,
                                          )
                                        : isUserAnswer && !isCorrectAnswer
                                            ? Icon(
                                                Icons.close,
                                                color: Colors.red,
                                                size: 14,
                                              )
                                            : null,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    '$optionText. ${widget.question['options'][index]}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: textColor,
                                      fontWeight: showHighlight
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 32),

                    // Answer Summary
                    if (widget.showCorrectAnswer) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.blue.withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jawaban Benar:',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[700],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${String.fromCharCode(65 + correctAnswer)}. ${widget.question['options'][correctAnswer]}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // User Answer Summary
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isCorrect 
                            ? Colors.green.withOpacity(0.1)
                            : Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isCorrect ? Colors.green : Colors.red,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jawaban Anda:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isCorrect ? Colors.green[700] : Colors.red[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            userAnswerText,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isCorrect ? Colors.green[700] : Colors.red[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            isCorrect ? 'Jawaban Anda benar!' : 'Jawaban Anda salah.',
                            style: TextStyle(
                              fontSize: 12,
                              color: isCorrect ? Colors.green[600] : Colors.red[600],
                            ),
                          ),
                        ],
                      ),
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
}