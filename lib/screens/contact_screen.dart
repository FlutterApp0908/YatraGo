import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';
import '../app_data.dart';
import '../widgets/common_widgets.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _nameCtrl    = TextEditingController();
  final _emailCtrl   = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _sent = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_nameCtrl.text.trim().isEmpty || _emailCtrl.text.trim().isEmpty || _messageCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all fields", style: GoogleFonts.poppins()),
          backgroundColor: AppColors.secondary,
        ),
      );
      return;
    }
    setState(() => _sent = true);
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Copied to clipboard!", style: GoogleFonts.poppins()),
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle("Contact Me"),
          const SizedBox(height: 8),
          Text("Let's work together!", style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGrey)),
          const SizedBox(height: 28),

          // ── Contact Info Cards ─────────────────────────────────────
          _ContactInfoCard(icon: Icons.mail_outline, label: "Email", value: AppData.email,    color: AppColors.primary,   onTap: () => _copyToClipboard(AppData.email)),
          const SizedBox(height: 12),
          _ContactInfoCard(icon: Icons.phone_outlined, label: "Phone", value: AppData.phone,  color: AppColors.secondary, onTap: () => _copyToClipboard(AppData.phone)),
          const SizedBox(height: 12),
          _ContactInfoCard(icon: Icons.link, label: "GitHub", value: "github.com/vidhimochi",  color: AppColors.accent,    onTap: () => _copyToClipboard(AppData.github)),
          const SizedBox(height: 12),
          _ContactInfoCard(icon: Icons.link, label: "LinkedIn", value: "linkedin.com/in/vidhimochi", color: const Color(0xFF0077B5), onTap: () => _copyToClipboard(AppData.linkedin)),

          const SizedBox(height: 28),

          // ── Contact Form ───────────────────────────────────────────
          if (!_sent) ...[
            Text("Send a Message", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textWhite)),
            const SizedBox(height: 16),

            PortfolioCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InputField(controller: _nameCtrl,    label: "Your Name",    hint: "e.g. Rahul Shah",         icon: Icons.person_outline),
                  const SizedBox(height: 16),
                  _InputField(controller: _emailCtrl,   label: "Your Email",   hint: "e.g. rahul@email.com",    icon: Icons.mail_outline),
                  const SizedBox(height: 16),
                  _InputField(controller: _messageCtrl, label: "Message",      hint: "Hi Vidhi, I'd like to…",  icon: Icons.message_outlined, maxLines: 5),
                  const SizedBox(height: 20),
                  PrimaryButton(label: "Send Message", icon: Icons.send_outlined, onTap: _submit),
                ],
              ),
            ),
          ] else ...[
            // Success state
            PortfolioCard(
              child: Column(
                children: [
                  const Icon(Icons.check_circle_outline, color: AppColors.accent, size: 56),
                  const SizedBox(height: 16),
                  Text("Message Sent!", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textWhite)),
                  const SizedBox(height: 8),
                  Text("Thank you for reaching out. I'll get back to you soon!", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGrey, height: 1.6)),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _nameCtrl.clear(); _emailCtrl.clear(); _messageCtrl.clear();
                      setState(() => _sent = false);
                    },
                    child: Text("Send another →", style: GoogleFonts.poppins(fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 28),

          // ── Availability ───────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.08),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.accent.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.accent),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Available for work — Open to internships, full-time, or freelance projects.",
                    style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGrey, height: 1.5),
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

class _ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const _ContactInfoCard({required this.icon, required this.label, required this.value, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(0.12)),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textMuted, fontWeight: FontWeight.w500)),
                  Text(value, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textWhite, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Icon(Icons.copy_outlined, size: 16, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final int maxLines;

  const _InputField({required this.controller, required this.label, required this.hint, required this.icon, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGrey, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textWhite),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(fontSize: 13, color: AppColors.textMuted),
            prefixIcon: maxLines == 1 ? Icon(icon, color: AppColors.textMuted, size: 18) : null,
            filled: true,
            fillColor: AppColors.background,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.cardBorder)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.cardBorder)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
          ),
        ),
      ],
    );
  }
}
