import 'package:flutter/material.dart';
import 'package:kids/screens/lets_start_learning.dart';

import 'screens/listen_and_guess.dart';
import 'screens/look_and_chooes.dart';
import 'screens/video_learning.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = "https://play.google.com/store/apps/details?id="
      "com.funlearning.brain";
  int index = 0;
  // AdmobHelper admobHelper = AdmobHelper();
  @override
  void initState() {
    super.initState();
    // admobHelper.createInterad();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Exit App',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              content: const Text(
                'Do you want to exit an App?',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return OverflowBar(children: [
      PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            showExitPopup();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFFEF7F0),
            elevation: 0,
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: Stack(
                    children: [
                      Container(
                          height: size.height * 0.3 - 27,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFEF7F0),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(36),
                                  bottomRight: Radius.circular(36))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/sun.png"),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Good",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "arlrdbd",
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Morning!",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: "arlrdbd",
                                          color: Color(0xFFF19335),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 15,
                        children: [
                          InkWell(
                            onTap: () {
                              // admobHelper.showInterad();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LetsStartLearning(index)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFE4F2E6),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/number.png",
                                    height: 90,
                                  ),
                                  const Text(
                                    'Lets Start Learning',
                                    style: TextStyle(
                                        fontFamily: "arlrdbd",
                                        color: Color(0xFF6DB072)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // admobHelper.showInterad();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VideoLearning()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF9F4),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/video.png",
                                    height: 90,
                                  ),
                                  const Text(
                                    'Video Learning',
                                    style: TextStyle(
                                        fontFamily: "arlrdbd",
                                        color: Color(0xFFEC9E4E)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // admobHelper.showInterad();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LookAndChooes(index)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFEF9E4),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/apple.png",
                                    height: 90,
                                  ),
                                  const Text(
                                    'Look And Choose',
                                    style: TextStyle(
                                        fontFamily: "arlrdbd",
                                        color: Color(0xFFF2CC2B)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // admobHelper.showInterad();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ListenGuess()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFEBE8FD),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/lione.png",
                                    height: 90,
                                  ),
                                  const Text(
                                    'Listen and Guess',
                                    style: TextStyle(
                                        fontFamily: "arlrdbd",
                                        color: Color(0xFF8770E4)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
