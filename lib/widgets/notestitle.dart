import 'package:flutter/material.dart';

class Notestitle extends StatelessWidget {
  const Notestitle({
    super.key,
    required Size size,
    required bool  bool,
    required this.title,
  }) : _size = size, _bool = bool;

  final Size _size;
  final bool _bool;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: _size.height/ 20,
      decoration: BoxDecoration(
        border: Border.all(
          color: _bool ? Colors.white : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "Outfit",
            color: _bool ? Colors.white : Colors.grey,
            fontWeight: _bool ? FontWeight.w700 : FontWeight.w500,
            fontSize: 20
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}