import 'package:flutter/material.dart';
import 'package:notes/widgets/allnote.dart';
import 'package:notes/widgets/generalnote.dart';
import 'package:notes/widgets/notestitle.dart';
import 'package:notes/widgets/studynote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  final List<String> _texts = ["All", "General", "Study", "Reminder"];

  @override
  Widget build(BuildContext context) {
    
    final Size _size = MediaQuery.of(context).size;
    
    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: const Color(0xff1e1e1e),
        title: const Text(
          "My Notes",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Outfit",
            fontSize: 50,
            fontWeight: FontWeight.w600
          ),
        ),
        // To make new notes
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: FloatingActionButton(
              onPressed: () {}, 
              backgroundColor: const Color(0xff99BC85),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.add, size: 40,),
            ),
          )
        ],
      ),

      backgroundColor: const Color(0xff1e1e1e),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        // Main body
        child: Column(
          children: [

            SizedBox(
              height: _size.height/30,
            ),

            //Row containing different notes title
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  _texts.length, 
                  (index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Notestitle(size: _size, bool: _selectedIndex == index, title: _texts[index],),
                      ),
                    );
                  }
                )
              ),
            ),

            SizedBox(
              height: _size.height/30,
            ),

            // Contains below body
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: switch (_selectedIndex) {
                  0  => AllNote(size: _size),
                  1 => Generalnote(size: _size),
                  2 => const Studynote(),
                  _ => const Center(child: Text("Invalid Selection"))
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
