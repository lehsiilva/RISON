import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rison/widgets/primary_button.dart';

class Musica {
  final String titulo;
  final String artista;
  final String imagem;
  final String duracao;
  bool favorita;

  Musica({
    required this.titulo,
    required this.artista,
    required this.imagem,
    required this.duracao,
    this.favorita = false,
  });
}

class ListaMusicaScreen extends StatefulWidget {
  const ListaMusicaScreen({super.key});

  @override
  State<ListaMusicaScreen> createState() => _ListaMusicaScreenState();
}

class _ListaMusicaScreenState extends State<ListaMusicaScreen> {
  final List<Musica> _mock = List.generate(
    5,
    (index) => Musica(
      titulo: 'Ouro de Tolo',
      artista: 'Marina sena',
      imagem: 'assets/images/capaPadrao.png',
      duracao: '3:45',
    ),
  );

  void _toggleFavorita(int index) {
    setState(() {
      _mock[index].favorita = !_mock[index].favorita;
    });
  }

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 2),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.80,
                      child: Image.asset(
                        'assets/images/onda_sonora.png',
                        width: 400,
                      ),
                    ),
                    buildTitulo(),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: _mock.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.white,
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      final musica = _mock[index];
                      return ListTile(
                        leading: Image.asset(
                          musica.imagem,
                          width: 70,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          musica.titulo,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          musica.artista,
                          style: const TextStyle(color: AppColors.white),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min, // ocupa só o espaço necessário
                          children: [
                            Text(
                              musica.duracao,
                              style: const TextStyle(color: AppColors.white),
                            ),
                            const SizedBox(height: 4), // espaço entre duração e coração
                            GestureDetector(
                              onTap: () => _toggleFavorita(index),
                              child: Icon(
                                musica.favorita
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: musica.favorita
                                    ? AppColors.lightPurple
                                    : AppColors.gray,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  label: 'Ouvir Agora',
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitulo() {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text(
          'Músicas que expressam sua ',
          style: GoogleFonts.anticDidone(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: AppColors.white,
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => AppColors.boxGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            'Vibe!',
            style: GoogleFonts.anticDidone(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}