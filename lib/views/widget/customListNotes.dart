import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notesCubits/notes_cubits.dart';
import 'package:notes_app/cubits/notesCubits/notes_states.dart';
import 'package:notes_app/model/note_model.dart';

class customListNotis extends StatelessWidget {
  const customListNotis({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
       List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes!;
        return Padding(
        padding: const EdgeInsets.symmetric(vertical: 14,
        horizontal: 8),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.blue),
              child: const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  ListTile(
                    title: Text(
                      'Flutter tips',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Building Flutter Apps with Flutter Tips barsom safwat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                    trailing: Icon(FontAwesomeIcons.trash),
                  ),
                  Text(
                    'May 1, 2022',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ]),
              ),
            ),
          ),
        ),
      );
      }
       
    );
  }
}
