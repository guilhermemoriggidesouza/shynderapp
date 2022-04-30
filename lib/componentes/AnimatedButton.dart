import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  IconData icon;
  Function onClick;
  AnimatedButton(this.icon, this.onClick);
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller?.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller?.reverse();
    widget.onClick();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller!.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffE4BCC3),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              widget.icon,
              color: Colors.black,
            ),
          ),
        ),
      );
}
