import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:note_app_new/Screens/add_note_page.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const NotesAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.roboto(fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => onTapAddButton(),
          icon: Icon(Icons.add, size: 35),
        ),
      ],
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void onTapAddButton() {
    Get.toNamed(AddNotePage.name);
  }
}
