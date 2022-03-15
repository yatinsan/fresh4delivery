import 'package:flutter/material.dart';

class Headerwidget extends StatelessWidget {
  final String title;
  const Headerwidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/viewall');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("more",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(97, 180, 127, 1))),
                Icon(Icons.keyboard_double_arrow_right_outlined,
                    size: 18, color: Color.fromRGBO(97, 180, 127, 1))
              ],
            ),
          )
        ],
      ),
    );
  }
}
