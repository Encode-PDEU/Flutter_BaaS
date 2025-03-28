
import 'package:flutter/material.dart';
import 'package:notes/model/notes.dart';
import 'package:notes/screens/editnote.dart';
import 'package:notes/widgets/plantitle.dart';
import 'package:quickanimate/quickanimate.dart';

class AllNote extends StatefulWidget {
  const AllNote({
    super.key,
    required Size size,
  }) : _size = size;

  final Size _size;

  @override
  State<AllNote> createState() => _AllNoteState();
}

class _AllNoteState extends State<AllNote> {

  
  final List<String> _plans = ["Drink Water", "Gym", "Meeting"];
  final List<Note> _notes = [Note(category: NoteType.general, heading: "Note 1", color: const Color(0xffE8F9FF), content: "This is note 1,This is note 1This is note 1This is note 1This is note 1"),
  Note(category: NoteType.general, heading: "Note 2", color: const Color(0xffF6F8D5), content: "This is note 2")];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Contains big column in a row of quote and plan
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                height: widget._size.height/3.2,
                decoration: BoxDecoration(
                  color: const Color(0xff99BC85),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quote of Day",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You have to believe in yourself when no one else does.",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w200
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image(
                      image: AssetImage("assets/images/vector.png"),
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                height: widget._size.height/3.2,
                decoration: BoxDecoration(
                  color: const Color(0xffEC5228),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    const Text(
                      "Plan for Day",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: List.generate(_plans.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Plantitle(title: _plans[index]),
                          ),
                        );
                      })
                    )
                  ],
                ),
              ),
            )
          ],
        ),
                  
        SizedBox(
          height: widget._size.height/30,
        ),
    
        // Contains different notes and important stuff
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _notes.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransitionAnimation(
                    mode: PageTransitionMode.fade,
                    duration: const Duration(milliseconds: 800),
                    page: Editnote(note: _notes[index],)
                  )
                );
              },
              onLongPress: () {},
              child: Container(
                padding: const EdgeInsets.all(10.0),
                height: widget._size.height/5,
                decoration: BoxDecoration(
                  color: _notes[index].color,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _notes[index].heading,
                      style: const TextStyle(
                        fontFamily: "Tangerine",
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      _notes[index].content,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: "Outfit",
                        color: Colors.black,
                        fontSize: 15
                      ),
                    )
                  ],
                ),
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 10.0,); },
        )
    
      ],
    );
  }
}