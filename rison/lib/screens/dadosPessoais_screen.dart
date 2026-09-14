import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class DadosPessoaisScreen extends StatefulWidget {
  final String nome;
  final String dataNascimento;
  final String email;
  final String? fotoUrl;

  const DadosPessoaisScreen({
    super.key,
    this.nome = 'Letícia Lopes',
    this.dataNascimento = '10/01/2006',
    this.email = 'leticia@gmail.com',
    this.fotoUrl,
  });

  @override
  State<DadosPessoaisScreen> createState() => _DadosPessoaisScreenState();
}

class _DadosPessoaisScreenState extends State<DadosPessoaisScreen> {
  bool _editando = false;

  late final TextEditingController _nomeController =
      TextEditingController(text: widget.nome);
  late final TextEditingController _dataController =
      TextEditingController(text: widget.dataNascimento);
  late final TextEditingController _emailController =
      TextEditingController(text: widget.email);
  final TextEditingController _senhaController =
      TextEditingController(text: '12345678');

  @override
  void dispose() {
    _nomeController.dispose();
    _dataController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _alternarEdicao() {
    setState(() {
      _editando = !_editando;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.backgroundGradient,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                    ),
                  ),
                  const Icon(
                    Icons.notifications_none,
                    color: AppColors.white,
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: AppColors.gray,
                    backgroundImage: widget.fotoUrl != null
                        ? NetworkImage(widget.fotoUrl!)
                        : null,
                    child: widget.fotoUrl == null
                        ? const Icon(
                            Icons.person,
                            size: 36,
                            color: AppColors.white,
                          )
                        : null,
                  ),

                  const SizedBox(width: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nome,
                        style: GoogleFonts.anticDidone(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gray.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Plano Free',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  const Icon(Icons.menu, color: AppColors.white),
                  const SizedBox(width: 8),
                  Text(
                    'Dados Pessoais',
                    style: GoogleFonts.anticDidone(
                      fontSize: 18,
                      color: AppColors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: AppColors.boxGradient,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: AppColors.softShadow(),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CampoDado(
                      label: 'Nome',
                      controller: _nomeController,
                      editando: _editando,
                    ),

                    const SizedBox(height: 18),

                    _CampoDado(
                      label: 'Data de Nascimento',
                      controller: _dataController,
                      editando: _editando,
                    ),

                    const SizedBox(height: 18),

                    _CampoDado(
                      label: 'E-mail',
                      controller: _emailController,
                      editando: _editando,
                    ),

                    const SizedBox(height: 18),

                    _CampoDado(
                      label: 'Senha',
                      controller: _senhaController,
                      editando: _editando,
                      obscure: true,
                    ),

                    const SizedBox(height: 24),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform.scale(
                        scale: 0.75,
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: _alternarEdicao,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),

                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              _editando ? 'Salvar' : 'Editar',
                              style: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
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

class _CampoDado extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool editando;
  final bool obscure;

  const _CampoDado({
    required this.label,
    required this.controller,
    required this.editando,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!editando) {
      return Text(
        '$label: ${obscure ? '•' * controller.text.length : controller.text}',
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 15,
          decoration: TextDecoration.none,
        ),
      );
    }

    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
          ),
        ),

        Expanded(
          child: TextField(
            controller: controller,
            obscureText: obscure,
            cursorColor: AppColors.black,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 15,
              decoration: TextDecoration.none,
            ),
            decoration: const InputDecoration(
              isDense: true,
              isCollapsed: true,

              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,

              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}