// screens/add_note_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app_new/Models/note_database.dart';
import 'package:note_app_new/Widgets/notes_app_bar.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});
  static const String name = '/add-note-page';
  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final NoteDatabase noteDatabase = Get.find<NoteDatabase>();
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: NotesAppBar(title: 'Add Note'),
      body: SafeArea(
        child: Form(
          key: _globalKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: GoogleFonts.roboto(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _titleTEController,
                  decoration: const InputDecoration(),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Content',
                  style: GoogleFonts.roboto(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: TextFormField(
                    controller: _descriptionTEController,
                    maxLines: null,
                    expands: true,
                    decoration: const InputDecoration(),
                    validator: (String? value) {
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        addNote();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.secondary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Save',
                            style: TextStyle(color: colorScheme.inversePrimary),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: colorScheme.inversePrimary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addNote() {
    if (_globalKey.currentState?.validate() ?? false) {
      noteDatabase.addNote(
        _titleTEController.text.trim(),
        _descriptionTEController.text.trim(),
      );
      Get.back();
    }
  }
}
