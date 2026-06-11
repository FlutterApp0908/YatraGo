import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';
import '../app_data.dart';
import '../widgets/common_widgets.dart';

class HomeScreen extends StatelessWidget {
  final Function(int) onNavigate;
  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),

          // Name icon
          Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 3),
                    color: AppColors.surface,
                  ),
                  child: Center(
                    child: Text(
                      "VM",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "👋  Hello, I'm",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  AppData.name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textWhite,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  AppData.role,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppData.tagline,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.textGrey,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          //Social links
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialButton(
                  icon: Icons.code,
                  label: "GitHub",
                  color: const Color(0xFF6E40C9),
                  onTap: () {
                    Clipboard.setData(
                        const ClipboardData(text: AppData.github));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("GitHub link copied!",
                            style: GoogleFonts.poppins()),
                        backgroundColor: AppColors.primary,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                _SocialButton(
                  icon: Icons.work_outline,
                  label: "LinkedIn",
                  color: const Color(0xFF0077B5),
                  onTap: () {
                    Clipboard.setData(
                        const ClipboardData(text: AppData.linkedin));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("LinkedIn link copied!",
                            style: GoogleFonts.poppins()),
                        backgroundColor: const Color(0xFF0077B5),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                _SocialButton(
                  icon: Icons.mail_outline,
                  label: "Email",
                  color: AppColors.secondary,
                  onTap: () {
                    Clipboard.setData(const ClipboardData(text: AppData.email));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text("Email copied!", style: GoogleFonts.poppins()),
                        backgroundColor: AppColors.secondary,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // My projects
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                label: "My Projects",
                icon: Icons.work_outline,
                onTap: () => onNavigate(2),
              ),
              const SizedBox(width: 14),
              OutlineButton2(
                label: "Contact Me",
                icon: Icons.mail_outline,
                onTap: () => onNavigate(5),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Projects history
          PortfolioCard(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(value: "5+", label: "Projects"),
                _divider(),
                _StatItem(value: "Fresher", label: "Experience"),
                _divider(),
                _StatItem(value: "10+", label: "Skills"),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // About me
          PortfolioCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Me",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textWhite,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppData.bio,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColors.textGrey,
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => onNavigate(1),
                  child: Text(
                    "Read more ..",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // My Top Skills
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Skills",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textWhite,
                ),
              ),
              GestureDetector(
                onTap: () => onNavigate(3),
                child: Text(
                  "See all ",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Top Skills
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _SkillPill(label: "Flutter", color: Color(0xFF6C63FF)),
              _SkillPill(label: "Dart", color: Color(0xFF0175C2)),
              _SkillPill(label: "PHP", color: Color(0xFF777BB4)),
              _SkillPill(label: "Firebase", color: Color(0xFFFFCA28)),
              _SkillPill(label: "Figma", color: Color(0xFFFF6584)),
              _SkillPill(label: "MySQL", color: Color(0xFF43E97B)),
            ],
          ),

          const SizedBox(height: 24),

          // Featured Project
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Projects",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textWhite,
                ),
              ),
              GestureDetector(
                onTap: () => onNavigate(2),
                child: Text(
                  "View all ",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Show first 2 projects
          ...List.generate(2, (i) {
            final p = AppData.projects[i];
            final colors = [
              const Color(0xFF6C63FF),
              const Color(0xFFFF6584),
            ];
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _FeaturedProjectCard(project: p, color: colors[i]),
            );
          }),

          const SizedBox(height: 24),

          // Explore Grid view
          Text(
            "Explore",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textWhite,
            ),
          ),
          const SizedBox(height: 14),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.0,
            children: [
              _NavCard(
                  icon: Icons.person_outline,
                  label: "About",
                  color: AppColors.primary,
                  onTap: () => onNavigate(1)),
              _NavCard(
                  icon: Icons.work_outline,
                  label: "Projects",
                  color: AppColors.secondary,
                  onTap: () => onNavigate(2)),
              _NavCard(
                  icon: Icons.code,
                  label: "Skills",
                  color: AppColors.accent,
                  onTap: () => onNavigate(3)),
              _NavCard(
                  icon: Icons.timeline,
                  label: "Experience",
                  color: const Color(0xFFFFB347),
                  onTap: () => onNavigate(4)),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _divider() =>
      Container(width: 1, height: 36, color: AppColors.cardBorder);
}

//  Social Button
class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.35)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Skill pill function
class _SkillPill extends StatelessWidget {
  final String label;
  final Color color;

  const _SkillPill({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 7),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

//Featured project card
class _FeaturedProjectCard extends StatelessWidget {
  final Map<String, String> project;
  final Color color;

  const _FeaturedProjectCard({required this.project, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          // Emoji box
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                project["emoji"]!,
                style: const TextStyle(fontSize: 26),
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project["name"]!,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textWhite,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  project["tech"]!,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  project["description"]!,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColors.textGrey,
                    height: 1.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Arrow
          const SizedBox(width: 8),
          Icon(Icons.arrow_forward_ios_rounded, color: color, size: 14),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

//Stat time
class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.primary)),
        Text(label,
            style:
                GoogleFonts.poppins(fontSize: 12, color: AppColors.textGrey)),
      ],
    );
  }
}

//Nav card
class _NavCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _NavCard(
      {required this.icon,
      required this.label,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.10),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 10),
            Text(label,
                style: GoogleFonts.poppins(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
