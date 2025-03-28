import 'package:flutter/material.dart';

class Plantitle extends StatelessWidget {
  const Plantitle({
    super.key,
    required title,
  }) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffFAF1E6).withOpacity(0.55),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Outfit"
        ),
      )
    );
  }
}