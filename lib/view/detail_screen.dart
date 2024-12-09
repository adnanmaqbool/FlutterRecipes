import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text("move back"),
        )),
      ),
    );
  }
}
