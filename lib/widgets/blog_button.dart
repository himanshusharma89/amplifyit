import 'package:flutter/material.dart';

class BlogButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const BlogButton({Key key, this.onTap, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            width: double.infinity,
            height: kToolbarHeight - 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 2),
                      color: Colors.grey[300],
                      blurRadius: 6),
                  BoxShadow(
                      offset: Offset(-1, -1),
                      color: Colors.grey[300],
                      blurRadius: 3)
                ]),
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
            )),
      ),
      onTap: onTap,
    );
  }
}
