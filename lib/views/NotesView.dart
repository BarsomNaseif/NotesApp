import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/views/widget/addNoteBottomSheet.dart';

import 'widget/FloatingActionButton.dart';
import 'widget/customListNotes.dart';
import 'widget/custom_appar.dart';

class notesView extends StatelessWidget {
  const notesView({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return const Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      body: Column(
        children: [
          customAppar(),
          SizedBox(
            height: 10,
          ),
          Expanded(child: customListNotis()),
        ],
      ),
    );
  }
}
