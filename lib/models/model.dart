class CardItemModel {
  String gn;
  String gr;
  CardItemModel({
    required this.gn,
    required this.gr,
  });
}

class MarketModel {
  String title;
  String scorr;
  String time;
  String jodiLink;
  String panelLink;

  MarketModel({
    required this.title,
    required this.scorr,
    required this.time,
    required this.jodiLink,
    required this.panelLink,
  });

  factory MarketModel.fromMap(Map<String, dynamic> map) {
    return MarketModel(
      title: map['title'] ?? '',
      scorr: map['scorr'] ?? '',
      time: map['time'] ?? '',
      jodiLink: map['jodiLink'] ?? '',
      panelLink: map['panelLink'] ?? '',
    );
  }
}
