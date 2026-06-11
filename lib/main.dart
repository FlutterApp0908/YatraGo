import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:vidhi_portfolio/screens/splash_screen.dart';

import 'app_colors.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/experience_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const VidhiPortfolioApp());
}

class VidhiPortfolioApp extends StatelessWidget {
  const VidhiPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vidhi Mochi – Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(primary: AppColors.primary),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late CircularBottomNavigationController _navController;

  @override
  void initState() {
    super.initState();
    _navController = CircularBottomNavigationController(_currentIndex);

    // Listen to controller changes
    _navController.addListener(() {
      if (_navController.value != null) {
        setState(() => _currentIndex = _navController.value!);
      }
    });
  }

  @override
  void dispose() {
    _navController.dispose();
    super.dispose();
  }

  void _navigateTo(int index) {
    setState(() => _currentIndex = index);
    _navController.value = index;
  }

  late final List<Widget> _pages = [
    HomeScreen(onNavigate: _navigateTo),
    const AboutScreen(),
    const ProjectsScreen(),
    const SkillsScreen(),
    const ExperienceScreen(),
    const ContactScreen(),
  ];

  final List<TabItem> _tabItems = [
    TabItem(
      Icons.home_rounded,
      "Home",
      AppColors.primary,
      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
    ),
    TabItem(
      Icons.person_rounded,
      "About",
      const Color(0xFFFF6584),
      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
    ),
    TabItem(
      Icons.work_rounded,
      "Projects",
      const Color(0xFF43E97B),
      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
    ),
    TabItem(
      Icons.code_rounded,
      "Skills",
      const Color(0xFFFFB347),
      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
    ),
    TabItem(
      Icons.timeline_rounded,
      "Exp",
      const Color(0xFF56CCF2),
      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
    ),
    TabItem(
      Icons.mail_rounded,
      "Contact",
      const Color(0xFFDA77FF),
      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: CircularBottomNavigation(
          _tabItems,
          controller: _navController,
          selectedPos: _currentIndex,
          barHeight: 60,
          barBackgroundColor: AppColors.surface,
          circleSize: 52,
          circleStrokeWidth: 2,
          iconsSize: 24,
          normalIconColor: AppColors.textMuted,
          animationDuration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
