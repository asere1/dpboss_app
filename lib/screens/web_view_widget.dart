import 'package:dpboss/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});
  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  final WebViewController _controller = WebViewController();
  late bool hasUpdated;
  late bool becameEmpty;

  @override
  void initState() {
    super.initState();
    hasUpdated = false;
    becameEmpty = false;
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features
    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features
    controller.setBackgroundColor(Colors.white);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scraperProvider =
        Provider.of<ScraperProvider>(context, listen: false);
    if (!hasUpdated) {
      scraperProvider.fetchchart('https://dpboss.net/${widget.url}');
    }

    if (scraperProvider.htmlBody.isNotEmpty &
        scraperProvider.htmlHead.isNotEmpty) {
      _controller
        ..loadHtmlString(
          '''
<!DOCTYPE html>
<html amp lang="en-in">
${scraperProvider.htmlHead}
${scraperProvider.htmlBody}
     ''',
        )
        ..setBackgroundColor(Colors.white);
      setState(() {
        hasUpdated = true;
      });
    }
    if (hasUpdated & !becameEmpty) {
      empyHtml();
      setState(() {
        becameEmpty = true;
      });
    }
  }

  empyHtml() {
    final scraperProvider =
        Provider.of<ScraperProvider>(context, listen: false);
    scraperProvider.htmlBody = ' ';
    scraperProvider.htmlTitle = ' ';
    scraperProvider.htmlHead = ' ';
  }

  @override
  Widget build(BuildContext context) {
    final scraperProvider = Provider.of<ScraperProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .09,
        leading: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const ImageIcon(
                AssetImage('assets/Dpboss_Net/ICON/arrow.png'),
                size: 27,
                color: Colors.black,
              ),
            ),
          ],
        ),
        elevation: 0,
        leadingWidth: 45,
        backgroundColor: Colors.amber[400]!.withOpacity(.43),
        title: const Text('CHARTS'),
      ),
      body: SafeArea(
        child: Material(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35)),
          child: Center(
            child: !hasUpdated
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [CircularProgressIndicator()],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (.04),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            scraperProvider.htmlTitle,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.black.withOpacity(.3),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .69,
                        child: WebViewWidget(
                          controller: _controller,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.clearCache();
    _controller.clearLocalStorage();
    super.dispose();
  }
}
