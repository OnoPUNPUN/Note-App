import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Notes',
        style: GoogleFonts.roboto(fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      elevation: 0,
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add, size: 35))],
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
