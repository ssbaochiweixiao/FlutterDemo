// import 'package:coin/app_imports.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const WebViewPage({required this.url, required this.title});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool _showProgressBar = true; // 用于控制进度条是否显示，初始为显示（对应0.3的进度情况）

  @override
  void initState() {
    super.initState();
    _controller = setupWebViewController();
    _controller.clearCache();
    _controller.loadRequest(Uri.parse(widget.url));
  }

  WebViewController setupWebViewController() {
    WebViewController controller = WebViewController();
    controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) {
          // 页面开始加载时不做额外操作，保持进度条显示
        },
        onPageFinished: (String url) {
          if (mounted) {
            setState(() {
              _showProgressBar = false; // 页面加载完成，设置进度条不显示
            });
          }
        },
        onWebResourceError: (WebResourceError error) {
          if (mounted) {
            setState(() {
              _showProgressBar = false; // 页面加载完成，设置进度条不显示
            });
          }
        },
      ),
    );
    return controller;
  }

  @override
  void dispose() {
    super.dispose();
    // myPrint('---webview.dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Image.asset('images/ic_title_back_black.png'),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // backgroundColor: ColorUtil.stringColor('#FFFFFF'),
        // backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.yellow,
            // fontFamily: Fonts.HSRegular,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            // color: Colors.red,
            height: 0.5,
          ),
        ),
      ),
      body: Column(
        children: [
          if (_showProgressBar)
            Container(
              height: 1.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey, // 背景色
                  borderRadius: BorderRadius.circular(0), // 可根据需要设置圆角半径
                ),
                child: Align(
                  alignment: Alignment.centerLeft, // 设置居左对齐
                  child: FractionallySizedBox(
                    widthFactor: 0.3, // 模拟进度条的进度，这里固定为0.3
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange, // 设置前景色
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: WebViewWidget(controller: _controller),
          ),
        ],
      ),
    );
  }
}