import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app_new/Widgets/note_settings.dart';
import 'package:popover/popover.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  final String lasEdited;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  const NoteCard({
    super.key,
    required this.title,
    required this.description,
    required this.lasEdited,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF6370A0),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            'Edited $lasEdited',
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF6370A0),
            ),
          ),
        ],
      ),
      trailing: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () => showPopover(
              width: 100,
              height: 100,
              backgroundColor: Theme.of(context).colorScheme.surface,
              context: context,
              bodyBuilder: (context) => NotesSettings(
                onEditPressed: onEditPressed,
                onDeletePressed: onDeletePressed,
              ),
            ),
            icon: const Icon(Icons.menu),
          );
        },
      ),
    );
  }
}
