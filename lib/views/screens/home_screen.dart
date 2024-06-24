import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Alignment _alignment = Alignment.center;
  bool isBig = false;

  final List _list = [
    Alignment.center,
    Alignment.bottomCenter,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.topLeft,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomRight
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: const Duration(seconds: 1),
      data: ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Animation",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: AnimatedList(
            initialItemCount: 40,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: ListTile(
                  title: Text("Nimdir $index"),
                ),
              );
            }),

        // body: Column(
        //   children: [
        //     AnimatedAlign(
        //       alignment: _alignment,
        //       duration: const Duration(seconds: 1),
        //       child: AnimatedContainer(
        //         duration: const Duration(seconds: 1),
        //         width: isBig ? 400 : 100,
        //         height: isBig ? 400 : 100,
        //         color: isBig ? Colors.blue : Colors.amber,
        //         child: AnimatedDefaultTextStyle(
        //           style: isBig
        //               ? const TextStyle(fontSize: 50, color: Colors.white)
        //               : const TextStyle(fontSize: 30, color: Colors.black),
        //           duration: const Duration(seconds: 1),
        //           child: const Text("Hello Flutter"),
        //         ),
        //       ),
        //     ),
        //     AnimatedOpacity(
        //       opacity: isBig ? 1 : 0.2,
        //       duration: const Duration(seconds: 1),
        //       child: const FlutterLogo(
        //         size: 50,
        //       ),
        //     ),
        //     AnimatedPadding(
        //       padding: EdgeInsets.all(isBig ? 50 : 0),
        //       duration: const Duration(seconds: 1),
        //       child: AnimatedPhysicalModel(
        //         borderRadius: BorderRadius.circular(isBig ? 16 : 26),
        //         duration: const Duration(seconds: 1),
        //         elevation: isBig ? 10 : 2,
        //         shadowColor: Colors.amber,
        //         shape: BoxShape.rectangle,
        //         color: Colors.amber,
        //         child: Container(
        //           width: double.infinity,
        //           height: 100,
        //           color: Colors.black,
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        // body: AnimatedAlign(
        //   alignment: _alignment,
        //   duration: const Duration(seconds: 1),
        //   child: const FlutterLogo(
        //     size: 150,
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _alignment = _list[Random().nextInt(_list.length - 1)];
            isBig = !isBig;
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
