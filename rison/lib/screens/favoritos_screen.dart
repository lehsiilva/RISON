import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rison/widgets/primary_button.dart';

class MusicaFavorita {
  final String titulo;
  final String artista;
  final String imagem;
  final String duracao;

  const MusicaFavorita({
    required this.titulo,
    required this.artista,
    required this.imagem,
    required this.duracao,
  });
}

class FavoritosScreen extends StatefulWidget {
  const FavoritosScreen({super.key});

  @override
  State<FavoritosScreen> createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  final List<MusicaFavorita> _favoritas = List.generate(
    3,
    (index) => const MusicaFavorita(
      titulo: 'Ouro de Tolo',
      artista: 'Marina sena',
      imagem: 'assets/images/capaPadrao.png',
      duracao: '3:45',
    ),
  );

  void _removerFavorita(int index) {
    setState(() {
      _favoritas.removeAt(index);
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
                  child: _favoritas.isEmpty
                      ? Center(
                          child: Text(
                            'Você ainda não tem músicas favoritas',
                            style: TextStyle(
                              color: AppColors.gray,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: _favoritas.length,
                          separatorBuilder: (context, index) => const Divider(
                            color: AppColors.white,
                            thickness: 1,
                          ),
                          itemBuilder: (context, index) {
                            final musica = _favoritas[index];
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
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    musica.duracao,
                                    style: const TextStyle(color: AppColors.white),
                                  ),
                                  const SizedBox(height: 4),
                                  GestureDetector(
                                    onTap: () => _removerFavorita(index),
                                    child: const Icon(
                                      Icons.favorite,
                                      color: AppColors.lightPurple,
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
          'Suas músicas ',
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
            'Favoritas!',
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