import 'package:flutter/material.dart';
import 'package:food_delivery/views/home_screen.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../animation/fade_animation.dart';

class StarterScreen extends StatefulWidget {
  const StarterScreen({super.key});

  @override
  State<StarterScreen> createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  bool textVisible = true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween(begin: 0.0, end: 25).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _onTap() {
    setState(() {
      textVisible = false;
    });

    _animationController.forward().then((value) => {
          Navigator.push(
              context,
              PageAnimationTransition(
                  page: HomePage(), pageAnimationType: BottomToTopTransition()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/starter-image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FadeAnimation(
                  .6,
                  Text(
                    'Taking Order For Delivery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'See restarunt nearby \nadding location',
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.4,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 80),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.orange,
                      ],
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () => _onTap(),
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  child: Text(
                    'Now deliver to your Door 24/7',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
