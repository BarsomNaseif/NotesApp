import 'package:flutter/material.dart';
import 'package:notes_app/views/constnts.dart';
import 'package:notes_app/views/widget/customTextForm.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
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
            },
          ),
          const SizedBox(
            height: 55,
          ),
          MaterialButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              } else {
                _autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            child: Text(
              'Add',
              style: TextStyle(color: Colors.black),
            ),
            color: KprimaryColor,
            height: 40,
          )
        ],
      ),
    );
  }
}
