import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kids/utils/model.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberVideo extends StatefulWidget {
  const NumberVideo({super.key});

  @override
  State<NumberVideo> createState() => _NumberVideoState();
}

List<Numbermodel> numbervideolist = numbervideo1();
List<String> numbervideoURLlist = numbervideoURL();

class _NumberVideoState extends State<NumberVideo> {
  Future<void> _launchYoutubeVideo(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFFEF7F0),
        elevation: 0,
        title: const Center(
            child: Text(
          'Number Video Songs',
          style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
        )),
      ),
      body: GridView.builder(
        itemCount: numbervideolist.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 180,
        ),
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return InkWell(
            splashColor: Colors.redAccent,
            onTap: () {
              _launchYoutubeVideo(numbervideoURLlist[index]);
              log(numbervideoURLlist[index]);
            },
            child: Card(
              color: const Color(0xFFEBE8FD),
              elevation: 5,
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.redAccent,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(numbervideolist[index].image ?? "",
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                        height: 122),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        numbervideolist[index].text ?? "",
                        style: const TextStyle(
                            color: Colors.redAccent,
                            fontFamily: "arlrdbd",
                            fontSize: 15),
                      )),
                    )
                  ]),
            ),
          );
        },
      ),
      // bottomNavigationBar: SizedBox(
      //   height: MediaQuery.of(context).size.width * 0.13,
      //   width: 25,
      //   child: AdWidget(
      //     ad: AdmobHelper.getBannerAd()..load(),
      //   ),
      // ),
    );
  }
}
