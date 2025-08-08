import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_new/Models/note_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  static const String name = '/notes-pages';

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NoteDatabase noteDatabase = Get.find<NoteDatabase>();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  // Read all notes
  void readNotes() {
    noteDatabase.fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
