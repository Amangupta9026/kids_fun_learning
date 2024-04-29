import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids/utils/model.dart';

// ignore: must_be_immutable
class FlowerSound extends StatefulWidget {
  int index;

  FlowerSound(this.index, {super.key});
  @override
  State<FlowerSound> createState() => _FlowerSoundState();
}

List<Numbermodel> flowerlist = fLOWERS1();

class _FlowerSoundState extends State<FlowerSound> {
  final FlutterTts flutterTts = FlutterTts();
  int i = 0;
  @override
  Widget build(BuildContext context) {
    Future speak() async {
      log("${await flutterTts.getLanguages}");
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.setVolume(10.0);
      log("${await flutterTts.getVoices}");
      int count = widget.index;

      await flutterTts.speak(flowerlist[count].text ?? "");
    }

    final controller = PageController();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Flower',
            style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          ),
          backgroundColor: Colors.orange[50],
        ),
        body: Container(
          height: 650,
          width: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage("assets/images/Union 12.png")),
          ),
          child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Flexible(
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    elevation: 5,
                    shadowColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: PageView.builder(
                      controller: controller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: flowerlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Image.asset(
                            flowerlist[widget.index].image ?? "",
                            alignment: Alignment.topCenter,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Column(children: [
                  InkWell(
                      onTap: () => speak(),
                      child: Image.asset('assets/images/11MaskGroup3.png')),
                  Align(
                    heightFactor: 0.5,
                    child: Center(
                      child: ListTile(
                        trailing: InkWell(
                          onTap: () {
                            if (widget.index >= 0 && widget.index < 10) {
                              i++;
                              log("${widget.index}");
                              setState(() {
                                widget.index++;
                              });
                            }
                            speak();
                          },
                          child: const Image(
                            image: AssetImage('assets/images/11MaskGroup5.png'),
                          ),
                        ),
                        leading: InkWell(
                          onTap: () {
                            if (widget.index > 0 && widget.index <= 10) {
                              i--;
                              setState(() {
                                widget.index--;
                              });
                            }
                            speak();
                          },
                          child: const Image(
                            image: AssetImage('assets/images/11MaskGroup4.png'),
                          ),
                        ),
                      ),
                    ),
                  )
                ])
              ])),
        ));
  }
}
