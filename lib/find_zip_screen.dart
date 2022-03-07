import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/zip_code.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FindZipScreen extends StatefulWidget {
  const FindZipScreen({Key? key}) : super(key: key);

  @override
  State<FindZipScreen> createState() => _FindZipScreenState();
}

class _FindZipScreenState extends State<FindZipScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('우편번호 검색'),),
      body: WebView(
        initialUrl: 'https://neoplay1120.github.io/flutter_zip_code/',
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: {
          JavascriptChannel(
            name: 'zipcode',
            onMessageReceived: (JavascriptMessage message) {
              Map<String,dynamic> json = jsonDecode(message.message);
              ZipCode zipCode = ZipCode.fromJson(json);

              Navigator.pop(context,zipCode);
            },
          ),
        },
      ),
    );
  }
}
