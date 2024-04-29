import 'package:flutter/material.dart';
import 'package:kids/alphabet_sound/flower_sound.dart';
import 'package:kids/utils/model.dart';

class Flower extends StatefulWidget {
  const Flower({super.key});

  @override
  State<Flower> createState() => _FlowerState();
}

List<Numbermodel> flowerlist = fLOWERS1();

class _FlowerState extends State<Flower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.orange[50],
          elevation: 0,
          title: const Center(
              child: Text(
            'Flower',
            style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            itemCount: flowerlist.length,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlowerSound(index),
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
                            flowerlist[index].image ?? "",
                            height: 120,
                          ),
                          Text(
                            flowerlist[index].text ?? "",
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
