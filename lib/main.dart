import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/addCubits/add_note_cubit.dart';
import 'package:notes_app/cubits/notesCubits/notes_cubits.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/simple_block_observer.dart';
import 'package:notes_app/views/constnts.dart';
import 'views/NotesView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlockObserver();

 
  Hive.registerAdapter(NoteModelAdapter());
   await Hive.openBox<NoteModel>(KNoteBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddNoteCubit>(
          create: (context) => AddNoteCubit(),
        ),
          BlocProvider<NoteCubit>(
          create: (context) => NoteCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: notesView(),
      ),
    );
  }
}
