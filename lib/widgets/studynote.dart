import 'package:flutter/material.dart';

class Studynote extends StatefulWidget {
  const Studynote({super.key});

  @override
  State<Studynote> createState() => _StudynoteState();
}

class _StudynoteState extends State<Studynote> {

  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late TextEditingController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController(text: "Drink water");
    _controller2 = TextEditingController(text: "Gym");
    _controller3 = TextEditingController(text: "Study");
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Plan for Day",
              style: TextStyle(
                color: Color(0xffEC5228),
                fontFamily: "Outfit",
                fontSize: 30
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white
              ),
              onPressed: () {}, 
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Color(0xff1e1e1e),
                  fontFamily: "Outfit",
                  fontSize: 20
                ),
              )
            )
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _controller1,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Outfit",
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
          decoration: InputDecoration(
            hintText: "Enter task",
            hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: "Outfit",
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
            filled: true,
            fillColor: const Color(0xff2e2e2e),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16), // Spacing
        TextField(
          controller: _controller2,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Outfit",
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
          decoration: InputDecoration(
            hintText: "Enter task",
            hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: "Outfit",
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
            filled: true,
            fillColor: const Color(0xff2e2e2e),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16), // Spacing
        TextField(
          controller: _controller3,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Outfit",
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
          decoration: InputDecoration(
            hintText: "Enter task",
            hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: "Outfit",
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
            filled: true,
            fillColor: const Color(0xff2e2e2e),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        

      ],
    );
  }
}