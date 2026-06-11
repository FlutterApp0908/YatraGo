import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';
import '../widgets/common_widgets.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle("Experience"),
          const SizedBox(height: 28),

          // Fresher banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.emoji_events_outlined,
                    color: AppColors.primary, size: 32),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fresher / Entry Level",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textWhite)),
                      const SizedBox(height: 4),
                      Text(
                          "Ready to start my professional journey as a Flutter Developer.",
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: AppColors.textGrey,
                              height: 1.5)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // What I've built
          Text("What I've Built",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textWhite)),
          const SizedBox(height: 14),

          _TimelineItem(
            icon: Icons.phone_android,
            color: AppColors.primary,
            title: "YatraGo – Flutter App",
            subtitle: "Personal Project",
            year: "2024",
            description:
                "Designed and developed YatraGo, a comprehensive BRTS transport management application using Flutter, Dart, and Firebase. The app enables users to book tickets online, manage student passes, view bus routes and schedules, track buses in real time, and access location-based transportation services through a modern and responsive interface.",
          ),
          _TimelineItem(
            icon: Icons.phone_android,
            color: AppColors.accent,
            title: "Family Expense Tracker",
            subtitle: "Personal Project",
            year: "2024",
            description:
                "Developed a Flutter app for family budget management with Hive local storage, categories, and monthly expense summaries.",
          ),
          _TimelineItem(
            icon: Icons.web,
            color: AppColors.secondary,
            title: "Lazeez – Food Delivery Website",
            subtitle: "Academic Project",
            year: "2023",
            description:
                "Designed and developed a complete food delivery platform with PHP and MySQL including user-facing order flow and admin panel and Delivery Boy Panel.",
          ),
          _TimelineItem(
            icon: Icons.web,
            color: const Color(0xFFFFB347),
            title: "Portfolio Website",
            subtitle: "Personal Project",
            year: "2023",
            description:
                "Built a responsive personal portfolio website using PHP, HTML, and CSS to showcase projects and skills.",
          ),
          _TimelineItem(
            icon: Icons.design_services,
            color: const Color(0xFF56CCF2),
            title: "Furniture Website UI",
            subtitle: "Figma + Development",
            year: "2023",
            description:
                "Designed a complete e-commerce furniture website UI/UX in Figma and developed and including product pages and checkout.",
            isLast: true,
          ),

          const SizedBox(height: 28),

          // Looking for
          PortfolioCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.search, color: AppColors.accent, size: 20),
                    const SizedBox(width: 10),
                    Text("Currently Looking For",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textWhite)),
                  ],
                ),
                const SizedBox(height: 14),
                ...[
                  "Flutter Developer (Internship / Full-time)",
                  "Mobile App Development role",
                  "Frontend / Full-stack role",
                ].map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.accent)),
                          const SizedBox(width: 12),
                          Text(item,
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: AppColors.textGrey)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 55),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String year;
  final String description;
  final bool isLast;

  const _TimelineItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.year,
    required this.description,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline line + dot
          Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.15),
                  border: Border.all(color: color.withOpacity(0.5)),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                      width: 2,
                      color: AppColors.cardBorder,
                      margin: const EdgeInsets.symmetric(vertical: 4)),
                ),
            ],
          ),
          const SizedBox(width: 16),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(title,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textWhite)),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              color: color.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(year,
                              style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: color,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: GoogleFonts.poppins(fontSize: 12, color: color)),
                    const SizedBox(height: 8),
                    Text(description,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.textGrey,
                            height: 1.6)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
