import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _moodController = TextEditingController();
  bool _isListening = false;

  @override
  void dispose() {
    _moodController.dispose();
    super.dispose();
  }

  void _toggleListening() {
    setState(() {
      _isListening = !_isListening;
    });
  }

  void _enviarMood() {
  }

  void _abrirShake() {
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                "What's your mood today ?",
                textAlign: TextAlign.center,
                style: GoogleFonts.anticDidone(
                  fontSize: 22,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.purple.withOpacity(0.55),
                      blurRadius: 24,
                      spreadRadius: 2,
                      offset: const Offset(0, 6),
                    ),
                    BoxShadow(
                      color: AppColors.gray.withOpacity(0.35),
                      blurRadius: 24,
                      spreadRadius: -4,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: _moodController,
                      maxLines: 4,
                      style: const TextStyle(color: AppColors.black),
                      decoration: const InputDecoration(
                        hintText: 'Estou feliz, toque uma música animada...',
                        hintStyle: TextStyle(color: Colors.black45),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isCollapsed: true,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: _enviarMood,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppColors.buttonGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Enviar',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: _toggleListening,
                child: Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    boxShadow: AppColors.softShadow(opacity: 0.5),
                  ),
                  child: Icon(
                    Icons.mic,
                    size: 34,
                    color: _isListening
                        ? AppColors.lightPurple
                        : AppColors.black,
                  ),
                ),
              ),
              if (_isListening) ...[
                const SizedBox(height: 20),
                SizedBox(
                  height: 90,
                  child: _VoiceWaveform(),
                ),
              ],
              const Spacer(),
              GestureDetector(
                onTap: _abrirShake,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: AppColors.softShadow(),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.buttonGradient,
                        ),
                        child: const Icon(
                          Icons.vibration,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Shake to RISON ',
                                  style: GoogleFonts.anticDidone(
                                    color: AppColors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                const Icon(
                                  Icons.auto_awesome,
                                  color: AppColors.lightPurple,
                                  size: 14,
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Chacoalhe seu celular para descobrir uma música!',
                              style: TextStyle(
                                color: AppColors.gray,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _VoiceWaveform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bars = List.generate(40, (i) => (i * 37) % 60 + 10.0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: bars
          .map(
            (h) => Container(
              width: 3,
              height: h,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          )
          .toList(),
    );
  }
}