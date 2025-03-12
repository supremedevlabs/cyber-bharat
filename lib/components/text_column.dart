
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class TextColumn extends StatelessWidget {
  final int index;
  final String title, description;
  const TextColumn({
    super.key,
    required this.title,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
              border: Border.all(width: 2,color: Colors.white.withValues(alpha: 0.5),),
              color: Color(0xff989494),
              borderRadius: BorderRadius.circular(9)
      ),
      
      child: Column(
        children: [
          Text(
            
            textAlign: TextAlign.center,
            title,
            style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10,),
          ReadMoreText(
            style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500),
            description,
            trimMode: TrimMode.Line,
            trimLines: 3,
             lessStyle: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold),
            moreStyle: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold),
            // colorClickableText: Colors.black,
            trimCollapsedText: index != 0 ? " अधिक दिखाएं" : ' Show more',
            trimExpandedText: index != 0 ? " कम दिखाएं" : ' Show less',
          ),

        ],
      ),
    );
  }
}
