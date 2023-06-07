import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_token_iot/Pages/HalamanSettingServer.dart';
import 'package:webview_token_iot/component/ComponentButton.dart';
import 'package:webview_token_iot/component/ComponentText.dart';
import 'package:webview_token_iot/component/text_field.dart';
import 'package:webview_token_iot/controller/ModelWebController.dart';
import 'package:webview_token_iot/util/SizeApp.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
// #docregion platform_imports
// Import for Android features.

class HalamanInputWebsite extends StatefulWidget {
  static String? routeName = "/HalamanInputWebsite";

  @override
  State<HalamanInputWebsite> createState() => _HalamanInputWebsiteState();
}

class _HalamanInputWebsiteState extends State<HalamanInputWebsite> {
  TextEditingController textEditingController = TextEditingController();
  final controller = ModelWebController();
  String? url;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final String url = Get.arguments as String ?? "";

    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('$url')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(url == null || url.isEmpty
          ? Uri.parse('https://google.com')
          : Uri.parse('$url'));
    return Scaffold(
      backgroundColor: Colors.black,
      body: ScreenUtilInit(
        builder: (context, child) {
          return Column(children: [
            SizedBox(
              height: 30.h,
              child: Container(),
            ),
            ComponentTextPrimaryTittleBold(
              teks: "App Name",
              colorText: Colors.white,
              size: 15.sp,
            ),
            SingleChildScrollView(
              physics: PageScrollPhysics(),
              child: Container(
                  margin: EdgeInsets.all(30),
                  height: 300.h,
                  child: WebViewWidget(controller: webViewController)),
            ),
            ComponentTextPrimaryDescriptionRegular(
              teks: "Teks Status Via HTTP",
              colorText: Colors.white,
            ),
            TextFieldImport.TextForm(
              hintText: "Numeric Input",
            ),
            ComponentButtonPrimaryWithFunction(
                "Submit Token",
                () => {
                      {
                        Get.snackbar("Berhasil", "Mengirimkan Token",
                            colorText: Colors.white),
                        Get.toNamed(HalamanInputWebsite.routeName.toString())
                      }
                    }),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                iconSize: 50,
                onPressed: () =>
                    {Get.toNamed(HalamanSettingServer.routeName.toString())},
                icon: Icon(Icons.settings),
                color: Colors.white,
              ),
            )
          ]);
        },
      ),
    );
  }
}
