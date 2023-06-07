import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_token_iot/Pages/HalamanInputToken.dart';
import 'package:webview_token_iot/component/ComponentButton.dart';
import 'package:webview_token_iot/component/ComponentText.dart';
import 'package:webview_token_iot/component/text_field.dart';
import 'package:webview_token_iot/model/ModelWeb.dart';
import 'package:webview_token_iot/util/SizeApp.dart';

import 'package:get/get.dart';

import '../controller/ModelWebController.dart';

class HalamanSettingServer extends StatefulWidget {
  static String? routeName = "/HalamanSettingServer";

  @override
  State<HalamanSettingServer> createState() => _HalamanSettingServerState();
}

class _HalamanSettingServerState extends State<HalamanSettingServer> {
  TextEditingController textEditingController = TextEditingController();
  final controller = ModelWebController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    controller.loadWebUrl();
    // Mengisi nilai webUrl ke dalam textEditingController
    textEditingController.text = controller.webUrl;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    controller.loadWebUrl();

    RegExp urlPattern = RegExp(r'^(?:http|https)://');

    return Scaffold(
      backgroundColor: Colors.black,
      body: ScreenUtilInit(
        builder: (context, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                      child: Container(),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => {
                                  Get.toNamed(
                                      HalamanInputWebsite.routeName.toString(),
                                      arguments:
                                          textEditingController.text.toString())
                                },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        ComponentTextPrimaryTittleBold(
                          teks: "Setting Server",
                          colorText: Colors.white,
                          size: 15.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    TextFieldImport.TextForm(
                      text_kontrol: textEditingController,
                      hintText: "Input URL/IP Server",
                    ),
                    ComponentButtonPrimaryWithFunction(
                        "Save Setting",
                        () => {
                              if (urlPattern.hasMatch(
                                  textEditingController.text.toString()))
                                {
                                  setState(() {
                                    controller.webUrl =
                                        textEditingController.text.toString();
                                    controller.saveWebUrl();
                                    Get.snackbar("Berhasil",
                                        "Menyimpan URL/IP Server ${textEditingController.text.toString()}",
                                        colorText: Colors.white);
                                    Get.toNamed(
                                        HalamanInputWebsite.routeName
                                            .toString(),
                                        arguments: textEditingController.text
                                            .toString());
                                  })
                                }
                              else
                                {
                                  Get.snackbar(
                                      "Gagal", "URL/IP Server Tidak Valid",
                                      colorText: Colors.white)
                                }
                            }),
                    SizedBox(
                      height: 30,
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
