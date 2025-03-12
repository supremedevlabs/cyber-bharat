class CybercrimeNewsResponse {
  final List<CybercrimeNews> news;
  final List<CybersecurityTip> cybersecurityTips;

  CybercrimeNewsResponse({required this.news, required this.cybersecurityTips});

  factory CybercrimeNewsResponse.fromJson(Map<String, dynamic> json) {
    var newsList = (json['insights'] as List)
        .map((item) => CybercrimeNews.fromJson(item))
        .toList();
    var tipsList = (json['awarenessTips'] as List)
        .map((item) => CybersecurityTip.fromJson(item))
        .toList();

    return CybercrimeNewsResponse(news: newsList, cybersecurityTips: tipsList);
  }
}
class CybercrimeNews {
  final String title, summary, hindiTitle, hindiSummary;

  CybercrimeNews(
      {required this.title,
      required this.summary,
      required this.hindiTitle,
      required this.hindiSummary});

  factory CybercrimeNews.fromJson(Map<String, dynamic> json) {
    return CybercrimeNews(
      title: json['Title'],
      summary: json['Summary'],
      hindiTitle: json['HindiTitle'],
      hindiSummary: json['HindiSummary'],
    );
  }
}

class CybersecurityTip {
  final String englishTip, hindiTip;

  CybersecurityTip({required this.englishTip, required this.hindiTip});

  factory CybersecurityTip.fromJson(Map<String, dynamic> json) {
    return CybersecurityTip(
      englishTip: json['EnglishTip'],
      hindiTip: json['HindiTip'],
    );
  }
}

