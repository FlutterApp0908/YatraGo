import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';
import '../app_data.dart';
import '../widgets/common_widgets.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  // Skill levels — update as needed
  static const Map<String, int> _levels = {
    "Flutter": 80,
    "Dart": 85,
    "PHP": 75,
    "MySQL": 70,
    "Firebase": 50,
    "HTML & CSS": 80,
    "Figma": 70,
    "Git & GitHub": 85,
    "REST APIs": 65,
    "UI/UX Design": 85,
  };

  static const List<Color> _barColors = [
    AppColors.primary,
    AppColors.secondary,
    AppColors.accent,
    Color(0xFFFFB347),
    Color(0xFF56CCF2),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle("My Skills"),
          const SizedBox(height: 8),
          Text("Technologies I work with",
              style:
                  GoogleFonts.poppins(fontSize: 13, color: AppColors.textGrey)),
          const SizedBox(height: 28),

          // Skill Chips
          PortfolioCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tech Stack",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhite)),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: AppData.skills.map((s) => SkillChip(s)).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Skill Cards
          PortfolioCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Proficiency",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhite)),
                const SizedBox(height: 20),
                ...List.generate(AppData.skills.length, (i) {
                  final skill = AppData.skills[i];
                  final level = _levels[skill] ?? 70;
                  final color = _barColors[i % _barColors.length];
                  return _SkillBar(name: skill, level: level, color: color);
                }),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Categories card
          Text("Categories",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textWhite)),
          const SizedBox(height: 14),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.4,
            children: [
              _CategoryCard(
                  icon: Icons.phone_android,
                  label: "Mobile Dev",
                  items: ["Flutter", "Dart"],
                  color: AppColors.primary),
              _CategoryCard(
                  icon: Icons.web,
                  label: "Web Dev",
                  items: ["PHP", "HTML & CSS"],
                  color: AppColors.secondary),
              _CategoryCard(
                  icon: Icons.storage,
                  label: "Backend",
                  items: ["MySQL", "Firebase"],
                  color: AppColors.accent),
              _CategoryCard(
                  icon: Icons.design_services,
                  label: "Design",
                  items: ["Figma", "UI/UX Design"],
                  color: const Color(0xFFFFB347)),
            ],
          ),
        ],
      ),
    );
  }
}

// Skill bar
class _SkillBar extends StatelessWidget {
  final String name;
  final int level;
  final Color color;
  const _SkillBar(
      {required this.name, required this.level, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.textWhite,
                      fontWeight: FontWeight.w500)),
              Text("$level%",
                  style: GoogleFonts.poppins(
                      fontSize: 12, color: color, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: level / 100,
              minHeight: 7,
              backgroundColor: AppColors.cardBorder,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}

//Category card
class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final List<String> items;
  final Color color;
  const _CategoryCard(
      {required this.icon,
      required this.label,
      required this.items,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textWhite)),
          const SizedBox(height: 4),
          Text(items.join(", "),
              style:
                  GoogleFonts.poppins(fontSize: 11, color: AppColors.textGrey)),
        ],
      ),
    );
  }
}
