import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/curved_background.dart';
import '../widgets/gradient_field.dart';
import '../widgets/primary_button.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _handleCadastro() {
    final nome = _nomeController.text.trim();
    final email = _emailController.text.trim();
    debugPrint('cadastro: $nome / $email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Stack(
            children: [
              const Positioned.fill(
                child: CustomPaint(painter: ArcLinesPainter()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Crie sua conta',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anticDidone(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Leva menos de um minuto',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.08),
                        border: Border.all(color: Colors.white24, width: 1.2),
                      ),
                      child: const Icon(
                        Icons.person_add_alt_outlined,
                        size: 42,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 32),
                    GradientTextField(
                      controller: _nomeController,
                      hintText: 'Nome',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 16),
                    GradientTextField(
                      controller: _emailController,
                      hintText: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.mail_outline,
                    ),
                    const SizedBox(height: 16),
                    GradientTextField(
                      controller: _senhaController,
                      hintText: 'Senha',
                      obscureText: true,
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(height: 28),
                    PrimaryButton(
                      label: 'Cadastrar',
                      onPressed: _handleCadastro,
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 13,
                          ),
                          children: const [
                            TextSpan(text: 'Já tem conta? '),
                            TextSpan(
                              text: 'Entrar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
