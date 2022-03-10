import 'package:flutter/material.dart';

class NamedButton extends StatelessWidget {
  final Function? function;
  final String title;
  const NamedButton({Key? key, this.function, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.lightGreen, borderRadius: BorderRadius.circular(10)),
        child: TextButton(
            onPressed: () => function!(),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5))));
  }
}
