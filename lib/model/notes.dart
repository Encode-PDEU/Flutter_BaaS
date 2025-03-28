import 'package:flutter/material.dart';

enum NoteType {
  all,
  general,
  study,
  reminder
}


class Note {

  Note({
    required this.category,
    required this.heading,
    required this.color,
    required this.content,
  });

  final NoteType category;
  final String heading;
  final Color color;
  final String content;

}