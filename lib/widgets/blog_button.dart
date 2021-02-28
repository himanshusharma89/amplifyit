import 'package:flutter/material.dart';

class BlogButton extends StatelessWidget {
  const BlogButton({Key key, this.onTap, this.text}) : super(key: key);
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            width: double.infinity,
            height: kToolbarHeight - 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: const Offset(2, 2),
                      color: Colors.grey[300],
                      blurRadius: 6),
                  BoxShadow(
                      offset: const Offset(-1, -1),
                      color: Colors.grey[300],
                      blurRadius: 3)
                ]),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            )),
      ),
    );
  }
}
