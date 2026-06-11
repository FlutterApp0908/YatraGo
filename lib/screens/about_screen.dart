import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';
import '../app_data.dart';
import '../widgets/common_widgets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle("About Me"),
          const SizedBox(height: 28),

          // Profile card
          PortfolioCard(
            child: Row(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 2),
                    color: AppColors.primary.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text("VM",
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppData.name,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textWhite)),
                      const SizedBox(height: 4),
                      Text(AppData.role,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 4),
                      InfoRow(
                          icon: Icons.location_on_outlined,
                          text: AppData.location),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Bio-info
          PortfolioCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Who I Am",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhite)),
                const SizedBox(height: 12),
                Text(
                  AppData.bio,
                  style: GoogleFonts.poppins(
                      fontSize: 14, color: AppColors.textGrey, height: 1.75),
                ),
                const SizedBox(height: 12),
                Text(
                  "I am currently looking for opportunities where I can contribute, grow, and continue to develop my skills as a Flutter developer. I am a quick learner and always eager to take on new challenges.",
                  style: GoogleFonts.poppins(
                      fontSize: 14, color: AppColors.textGrey, height: 1.75),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Contact info
          PortfolioCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Contact Info",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhite)),
                const SizedBox(height: 16),
                InfoRow(icon: Icons.mail_outline, text: AppData.email),
                const SizedBox(height: 12),
                InfoRow(icon: Icons.phone_outlined, text: AppData.phone),
                const SizedBox(height: 12),
                InfoRow(
                    icon: Icons.location_on_outlined, text: AppData.location),
                const SizedBox(height: 12),
                InfoRow(icon: Icons.link, text: "github.com/vidhimochi"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Education data
          PortfolioCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Education",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhite)),
                const SizedBox(height: 16),
                ...AppData.education.map((e) => _EduItem(
                      degree: e["degree"]!,
                      EduPlace: e["EduPlace"]!,
                      year: e["year"]!,
                    )),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Interest
          PortfolioCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Interests",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhite)),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    "Mobile Apps",
                    "UI Design",
                    "Web Dev",
                    "Problem Solving",
                    "Learning",
                    "Creativity"
                  ]
                      .map((i) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.secondary.withOpacity(0.3)),
                            ),
                            child: Text(i,
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: AppColors.textGrey)),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EduItem extends StatelessWidget {
  final String degree;
  final String EduPlace;

  final String year;
  const _EduItem(
      {required this.degree, required this.EduPlace, required this.year});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primary),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(degree,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textWhite)),
              const SizedBox(height: 2),
              Text(EduPlace,
                  style: GoogleFonts.poppins(
                      fontSize: 13, color: AppColors.textGrey)),
              const SizedBox(height: 2),
              Text(year,
                  style: GoogleFonts.poppins(
                      fontSize: 12, color: AppColors.primary)),
            ],
          ),
        ),
      ],
    );
  }
}
