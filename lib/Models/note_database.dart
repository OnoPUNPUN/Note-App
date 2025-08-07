import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:note_app_new/Models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends GetxController {
  static late Isar isar;

  // I N I T I A L I Z E - D A T A B A S E
  static Future<void> initialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  // List of Notes
  final List<Note> currenNote = [];

  // C R E A T E --a note
  Future<void> addNote(String title, String description) async {
    final newNote = Note()
      ..title = title
      ..description = description
      ..lastEdited = DateTime.now();

    await isar.writeTxn(() => isar.notes.put(newNote));
  }

  // R E A D -- all notes
  Future<void> fetchNotes() async {
    final fetchedNotes = await isar.notes.where().findAll();

    // sort by lastEdited desc
    fetchedNotes.sort((a, b) => b.lastEdited.compareTo(a.lastEdited));

    currenNote
      ..clear()
      ..addAll(fetchedNotes);

    update(); // Getx Update
  }

  // U P D A T E -- a note
  Future<void> updateNote(
    int id,
    String newTitle,
    String newDescription,
  ) async {
    final existingNote = await isar.notes.get(id);

    if (existingNote != null) {
      existingNote.title = newTitle;
      existingNote.description = newDescription;
      existingNote.lastEdited = DateTime.now();

      await isar.writeTxn(() => isar.notes.put(existingNote));

      await fetchNotes();
    }
  }

  // D E L E T E -- a note
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
