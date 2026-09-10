import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Classe que representa cada música
class Musica {
  final String titulo;
  final String artista;
  final String imagem;
  final String duracao;

  const Musica({
    required this.titulo,
    required this.artista,
    required this.imagem,
    required this.duracao,
  });
}

class SongsList extends StatelessWidget {
  const SongsList({super.key});

  // Lista de músicas (depois você pode trocar por dados de API/banco)
  final List<Musica> musicas = const [
    Musica(
      titulo: 'Lua Cheia',
      artista: 'Marina Sena',
      imagem: 'assets/images/capaPadrao.png',
      duracao: '3:45',
    ),
    Musica(
      titulo: 'Desmistificar',
      artista: 'Marina Sena',
      imagem: 'assets/images/capaPadrao.png',
      duracao: '4:12',
    ),
    Musica(
      titulo: 'Sem Lei',
      artista: 'Marina Sena',
      imagem: 'assets/images/capaPadrao.png',
      duracao: '3:30',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4C338F), //ROXO
              Color(0xFF000000), //PRETO
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
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
                  // a lista ocupa o espaço restante da tela
                  child: ListView.separated(
                    itemCount: musicas.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.white24, // linha branca bem transparente
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      final musica = musicas[index];
                      return ListTile(
                        leading: Image.asset(
                          musica.imagem,
                          width: 70,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          musica.titulo,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          musica.artista,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        trailing: Text(
                          musica.duracao,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        onTap: () {
                          // ação ao tocar na música (ex: tocar áudio)
                        },
                      );
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

  Widget buildTitulo() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.anticDidone(
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ),
        children: [
          const TextSpan(
            text: 'Músicas que expressam sua ',
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: 'Vibe!',
            style: TextStyle(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [
                    Color(0xFFBC41FF), // ROXO CLARO
                    Color(0xFFFFF1F1), // ROSA CLARO
                  ],
                ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
            ),
          ),
        ],
      ),
    );
  }
}
