

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final VoidCallback? onPress;


   const RoundButton({super.key, required this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        child: Text(
          title
        ),
      ),
    );
  }
}
