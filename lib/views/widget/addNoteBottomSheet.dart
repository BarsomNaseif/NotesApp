import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_state.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/constnts.dart';
import 'package:notes_app/views/widget/customTextForm.dart';

import '../../cubits/add_note_cubit.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child:
          BlocConsumer<AddNoteCubit, AddNoteState>(listener: (context, state) {
        if (state is AddNoteSuccess) {
          Navigator.pop(context);
        }
        if (state is AddNoteError) {
          print("Error   : ${state.error}");
        }
      }, builder: (context, state) {
        return SingleChildScrollView(child: const AddNoteForm());
      }),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    return Form(
      autovalidateMode: _autovalidateMode,
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          customTextForm(
            onSaved: (v) {
              title = v;
            },
            Hint: 'Title',
          ),
          const SizedBox(
            height: 15,
          ),
          customTextForm(
            Hint: 'content',
            maxLines: 5,
            onSaved: (v) {
              subTitle = v;
              print(subTitle);
              print('##############');
            },
          ),
          const SizedBox(
            height: 55,
          ),
          MaterialButton(
            color: KprimaryColor,
            height: 40,
            child: Text(
              'Add',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                var note = NoteModel(
                  color: Colors.blue.value,
                  suptitle: subTitle!,
                  data: DateTime.now().toString(),
                  title: title!,
                );
                BlocProvider.of<AddNoteCubit>(context).addNotes(note);
              } else {
                _autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }
}
