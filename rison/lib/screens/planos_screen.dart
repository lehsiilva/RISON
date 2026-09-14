import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class PlanosScreen extends StatelessWidget {
  const PlanosScreen({super.key});

  static const List<String> _beneficios = [
    'Conversas Ilimitadas',
    'Sugestões sempre que precisar!',
    'Sem Anúncios',
  ];

  void _tornarPremium(BuildContext context) {
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: AppColors.white),
                  ),
                  Text(
                    'Planos',
                    style: GoogleFonts.anticDidone(
                            decoration: TextDecoration.none,
                      fontSize: 20,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 36,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.boxGradient,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: AppColors.softShadow(),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'R I S ',
                              style: GoogleFonts.anticDidone(
                            decoration: TextDecoration.none,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                                letterSpacing: 2,
                              ),
                            ),
                            const Icon(
                              Icons.graphic_eq,
                              color: AppColors.purple,
                            ),
                            Text(
                              ' N',
                              style: GoogleFonts.anticDidone(
                            decoration: TextDecoration.none,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'PREMIUM',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: AppColors.black,
                            fontSize: 13,
                            letterSpacing: 3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 28),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _beneficios
                              .map(
                                (b) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '•  ',
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                                          color: AppColors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          b,
                                          style: const TextStyle(
                            decoration: TextDecoration.none,
                                            color: AppColors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 28),
                        const Text(
                          'APENAS',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: AppColors.black,
                            fontSize: 13,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          'R\$ 12,90',
                          style: GoogleFonts.anticDidone(
                            decoration: TextDecoration.none,
                            fontSize: 34,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () => _tornarPremium(context),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: AppColors.softShadow(opacity: 0.2),
                            ),
                            child: const Text(
                              'Seja premium!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                            decoration: TextDecoration.none,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}