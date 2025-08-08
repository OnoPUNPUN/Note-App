import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_new/Models/note_database.dart';
import 'package:note_app_new/Widgets/note_card.dart';
import 'package:note_app_new/Widgets/notes_app_bar.dart';

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

  // delete a notes
  void deleteNote(int id) {
    noteDatabase.deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotesAppBar(title: 'Notes'),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: GetBuilder<NoteDatabase>(
              builder: (controller) {
                final currentNotes = controller.currenNote;

                if (currentNotes.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sticky_note_2_outlined,
                          size: 80,
                          color: Colors.grey.withValues(alpha: 0.4),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "It's Quiet Here 😴",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Create a new note to get started.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: currentNotes.length,
                  itemBuilder: (context, index) {
                    final note = currentNotes[index];
                    return Card(
                      elevation: 0,
                      child: NoteCard(
                        title: note.title,
                        description: note.description,
                        lasEdited: note.lastEdited.toString(),
                        onEditPressed: () {},
                        onDeletePressed: () => deleteNote(note.id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
