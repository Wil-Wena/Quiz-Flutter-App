import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

class ScoreAnimation extends StatefulWidget {
  const ScoreAnimation({Key? key}) : super(key: key);

  @override
  State<ScoreAnimation> createState() => _ScoreAnimationState();
}

class _ScoreAnimationState extends State<ScoreAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..repeat(reverse: false);
  late final Animation<Offset> _animation = Tween(
          begin: Offset.fromDirection(1.50), end: Offset.fromDirection(-1.50))
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInBack));

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset(
        'assets/pngwing.com (8).png',
        height: 500,
        width: 300,
      ),
    );
  }
}
