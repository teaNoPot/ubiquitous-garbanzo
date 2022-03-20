import 'package:flutter/material.dart';

class WrapExample extends StatelessWidget {
  const WrapExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 9.0,
      runSpacing: 4.0,
      children: ['HIBA', 'SALAH', 'HONDA', 'SUZUKI', 'KOOLA']
          .map(
            (String name) => Chip(
                avatar: CircleAvatar(child: Text(name.substring(0, 1))),
                label: Text(name)),
          )
          .toList(),
    );
  }
}
