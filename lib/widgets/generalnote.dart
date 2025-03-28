import 'package:flutter/material.dart';
import 'package:notes/model/notes.dart';
import 'package:notes/screens/editnote.dart';
import 'package:quickanimate/quickanimate.dart';

class Generalnote extends StatefulWidget {
  const Generalnote({
    super.key,
    required Size size,
  }) : _size = size;

  final Size _size;

  @override
  State<Generalnote> createState() => _GeneralnoteState();
}

class _GeneralnoteState extends State<Generalnote> {

  final List<Note> _notes = [Note(category: NoteType.general, heading: "Note 1", color: const Color(0xffE8F9FF), content: "This is note 1,This is note 1This is note 1This is note 1This is note 1"),
  Note(category: NoteType.general, heading: "Note 2", color: const Color(0xffF6F8D5), content: "This is note 2")];

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      beginScale: 1.2,
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastEaseInToSlowEaseOut,
      child: Column(
        children: [
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
                      page: Editnote(note: _notes[index],selectedindex: 1,)
                    )
                  );
                },
                onLongPress: () {
      
                  //Delete Logic
      
                },
                child: _note(index),
              );
            }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 10.0,); },
          )
        ],
      ),
    );
  }

  Container _note(int index) {
    return Container(
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
            );
  }
}