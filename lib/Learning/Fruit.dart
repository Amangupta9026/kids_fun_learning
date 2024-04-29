import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kids/alphabet_sound/fruit_sound.dart';
import 'package:kids/utils/model.dart';

class Fruits extends StatefulWidget {
  const Fruits({super.key});

  @override
  State<Fruits> createState() => _FruitsState();
}

List<Numbermodel> fRUITlist = fruit1();

class _FruitsState extends State<Fruits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.orange[50],
          elevation: 0,
          title: const Center(
              child: Text(
            'Fruit',
            style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            itemCount: fRUITlist.length,
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
                    log("$fRUITlist");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FruitSound(index),
                        ));
                  },
                  child: Card(
                    color: const Color(0xFFFEF9E4),
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
                            fRUITlist[index].image ?? "",
                            height: 120,
                          ),
                          Text(
                            fRUITlist[index].text ?? "",
                            style: const TextStyle(
                                color: Colors.black, fontFamily: "arlrdbd"),
                          )
                        ]),
                  ));
            },
          ),
        ));
  }
}
