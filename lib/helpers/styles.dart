import 'package:flutter/material.dart';

BoxShadow shadow() {
  return const BoxShadow(
      color: Colors.black,
      offset: Offset(2, 2),
      blurRadius: 1.0,
      spreadRadius: 0.5);
}

Icon minus() {
  return const Icon(
    Icons.remove,
    color: Colors.white,
  );
}

Icon plus() {
  return const Icon(
    Icons.add,
    color: Colors.white,
  );
}

Widget roundButton(_function, Icon _iconUsed) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [shadow()],
      color: Colors.lightBlue,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    child: IconButton(
      onPressed: _function,
      icon: _iconUsed,
    ),
  );
}

Widget levelBlock() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("Level", style: TextStyle(fontSize: 20)),
  );
}

Widget modBlock(String modi) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("$modi Modifer", style: const TextStyle(fontSize: 20)),
  );
}

Widget numberbetween(int _int) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      "$_int",
      style: const TextStyle(fontSize: 24),
    ),
  );
}

Widget restButton(String _text, _function) {
  return Container(
    decoration: BoxDecoration(
        boxShadow: [shadow()],
        color: Colors.lightBlue,
        border: Border.all(width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          onPressed: _function,
          child: Text(_text, style: const TextStyle(color: Colors.white))),
    ),
  );
}
