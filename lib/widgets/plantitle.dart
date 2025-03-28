import 'package:flutter/material.dart';

class Plantitle extends StatefulWidget {
  const Plantitle({
    super.key,
    required title,
  }) : _title = title;

  final String _title;

  @override
  State<Plantitle> createState() => _PlantitleState();
}

class _PlantitleState extends State<Plantitle> {

  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          completed = !completed;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffFAF1E6).withOpacity(0.55),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget._title,
          textAlign: TextAlign.center,
          style: TextStyle(
            decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
            decorationColor : Colors.black,
            color: Colors.black,
            fontFamily: "Outfit"
          ),
        )
      ),
    );
  }
}