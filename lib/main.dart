import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_token_iot/Pages/HalamanInputToken.dart';
import 'package:webview_token_iot/Pages/HalamanSettingServer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: HalamanSettingServer.routeName,
      getPages: [
        GetPage(
            name: HalamanInputWebsite.routeName.toString(),
            page: () => HalamanInputWebsite()),
        GetPage(
            name: HalamanSettingServer.routeName.toString(),
            page: () => HalamanSettingServer()),
      ],
    );
  }
}
