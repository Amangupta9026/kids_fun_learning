import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kids/utils/model.dart';
import 'package:url_launcher/url_launcher.dart';

class FlowerVideo extends StatefulWidget {
  const FlowerVideo({super.key});

  @override
  State<FlowerVideo> createState() => _FlowerVideoState();
}

List<Numbermodel> alphabetvideolist = alphabetvideo1();
List<String> alphabetvideoURLlist = alphabetvideoURL();

class _FlowerVideoState extends State<FlowerVideo> {
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
          'Flower Video Songs',
          style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
        )),
      ),
      body: GridView.builder(
        itemCount: alphabetvideolist.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return InkWell(
            splashColor: Colors.redAccent,
            onTap: () {
              _launchYoutubeVideo(alphabetvideoURLlist[index]);
              log(alphabetvideoURLlist[index]);
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
                    Image.asset(alphabetvideolist[index].image ?? "",
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                        height: 122),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        alphabetvideolist[index].text ?? "",
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