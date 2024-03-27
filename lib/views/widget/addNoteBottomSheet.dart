import 'package:flutter/material.dart';
import 'package:notes_app/views/constnts.dart';
import 'package:notes_app/views/widget/customTextForm.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const customTextForm(
              Hint: 'Title',
            ),
            const SizedBox(
              height: 15,
            ),
            const customTextForm(
              Hint: 'content',
              maxLines: 5,
            ),
            const SizedBox(
              height: 55,
            ),
            MaterialButton(
              onPressed: () {},
              child: Text('Add',style: TextStyle(color: Colors.black),),
              color: KprimaryColor,
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
