import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportScreen extends StatelessWidget {
  void _launchCybercrimeWebsite() async {
    final Uri url = Uri.parse("https://supremedevlabs.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _callHelpline() async {
    final Uri telUri = Uri(scheme: 'tel', path: '1930');
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      throw 'Could not launch $telUri';
    }
  }

  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        Text("SUPREME BHARAT",
            style: GoogleFonts.aboreto(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(top: 45, bottom: 11, left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Report a Cyber Crime",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(9)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "1930",
                      style: GoogleFonts.inter(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _callHelpline,
                    ),
                  ],
                  text: "Helpline Number: ",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "cybercrime.gov.in",
                      style: GoogleFonts.inter(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _launchCybercrimeWebsite,
                    ),
                  ],
                  text: "Online portal: ",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
