import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.orange,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: [
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                            RedCircle(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.amber,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                RedCircle(),
                                SizedBox(width: 6),
                                RedCircle(),
                                Spacer(),
                                RedCircle(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: RedSquare(),
                ),
                // const Positioned(
                //   top: 0,
                //   bottom: 0,
                //   left: 0,
                //   right: 0,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       RedSquare(),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RedSquare extends StatelessWidget {
  const RedSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: Colors.red,
    );
  }
}

class RedCircle extends StatelessWidget {
  const RedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
      ),
    );
  }
}
