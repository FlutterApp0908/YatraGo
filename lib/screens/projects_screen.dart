import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';
import '../app_data.dart';
import '../widgets/common_widgets.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  // Each project gets a color
  static const List<Color> _colors = [
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
          const SectionTitle("My Projects"),
          const SizedBox(height: 8),
          Text(
            "${AppData.projects.length} projects I've built",
            style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGrey),
          ),
          const SizedBox(height: 28),
          ...List.generate(AppData.projects.length, (i) {
            final p = AppData.projects[i];
            final color = _colors[i % _colors.length];
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _ProjectCard(project: p, color: color),
            );
          }),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, String> project;
  final Color color;
  const _ProjectCard({required this.project, required this.color});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final c = widget.color;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Colored top bar with emoji ──────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            color: c.withOpacity(0.15),
            child: Row(
              children: [
                Text(p["emoji"]!, style: const TextStyle(fontSize: 36)),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p["name"]!,
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textWhite),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: c.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          p["type"]!,
                          style: GoogleFonts.poppins(fontSize: 11, color: c, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Body ────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Tech stack
                Row(
                  children: [
                    Icon(Icons.build_outlined, size: 14, color: c),
                    const SizedBox(width: 6),
                    Text(
                      p["tech"]!,
                      style: GoogleFonts.poppins(fontSize: 13, color: c, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Description
                Text(
                  p["description"]!,
                  style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGrey, height: 1.65),
                  maxLines: _showMore ? null : 3,
                  overflow: _showMore ? TextOverflow.visible : TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),

                // Show more / less
                GestureDetector(
                  onTap: () => setState(() => _showMore = !_showMore),
                  child: Text(
                    _showMore ? "Show less ↑" : "Show more ↓",
                    style: GoogleFonts.poppins(fontSize: 12, color: c, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
