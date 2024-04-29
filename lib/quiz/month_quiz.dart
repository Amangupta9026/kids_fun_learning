import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kids/utils/model.dart';
import 'package:motion_toast/motion_toast.dart';

import 'abc_quiz.dart';

class Monthquiz extends StatefulWidget {
  const Monthquiz({super.key});

  @override
  State<Monthquiz> createState() => _MonthquizState();
}

List<Numbermodel> monthlist = month12();

class _MonthquizState extends State<Monthquiz> {
  bool isPressed = false;
  Color istrue = const Color(0xFFF19335);
  Color isWrong = const Color(0xFFFF0000);
  Color btnColor = Colors.blue;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: const Color(0xFFFEF7F0),
          title: const Center(
              child: Text(
            'Alphabet',
            style: TextStyle(fontFamily: "arlrdbd", color: Colors.black),
          )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (page) {
                    isPressed = false;
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: monthquestion.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        Image.asset(
                          monthlist[index].image ?? "",
                          height: 180,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                        Expanded(
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(50),
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                            primary: false,
                            children: [
                              for (int i = 0;
                                  i < monthquestion[index].answer.length;
                                  i++)
                                MaterialButton(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 10.0,
                                  height: 10,
                                  minWidth: double.infinity,
                                  color: isPressed
                                      ? monthquestion[index]
                                              .answer
                                              .entries
                                              .toList()[i]
                                              .value
                                          ? istrue
                                          : isWrong
                                      : Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18.0),
                                  onPressed: isPressed
                                      ? () {}
                                      : () {
                                          if (monthquestion[index]
                                              .answer
                                              .entries
                                              .toList()[i]
                                              .value) {
                                            setState(() {
                                              isPressed = true;
                                            });
                                            score += 1;
                                            log("$score");
                                            MotionToast.success(
                                                    borderRadius: 5,
                                                    animationDuration:
                                                        const Duration(
                                                            seconds: 3),
                                                    title: const Text(
                                                      "Your Answer is Right",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    description:
                                                        const SizedBox(),
                                                    iconType:
                                                        IconType.cupertino)
                                                .show(context);
                                          } else {
                                            setState(() {
                                              isPressed = true;
                                            });
                                            MotionToast.error(
                                                    borderRadius: 5,
                                                    animationDuration:
                                                        const Duration(
                                                            seconds: 3),
                                                    description:
                                                        const SizedBox(),
                                                    title: const Text(
                                                      "Your Answer is Wrong",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    iconType:
                                                        IconType.cupertino)
                                                .show(context);
                                          }
                                        },
                                  child: Text(
                                    monthquestion[index]
                                        .answer
                                        .keys
                                        .toList()[i],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: "arlrdbd",
                                        fontSize: 20.0),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              heightFactor: 2.7,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: isPressed
                                    ? index + 1 == monthquestion.length
                                        ? () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResultSrceen(score)));
                                          }
                                        : () {
                                            controller.nextPage(
                                                duration: const Duration(
                                                    microseconds: 500),
                                                curve: Curves.linear);
                                          }
                                    : null,
                                child: Text(
                                  index + 1 == monthquestion.length
                                      ? "See Result"
                                      : "Next Question",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontFamily: "arlrdbd",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}