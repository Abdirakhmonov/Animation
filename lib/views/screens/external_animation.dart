import 'package:flutter/material.dart';

class ExternalAnimation extends StatefulWidget {
  const ExternalAnimation({super.key});

  @override
  State<ExternalAnimation> createState() => _ExternalAnimationState();
}

class _ExternalAnimationState extends State<ExternalAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> _containerAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _containerAnimation = Tween<double>(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "External Animation",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (animationController.value * 100).toStringAsFixed(0),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  width: _containerAnimation.value,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: Colors.blue,
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.forward();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
