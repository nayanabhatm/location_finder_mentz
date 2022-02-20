import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentz_project/utils/styles.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(Styles.padding20),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.padding10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.exclamationTriangle,
              size: Styles.radius30,
            ),
            const SizedBox(
              height: Styles.padding20,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
