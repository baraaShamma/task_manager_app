import 'package:flutter/material.dart';

class ButtonAuthWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const ButtonAuthWidget({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 50),
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
