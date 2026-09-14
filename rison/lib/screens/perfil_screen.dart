import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'historico_screen.dart';
import 'login_screen.dart'; 
import 'dadosPessoais_screen.dart';
import 'planos_screen.dart';

class OpcaoPerfil {
  final IconData icone;
  final String titulo;
  final VoidCallback onTap;

  const OpcaoPerfil({
    required this.icone,
    required this.titulo,
    required this.onTap,
  });
}

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  String? _fotoUrl;

  void _escolherFoto() {}

  void _irParaHistorico() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HistoricoScreen()),
    );
  }
  void _irParaLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
  void _irParaDadosPessoais() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DadosPessoaisScreen()),
    );
  }
  void _irParaPlanos() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PlanosScreen()),
    );
  }

  late final List<OpcaoPerfil> _opcoes = [
    OpcaoPerfil(
      icone: Icons.person_outline,
      titulo: 'Dados Pessoais',
      onTap: _irParaDadosPessoais,
    ),
    OpcaoPerfil(
      icone: Icons.history,
      titulo: 'Histórico',
      onTap: _irParaHistorico,
    ),
    OpcaoPerfil(
      icone: Icons.workspace_premium_outlined,
      titulo: 'Planos',
      onTap: _irParaPlanos,
    ),
    OpcaoPerfil(
      icone: Icons.logout,
      titulo: 'Sair',
      onTap: _irParaLogin //() {
        // lógica de logout
      //},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    GestureDetector(
                      onTap: _escolherFoto,
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: AppColors.gray,
                        backgroundImage: _fotoUrl != null ? NetworkImage(_fotoUrl!) : null,
                        child: _fotoUrl == null
                            ? const Icon(Icons.person, size: 36, color: AppColors.white)
                            : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Marina Sena',
                          style: GoogleFonts.anticDidone(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.gray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Plano Free',
                            style: TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.separated(
                    itemCount: _opcoes.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.white,
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      final opcao = _opcoes[index];
                      return _OpcaoItem(opcao: opcao);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OpcaoItem extends StatefulWidget {
  final OpcaoPerfil opcao;

  const _OpcaoItem({required this.opcao});

  @override
  State<_OpcaoItem> createState() => _OpcaoItemState();
}

class _OpcaoItemState extends State<_OpcaoItem> {
  bool _pressionado = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressionado = true),
      onTapUp: (_) => setState(() => _pressionado = false),
      onTapCancel: () => setState(() => _pressionado = false),
      onTap: widget.opcao.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          gradient: _pressionado ? AppColors.buttonGradient : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(widget.opcao.icone, color: AppColors.white),
          title: Text(
            widget.opcao.titulo,
            style: const TextStyle(color: AppColors.white),
          ),
          trailing: const Icon(Icons.chevron_right, color: AppColors.gray),
        ),
      ),
    );
  }
}