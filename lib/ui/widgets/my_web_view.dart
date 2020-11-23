import 'dart:async';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  MyWebView({@required this.title, @required this.url});

  String title;
  String url;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      bottomNavigationBar: NavigationControls(_controller.future),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final webViewReady = snapshot.connectionState == ConnectionState.done;
        final controller = snapshot.data;
        return BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        if (await controller.canGoBack()) {
                          await controller.goBack();
                        } else {
                          // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('No back history item')),
                          );
                          return;
                        }
                      },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_outlined),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        if (await controller.canGoForward()) {
                          await controller.goForward();
                        } else {
                          // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('No forward history item')),
                          );
                          return;
                        }
                      },
              ),
              const Spacer(),
              IconButton(
                  icon: const Icon(Icons.refresh_outlined),
                  onPressed: !webViewReady ? null : controller.reload),
            ],
          ),
        );
      },
    );
  }
}
