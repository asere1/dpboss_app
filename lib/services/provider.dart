import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dpboss/services/scraper_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import '../models/model.dart';
import 'http_service.dart';

class ScraperProvider with ChangeNotifier {
  List<CardItemModel> _cardItems = [];
  List<MarketModel> _markets = [];
  String htmlHead = '';
  String htmlBody = '';
  String htmlTitle = '';

  bool _onDrawerChanged = false;

  List<CardItemModel> get cardItems => _cardItems;
  List<MarketModel> get markets => _markets;
  // String get htmlHead => htmlHead;
  // String get htmlBody => htmlBody;
  // String get htmlTitle => htmlTitle;

  bool get onDrawerChanged => _onDrawerChanged;

  Future<void> fetchCardItems() async {
    final html = await HttpService.get();
    if (html == null) return;
    _cardItems = [];
    List<CardItemModel> cardItems = ScraperService.cardItem(html);
    _cardItems = cardItems;
    notifyListeners();
  }

  void onDrawerStateChanged(bool stateChanged) {
    _onDrawerChanged = stateChanged;
    notifyListeners();
  }

  Future<void> fetchchart(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final document = parser.parse(response.body);
      htmlTitle = '';
      htmlHead = '';
      htmlBody = '';
      final tableHtmlHead = document.querySelector('head')!.outerHtml;
      final tableHtmlBody =
          document.querySelector('body > div.container-fluid')!.outerHtml;
      final tableTitle = document
          .querySelector(
              'body > div.container-fluid > div:nth-child(1) > div > div.panel-heading.text-center > h1')!
          .innerHtml;
      htmlTitle = tableTitle;
      htmlHead = tableHtmlHead;
      htmlBody = tableHtmlBody;
    }

    notifyListeners();
  }

  Future<void> fetchMarkets() async {
    final html = await HttpService.get();
    if (html == null) return;
    _markets = [];
    List<MarketModel> markets = ScraperService.markets(html);
    _markets = markets;
    notifyListeners();
  }

  Future<void> scrapeData() async {
    final html = await HttpService.get();
    if (html == null) return;
    _cardItems = [];
    _markets = [];
    _cardItems = ScraperService.cardItem(html);
    _markets = ScraperService.markets(html);

    notifyListeners();
  }
}

class FirebaseProvider extends ChangeNotifier {
  String? _userId;

  String? get userId => _userId;

  Future<void> generateToken() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;
      final userId = user.uid;

      _userId = userId;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
