import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kids/alphabet_sound/vegitable_sound.dart';
import 'package:kids/utils/model.dart';

class Vegitable extends StatefulWidget {
  const Vegitable({super.key});

  @override
  State<Vegitable> createState() => _VegitableState();
}

List<Numbermodel> vegitablelist = vegitable123();

class _VegitableState extends State<Vegitable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.orange[50],
          elevation: 0,
          title: const Center(
              child: Text(
            'Vegetable',
            style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            itemCount: vegitablelist.length,
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
                    log("$vegitablelist");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VegitableSound(index),
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
                            vegitablelist[index].image ?? "",
                            height: 120,
                          ),
                          Text(
                            vegitablelist[index].text ?? "",
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
