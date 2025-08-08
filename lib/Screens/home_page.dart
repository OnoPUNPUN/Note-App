import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app_new/Screens/notes_page.dart';
import 'package:note_app_new/Screens/settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String name = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [NotesPage(), SettingsScreen()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Column(children: [Icon(Icons.list), Text('List')]),
            activeIcon: Column(
              children: [
                Icon(Icons.list),
                Text(
                  'List',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(children: [Icon(Icons.settings), Text('Settings')]),
            activeIcon: Column(
              children: [
                Icon(Icons.settings),
                Text(
                  'Settings',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            label: '',
          ),
        ],
        selectedItemColor: Color.fromRGBO(124, 140, 180, 1.0),
        currentIndex: _selectedIndex,
        onTap: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        iconSize: 35,
        selectedFontSize: 16,
        unselectedFontSize: 16,
      ),
    );
  }
}
