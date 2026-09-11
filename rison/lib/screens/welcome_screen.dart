import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/primary_button.dart';
import 'login_screen.dart';
import 'cadastro_screen.dart';

/// Primeira tela do app: logo + tagline, com as duas ações
/// que levam para login ou cadastro.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 3),
              // Logo: ícone com onda de som dentro de um "O", como no mockup
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.buttonGradient,
                      boxShadow: AppColors.softShadow(opacity: 0.5),
                    ),
                  ),
                  const Icon(
                    Icons.graphic_eq_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'RISON',
                style: GoogleFonts.anticDidone(
                  fontSize: 34,
                  letterSpacing: 6,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The sound of your moment.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.75),
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(flex: 4),
              PrimaryButton(
                label: 'Entrar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
              ),
              const SizedBox(height: 14),
              PrimaryButton(
                label: 'Criar conta',
                filled: false,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CadastroScreen()),
                  );
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
