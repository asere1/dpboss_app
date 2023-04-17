import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:dpboss/models/model.dart';

class ScraperService {
  static List<CardItemModel> cardItem(String html) {
    try {
      final soup = BeautifulSoup(html);
      final cardItem = soup.find('div', class_: 'matka-card live-box');
      List<CardItemModel> packages = [];

      final gn =
          cardItem!.findAll('span', class_: 'gn').map((e) => e.text).toList();
      final gr =
          cardItem.findAll('span', class_: 'gr').map((e) => e.text).toList();

      for (int i = 0; i < gn.length && i < gr.length; i++) {
        CardItemModel model = CardItemModel(gn: gn[i], gr: gr[i]);
        packages.add(model);
      }

      return packages;
    } catch (e) {
      print('scraper => $e');
      return [];
    }
  }

  static List<MarketModel> markets(String html) {
    try {
      final soup = BeautifulSoup(html);
      final market = soup.find('div', class_: 'satta-result');
      final divs = market!.findAll('div');
      List<MarketModel> markets = [];
      for (var div in divs) {
        final title = div.find('h4')?.text ?? '';
        final scorr = div.find('span')?.text ?? '';
        final time = div.find('p')?.text ?? '';

        final jodiLink = div
                .find('a', class_: 'result_timing btn_chart')
                ?.getAttrValue('href') ??
            '';

        final panelLink = div
                .find('a', class_: 'result_timing_right btn_chart')
                ?.getAttrValue("href") ??
            '';

        MarketModel model = MarketModel(
          title: title,
          scorr: scorr,
          time: time,
          jodiLink: jodiLink,
          panelLink: panelLink,
        );
        markets.add(model);
      }

      return markets;
    } catch (e) {
      print('scraper => $e');
      return [];
    }
  }
}
