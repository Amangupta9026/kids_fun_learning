import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids/alphabet_sound/color_sound.dart';
import 'package:kids/utils/model.dart';

// ignore: must_be_immutable
class Color extends StatefulWidget {
  int index;
  Color(this.index, {super.key});
  @override
  State<Color> createState() => _ColorState();
}

final FlutterTts flutterTts = FlutterTts();

class _ColorState extends State<Color> {
  List<Numbermodel> colorlist = cOLOR1();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.orange[50],
          elevation: 0,
          title: const Center(
              child: Text(
            'Color',
            style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            itemCount: colorlist.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  splashColor: Colors.redAccent,
                  onTap: () {
                    log("$colorlist");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ColorSound(index),
                        ));
                  },
                  child: Card(
                    color: Colors.amber[50],
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.redAccent,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            colorlist[index].image ?? "",
                            height: 120,
                          ),
                          Text(
                            colorlist[index].text ?? "",
                            style: const TextStyle(
                                color: Colors.redAccent, fontFamily: "arlrdbd"),
                          )
                        ]),
                  ));
            },
          ),
        ));
  }
}
