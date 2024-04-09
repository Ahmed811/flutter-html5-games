import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GameScreen extends StatefulWidget {
  final String gameUri;
  const GameScreen({super.key, required this.gameUri});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            onLoadStart: (InAppWebViewController controller, url) {},
            initialUrlRequest: URLRequest(url: WebUri(widget.gameUri)),
          ),
          Positioned(
            child:
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     child: Text("close")),
                IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(10)),
                    color: Colors.white,
                    onPressed: () {
                      print("Close button pressed");
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 25,
                    )),
            right: 10,
            top: 40,
          ),
        ],
      ),
    );
  }
}

// setState(() {
//   // controller.evaluateJavascript(
//   //     source:
//   //         "document.getElementsByClassName('yandex-sticky-adv-banner yandex-sticky-adv-banner_portrait_bottom')[0].style.display = 'none';");
// });
