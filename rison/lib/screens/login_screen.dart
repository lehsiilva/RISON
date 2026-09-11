import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/curved_background.dart';
import '../widgets/gradient_field.dart';
import '../widgets/primary_button.dart';
import 'cadastro_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // TODO: integrar com a lógica/backend de autenticação do time
    final email = _emailController.text.trim();
    final senha = _senhaController.text;
    debugPrint('login: $email / senha com ${senha.length} caracteres');
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
                      'Bem-vindo de volta',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anticDidone(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Faça login para continuar',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.08),
                        border: Border.all(color: Colors.white24, width: 1.2),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 48,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 40),
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: fluxo de recuperação de senha
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 36),
                        ),
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(label: 'Entrar', onPressed: _handleLogin),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CadastroScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 13,
                          ),
                          children: const [
                            TextSpan(text: 'Não tem conta? '),
                            TextSpan(
                              text: 'Cadastre-se',
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
