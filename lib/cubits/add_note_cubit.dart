import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/add_note_state.dart';
import 'package:notes_app/model/note_model.dart';

import '../views/constnts.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNotes(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>(KNoteBox);

      await box.add(note);

      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteError(e.toString()));
    }
  }
}
