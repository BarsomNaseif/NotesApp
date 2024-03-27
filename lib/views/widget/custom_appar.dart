import 'package:flutter/material.dart';

class customAppar extends StatelessWidget {
  const customAppar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        title: const Text(
          'Notes app ',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      );
  }
}