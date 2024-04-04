import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key});
  TextEditingController seacrhController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: seacrhController,
      decoration: InputDecoration(
        focusColor: Colors.green,
        label: const Row(
          children: [
            Icon(Icons.search),
            Text("Search Here"),
          ],
        ),
        border: OutlineInputBorder(
          gapPadding: 2.0,
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
