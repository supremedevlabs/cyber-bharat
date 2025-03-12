import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/cyber_crime_model.dart';

class SecurityTips extends StatelessWidget {
  final int index;
  final List<CybersecurityTip> tips;

  const SecurityTips({required this.tips, required this.index});

  @override
  Widget build(BuildContext context) {
    final tipsToDisplay = index == 0
        ? tips.map((tip) => tip.englishTip).toList()
        : tips.map((tip) => tip.hindiTip).toList();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          decoration: BoxDecoration(
            color: Color(0xff989494),
            border: Border.all(
              width: 2,
              color: Colors.white.withValues(alpha: 0.5),
            ),
            borderRadius: BorderRadius.circular(9),
          ),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tipsToDisplay.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('\u2022', style: GoogleFonts.inter(fontSize: 18)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tipsToDisplay[index],
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
