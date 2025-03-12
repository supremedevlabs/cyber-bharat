import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../models/cyber_crime_model.dart';
import 'components/security_tips.dart';
import 'components/text_column.dart';
import 'service/ai_service/ai_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: DefaultTabController(
            length: 2,
            child:  WidgetOne(key: PageStorageKey('widget-one')),
            
          ),
        ),
      ),
    );
  }
}

class WidgetOne extends StatefulWidget {
  const WidgetOne({super.key});

  @override
  State<WidgetOne> createState() => _WidgetOneState();
}

class _WidgetOneState extends State<WidgetOne>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  // Add AutomaticKeepAliveClientMixin

  late TabController _tabController;
  AIService aiService = AIService();
  List<CybercrimeNews> news = [];
  List<CybersecurityTip> tips = [];
  bool _isLoading = true;
  bool _dataFetched = false; // Add flag to track if data has been fetched

  @override
  bool get wantKeepAlive => true; // Override wantKeepAlive to return true

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (mounted) setState(() {}); // Trigger rebuild when tab changes
    });
    fetchData();
  }

  Future<void> fetchData() async {
    // Skip if data already fetched
    if (_dataFetched) return;
    _dataFetched = true;
    try {
      var res = await aiService.generateText(
          "Provide the latest three pieces of india fraud cybercrime insights in a structured JSON format. Each entry should contain:- **Title**: A concise headline summarizing the insights.- **Summary**: A brief overview of the insights (max 100 words) highlighting key details and implications.- **Language**: The language the insights is in (English or Hindi). Ensure the insights is presented in both English and Hindi. Do not repeat the insights on consecutive days. If real-time updates are unavailable, provide a general overview of recent trends or suggest reliable sources like KrebsOnSecurity, Threatpost, or BleepingComputer for further research. Strictly return the response in JSON format, with no additional details or commentary.This is the json format i expect: \"Title\": \"jdv\",\"Summary\":\"sdvdvwewbrwgbrg\",\"HindiTitle\":\"hindi title\",\"HindiSummary\": \"hindi summary\"}\". Additionally, provide five cybercrime awareness tips in a structured JSON format. Each tip should contain the following fields: EnglishTip: The awareness tip in English. HindiTip: The same tip translated into Hindi. Ensure only insights and awareness tips are the keywords used in responses. Do not alter the existing structure of the response.");

      String cleanedJsonResponse =
          res.data.replaceAll(RegExp(r"```json|```"), "").trim();
      Map<String, dynamic> parsedJson = json.decode(cleanedJsonResponse);

      CybercrimeNewsResponse cybercrimeNews =
          CybercrimeNewsResponse.fromJson(parsedJson);

      if (mounted) {
        setState(() {
          news = cybercrimeNews.news;
          tips = cybercrimeNews.cybersecurityTips;
          _isLoading = false;
          _dataFetched = true; // Set the flag to true after fetching
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for keeping the widget alive

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
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0XFF989494),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(9)),
              controller: _tabController,
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              labelColor: Colors.black,
              unselectedLabelStyle:
                  GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700),
              labelStyle:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700),
              tabs: const [Tab(text: "English"), Tab(text: "Hindi")],
            ),
          ),
        ),
        if (_isLoading)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          )
        else ...[
          Padding(
            padding: const EdgeInsets.only(top: 45, bottom: 11, left: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _tabController.index == 0
                    ? "Cyber Awareness"
                    : "साइबर जागरूकता",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
          ...news.map((newsInfo) {
            String title = _tabController.index == 0
                ? newsInfo.title
                : newsInfo.hindiTitle;
            String description = _tabController.index == 0
                ? newsInfo.summary
                : newsInfo.hindiSummary;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextColumn(
                title: title,
                description: description,
                index: _tabController.index,
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 11, left: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _tabController.index == 0
                    ? "Awareness Tips"
                    : "जागरूकता युक्तियाँ",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SecurityTips(tips: tips, index: _tabController.index),
          ),
          const SizedBox(height: 30),
        ]
      ],
    );
  }
}
