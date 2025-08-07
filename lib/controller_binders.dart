import 'package:get/get.dart';
import 'package:note_app_new/Models/note_database.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(NoteDatabase());
  }
}
