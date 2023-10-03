import 'package:entrade_x/repo/i_data_info_fake.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class LastNewAll extends StatefulWidget {
  LastNewAll({super.key});

  static const _biggerFont = TextStyle(fontSize: 14.0, color: Colors.white);
  IDataInfoFake infoFake = IDataInfoFake();

  @override
  State<LastNewAll> createState() => _LastNewAllState();
}

class _LastNewAllState extends State<LastNewAll> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
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
                width: width,
                height: height * 0.2,
                color: const Color(0xff202123),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.6,
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
                        SizedBox(
                          width: width * 0.3,
                          child: Image(
                            image: AssetImage(
                                widget.infoFake.list[index].imagePath),
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
