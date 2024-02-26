import 'package:flutter/material.dart';

class CreateDocScreen extends StatelessWidget {
  const CreateDocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: colors.primary,
          title: const Center(
              child: Text(
            'Arr Documentation',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        body: const Center(child: Text("Create Doc Screen")),
        floatingActionButton: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black87,
          ),
          child: GestureDetector(
            
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Save All",
                style: TextStyle(
                  color: Color.fromARGB(210, 216, 216, 216),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ));
  }
}

// Components

//  Title
// Description
// Code blocks



