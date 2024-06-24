import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Homework extends StatefulWidget {
  const Homework({super.key});

  @override
  State<Homework> createState() => _HomeworkState();
}

class _HomeworkState extends State<Homework> {
  bool toggleButton = true;
  int currentIndex = 0;
  late PageController pageController;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 1, initialPage: 0);
    startAutoScrolling();
  }

  void startAutoScrolling() {
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (currentIndex < 15) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }

        pageController.animateToPage(currentIndex,
            duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: toggleButton ? Colors.black : Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 300,
              child: PageView.builder(
                pageSnapping: true,
                onPageChanged: (value) {
                  currentIndex = value;
                },
                controller: pageController,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    color: Colors.accents[Random().nextInt(5)],
                    height: 300,
                    child: Image.network(
                      "https://generatorfun.com/code/uploads/Random-Nature-image-${currentIndex + 1}.jpg",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                toggleButton = !toggleButton;
              });
            },
            child: Center(
              child: AnimatedContainer(
                height: 40,
                width: 100,
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(!toggleButton
                        ? "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRYTMcrChd0xogo54QFX2Ke8yxM_Gw5BhJjmTJ2AnvDtbB7o9Ne"
                        : "https://t4.ftcdn.net/jpg/00/43/47/83/360_F_43478384_ldgEhe1lK2CpACBsCyQ1PU5nSAWAaTzB.jpg"),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    toggleButton = !toggleButton;
                    setState(() {});
                  },
                  child: AnimatedAlign(
                    alignment: toggleButton
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
