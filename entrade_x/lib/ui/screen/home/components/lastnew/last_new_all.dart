import 'package:entrade_x/repo/informations.dart';
import 'package:entrade_x/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class LastNewAll extends StatefulWidget {
  LastNewAll({super.key});

  static const _biggerFont = TextStyle(fontSize: 16.0);
  IDataInfoFake infoFake = IDataInfoFake();

  @override
  State<LastNewAll> createState() => _LastNewAllState();
}

class _LastNewAllState extends State<LastNewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin vĩ mô'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: widget.infoFake.list.length,
        itemBuilder: (context, index) {
          if (widget.infoFake.list.isNotEmpty) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OpenWebViewPage(),
                    ));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.2,
                color: Theme.of(context).appBarTheme.foregroundColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: SizeConfig.screenHeight * 0.6,
                                child: Text(
                                  widget.infoFake.list[index].title,
                                  style: LastNewAll._biggerFont,
                                  maxLines: 2,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(widget.infoFake.list[index].time),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(widget.infoFake.list[index].author),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                            image:
                                AssetImage(widget.infoFake.list[index].imagePath),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        '${index + 1}/${widget.infoFake.list.length}',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('false'),
            );
          }
        },
      ),
    );
  }
}

class OpenWebViewPage extends StatefulWidget {
  const OpenWebViewPage({super.key});

  @override
  State<OpenWebViewPage> createState() => _OpenWebViewPageState();
}

class _OpenWebViewPageState extends State<OpenWebViewPage> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://dantri.com.vn/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
      bottomNavigationBar: null,
    );
  }
}
