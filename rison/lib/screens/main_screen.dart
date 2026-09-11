import 'package:flutter/material.dart';
import 'package:rison/screens/favoritos_screen.dart';
import 'package:rison/screens/listaMusica_screen.dart';
import 'package:rison/screens/perfil_screen.dart';
import 'package:rison/theme/app_colors.dart';
import 'package:rison/widgets/app_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Placeholder(), //home
    ListaMusicaScreen(),
    FavoritosScreen(), //favoritos
    PerfilScreen(), //perfil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black, 
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}