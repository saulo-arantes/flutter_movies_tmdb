import 'package:flutter/material.dart';

class GenreListDropdownWidget extends StatelessWidget {
  const GenreListDropdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: 'a',
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? genre) {},
      items: const [],
    );
  }
}