import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kids/utils/model.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimalVideo extends StatefulWidget {
  const AnimalVideo({super.key});

  @override
  State<AnimalVideo> createState() => _AnimalVideoState();
}

List<Numbermodel> animalvideolist = animalvideo1();
List<String> animalvideoURLlist = animalvideoURL();

class _AnimalVideoState extends State<AnimalVideo> {
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
          'Animal Video Songs',
          style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
        )),
      ),
      body: GridView.builder(
        itemCount: animalvideolist.length,
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
              _launchYoutubeVideo(animalvideoURLlist[index]);
              log(animalvideoURLlist[index]);
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
                    Image.asset(animalvideolist[index].image ?? "",
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                        height: 122),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        animalvideolist[index].text ?? "",
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
