import 'package:flutter/material.dart';

class FractionallySizedBoxExample extends StatelessWidget {
  const FractionallySizedBoxExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 20),
        Text('leagueOFthem'),
        Text('leagueOFthem ROW'),
        Flexible(
            child: FractionallySizedBox(
          heightFactor: 0.1,
        )),
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.2,
            widthFactor: 0.5,
            child: Placeholder(),
          ),
        ),
      ],
    );
  }
}
