import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/notesCubits/notes_states.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/constnts.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NotesInitial());
  
  List<NoteModel>? notes;


  fetchAllNotes() async {
    var box = Hive.box<NoteModel>(KNoteBox);

    notes = box.values.toList();
    emit(NoteSuccess());
  }
}
