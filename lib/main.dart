import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:note_app_new/Models/note_database.dart';
import 'package:note_app_new/Screens/home_page.dart';
import 'package:note_app_new/controller_binders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  ControllerBinders().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinders(),
      home: const HomePage(),
    );
  }
}
